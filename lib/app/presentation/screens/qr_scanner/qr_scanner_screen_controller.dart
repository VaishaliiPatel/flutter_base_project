import 'dart:async';
import 'dart:io';

import 'package:cmsocpp/app/presentation/dialogs/charge_id_dialog.dart';
import 'package:cmsocpp/app/presentation/screens/charge_by/charge_by_screen.dart';
import 'package:cmsocpp/app/presentation/screens/home/home_screen_controller.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/base_configs/controller/style_controller.dart';
import 'package:cmsocpp/base_configs/controller/utility_controller.dart';
import 'package:cmsocpp/core/base/base_instance.dart';
import 'package:cmsocpp/utils/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScannerScreenController extends SuperController with GetTickerProviderStateMixin {
  final UtilityController _utility;
  Barcode? result;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? _controller;
  String localChargeId = '';
  final formKey = GlobalKey<FormState>();
  String chargeId = '';
  String errorMsg = '';
  bool isValidateChargerApiCalling = false;

  // Use this id for prevent start animation on submit charger id
  bool isChargerIdSubmitted = false;

  // For API call
  final Rx<bool> _isLoading = false.obs;

  Rx<bool> get isLoading => _isLoading;
  StreamSubscription? subscription;
  AnimationController? animationController;
  Animation<AlignmentGeometry>? animation;
  Rx<AlignmentGeometry?>? animatedValue = Alignment.topCenter.obs;
  Rx<bool> isCameraPermissionGranted = false.obs;

  @override
  void onInit() {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = AlignmentTween(begin: Alignment.topCenter, end: Alignment.bottomCenter).animate(animationController!)
      ..addListener(animationListener)
      ..addStatusListener(animationStatusListener);
    checkCameraPermissionStatus();
    super.onInit();
  }

  QrScannerScreenController._() : _utility = BaseInstance.get();

  factory QrScannerScreenController() {
    return QrScannerScreenController._();
  }

  void checkCameraPermissionStatus({bool isFromResume = false}) async {
    var status = await Permission.camera.status;
    if (status.isGranted) {
      isCameraPermissionGranted.value = true;
      animationController?.forward();
      if (Platform.isIOS) {
        _controller?.resumeCamera();
      }
    } else {
      if (isFromResume) {
        isCameraPermissionGranted.value = false;
      } else {
        await Permission.camera.request().then((value) {
          if (value == PermissionStatus.permanentlyDenied) {
            isCameraPermissionGranted.value = false;
            CommonMethods.showSnackBarInfo(StringConfig.allowPermission, StringConfig.permission);
          }
        });
      }
    }
  }

  animationListener() {
    // printLog('QR Scanner Animation value----    "${animatedValue!.value}');
    animatedValue!.value = animation!.value;
  }

  animationStatusListener(status) {
    if (status == AnimationStatus.completed) {
      animationController?.reverse();
    } else if (status == AnimationStatus.dismissed) {
      animationController?.forward();
    }
  }

  // After QR scan to pass charger id and validate charger
  void onQRViewCreated(QRViewController controller) {
    _controller = controller;
    subscription?.resume();
    controller.resumeCamera();
    subscription = controller.scannedDataStream.listen((scanData) {
      result = scanData;
      chargeId = scanData.code ?? '';
      // ON scan qr code call validate charger API
      if (chargeId != localChargeId) {
        pauseAnimation();
        validateCharger();
      }
    });
  }

  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  // To open charger id dialogs
  void getDialog() {
    pauseAnimation();
    Get.defaultDialog(
      title: StringConfig.chargerDialogTitle,
      backgroundColor: flavor.appColors!.dialogColor,
      titleStyle: styles.titleStyle,
      contentPadding: EdgeInsets.only(left: 20.w, right: 20.w),
      titlePadding: EdgeInsets.only(top: 30.h, bottom: 30.h, left: 20.w, right: 20.w),
      radius: 12.r,
      content: const CustomChargerIdDialog(),
    ).then(
      (value) {
        if (!isChargerIdSubmitted) {
          _isLoading.value = false;
          resumeAnimation();
        }
      },
    );
  }

  // On submit of charger id dialogs
  void onSubmitChargerId() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    isChargerIdSubmitted = true;
    Get.back();
    // Validate charger id filed
    formKey.currentState!.save();
    pauseAnimation();
    CommonMethods.hideKeyBoard();
    validateCharger();
  }

  // For validate charger  API integration and navigate to charge by screen
  void validateCharger() {
    if (chargeId == '') {
      CommonMethods.showSnackBarError(StringConfig.missingIdError);
      return;
    }
    // Prevent if user is scanning same qr code again and again
    if (!isValidateChargerApiCalling) {
      isValidateChargerApiCalling = true;
      _isLoading.value = true;
      _utility.api.validateCharger(chargerCode: chargeId).then((value) {
        localChargeId = chargeId;
        if (value.status! == 1 &&
            value.data != null &&
            value.data?.connectorId != null &&
            value.data!.connectorId!.isNotEmpty) {
          _isLoading.value = false;
          isValidateChargerApiCalling = false;
          var homeController = BaseInstance.get<HomeScreenController>();
          homeController.onIndexChange(0);
          Get.to(
            () => const ChargeByScreen(),
            arguments: {
              ArgumentsConfig.chargerId: chargeId,
              ArgumentsConfig.connectorList: value.data!.connectorId!,
              ArgumentsConfig.chargerName: value.data!.location ?? '',
              ArgumentsConfig.chargePerUnit: value.data!.tariffPlanCharge ?? '0.0',
            },
          )?.then((value) {
            isChargerIdSubmitted = false;
            resumeAnimation();
            // For clear local charge Id
            // localChargeId = '';
          });
          // If connector list is empty in API response
        } else if (value.data != null && value.data?.connectorId != null && value.data!.connectorId!.isEmpty) {
          isValidateChargerApiCalling = false;
          _isLoading.value = false;
          CommonMethods.showSnackBarError(StringConfig.connectorError);
          resumeAnimation();
          // On wrong charger id
        } else {
          isValidateChargerApiCalling = false;
          errorMsg = value.message ?? StringConfig.connectorError;
          _isLoading.value = false;
          resumeAnimation();
        }
      }).catchError((error) {
        isValidateChargerApiCalling = false;
        _isLoading.value = false;
        resumeAnimation();
      });
    } else {
      resumeAnimation();
    }
  }

  // To cancel popup
  void onCancel() {
    Get.back();
    _isLoading.value = false;
    resumeAnimation();
  }

  // To pause animation
  void pauseAnimation() {
    animation?.removeListener(animationListener);
    animation?.removeStatusListener(animationStatusListener);
    animationController?.stop();
    subscription?.pause();
    _controller?.pauseCamera();
  }

  //  To resume animation
  void resumeAnimation() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (isCameraPermissionGranted.value) {
        animation?.addListener(animationListener);
        animation?.addStatusListener(animationStatusListener);
        animationController?.forward();
        subscription?.resume();
        _controller?.resumeCamera();
      }
    });
  }

  // To pause animation on tab change
  void pauseAnimationOnTabChange() {
    animation?.removeListener(animationListener);
    animation?.removeStatusListener(animationStatusListener);
    animationController?.stop();
    subscription?.pause();
  }

  //  To resume animation on tab change
  void resumeAnimationOnTabChange() {
    if (isCameraPermissionGranted.value) {
      localChargeId = '';
      animation?.addListener(animationListener);
      animation?.addStatusListener(animationStatusListener);
      animationController?.forward();
      subscription?.resume();
    }
  }

  // To remove animation
  void removeAnimation() {
    animation?.removeListener(animationListener);
    animation?.removeStatusListener(animationStatusListener);
    _controller?.stopCamera();
    animationController?.stop();
    subscription?.cancel();
    _controller?.dispose();
    animationController?.dispose();
  }

  @override
  void dispose() {
    removeAnimation();
    super.dispose();
  }

  BaseFlavorConfig get flavor => _utility.flavor.currentFlavor;

  StyleController get styles => _utility.style;

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {
    checkCameraPermissionStatus(isFromResume: true);
  }
}
