import 'dart:io';

import 'package:cmsocpp/app/presentation/bottom_sheet/exit_app.dart';
import 'package:cmsocpp/app/presentation/screens/login/login_screen.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/base_configs/controller/style_controller.dart';
import 'package:cmsocpp/base_configs/controller/utility_controller.dart';
import 'package:cmsocpp/core/base/base_instance.dart';
import 'package:cmsocpp/utils/enums.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DeviceInfo {
  int deviceType = 0;
  String deviceToken = '';

  DeviceInfo({required this.deviceType, required this.deviceToken});
}

class CommonMethods {
  CommonMethods._();

  // Get device information
  static Future<DeviceInfo> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    DeviceInfo deviceInfo;
    if (Platform.isIOS) {
      var info = await deviceInfoPlugin.iosInfo;
      deviceInfo = DeviceInfo(deviceType: 2, deviceToken: info.identifierForVendor!);
    } else {
      var info = await deviceInfoPlugin.androidInfo;
      deviceInfo = DeviceInfo(deviceType: 1, deviceToken: info.id);
    }
    return deviceInfo;
  }

  // Show snack bar for positive messages
  static showSnackBarSuccess(String message) {
    Get.snackbar(
      StringConfig.successTitle,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorConfig.snackBarSuccessColor,
      colorText: ColorConfig.whiteColor,
      animationDuration: const Duration(milliseconds: 800),
      duration: const Duration(seconds: 3),
      margin: EdgeInsets.only(bottom: 10.r, left: 10.r, right: 10.r),
    );
  }

  // Show snack bar for error messages
  static showSnackBarError(String message) {
    Get.snackbar(
      StringConfig.errorTitle,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorConfig.snackBarErrorColor,
      colorText: ColorConfig.whiteColor,
      animationDuration: const Duration(milliseconds: 800),
      duration: const Duration(seconds: 4),
      margin: EdgeInsets.only(bottom: 10.r, left: 10.r, right: 10.r),
    );
  }

  // Get mobile number in 164 format
  static String getMobileNumber({required String mobile, required int countryCode}) {
    return '+ $countryCode $mobile';
  }

  // clear user data from local
  static void clearLocalData() {
    UtilityController utility = BaseInstance.get();
    bool isDarkTheme = utility.localStorage.getIsDarkTheme() ?? false;
    utility.localStorage.clearAll();
    utility.localStorage.saveIsDarkTheme(isDarkTheme);
    Get.offAll(() => const LoginScreen());
  }

  // Show snack bar for info messages
  static showSnackBarInfo(String message, String title) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorConfig.partialProgressColor,
      colorText: ColorConfig.blackColor,
      animationDuration: const Duration(milliseconds: 800),
      duration: const Duration(seconds: 4),
      margin: EdgeInsets.only(bottom: 10.r, left: 10.r, right: 10.r),
    );
  }

  // To dismiss keyboard
  static hideKeyBoard() {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
  }

  static int getSelectedChargeByType(ChargeBy chargeBy) {
    switch (chargeBy) {
      case ChargeBy.time:
        return ChargeBy.time.value;
      case ChargeBy.energy:
        return ChargeBy.energy.value;
      case ChargeBy.amount:
        return ChargeBy.amount.value;
      default:
        return ChargeBy.energy.value;
    }
  }

  static ChargeBy getChargeByType(int chargeBy) {
    switch (chargeBy) {
      case 1:
        return ChargeBy.time;
      case 2:
        return ChargeBy.energy;
      case 3:
        return ChargeBy.amount;
      default:
        return ChargeBy.energy;
    }
  }

  static ConnectorStatus getStatusFromApi(String? status) {
    if (status == ConnectorStatus.available.value) {
      return ConnectorStatus.available;
    } else if (status == ConnectorStatus.unAvailable.value) {
      return ConnectorStatus.unAvailable;
    } else if (status == ConnectorStatus.faulty.value) {
      return ConnectorStatus.faulty;
    } else if (status == ConnectorStatus.inUse.value) {
      return ConnectorStatus.inUse;
    } else if (status == ConnectorStatus.free.value) {
      return ConnectorStatus.free;
    } else if (status == ConnectorStatus.paid.value) {
      return ConnectorStatus.paid;
    } else {
      return ConnectorStatus.faulty;
    }
  }

  static Color? getColorByConnectorStatus(ConnectorStatus? status, BaseFlavorConfig flavor) {
    switch (status) {
      case ConnectorStatus.available:
        return flavor.appColors!.primaryColor;
      case ConnectorStatus.unAvailable:
        return flavor.appColors!.unAvailableStatusColor;
      case ConnectorStatus.faulty:
        return flavor.appColors!.faultyStatusColor;
      case ConnectorStatus.inUse:
        return ColorConfig.inUseStatusColor;
      case ConnectorStatus.free:
        return ColorConfig.freeStatusColor;
      case ConnectorStatus.paid:
        return ColorConfig.paidStatusColor;

      default:
        return flavor.appColors!.faultyStatusColor;
    }
  }

  static String? getIconByConnectorStatus(ConnectorStatus? status, BaseFlavorConfig flavor) {
    switch (status) {
      case ConnectorStatus.available:
        return AssetsConfig.markerIconGreen;
      case ConnectorStatus.unAvailable:
        return AssetsConfig.markerIconGrey;
      case ConnectorStatus.faulty:
        return AssetsConfig.markerIconRed;
      case ConnectorStatus.inUse:
        return AssetsConfig.markerIconYellow;
      case ConnectorStatus.free:
        return AssetsConfig.markerIconBlue;
      case ConnectorStatus.paid:
        return AssetsConfig.markerIconOrange;
      default:
        return AssetsConfig.markerIconRed;
    }
  }

  // For set app native status bar color according theme change
  static getAppStatusBarTheme({required UtilityController utility}) {
    bool isDarkTheme = utility.localStorage.getIsDarkTheme()!;
    if (isDarkTheme) {
      Platform.isIOS
          ? SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light)
          : SystemChrome.setSystemUIOverlayStyle(
              const SystemUiOverlayStyle(
                statusBarColor: ColorConfig.blackColor,
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.light,
              ),
            );
    } else {
      Platform.isIOS
          ? SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light)
          : SystemChrome.setSystemUIOverlayStyle(
              const SystemUiOverlayStyle(
                statusBarColor: ColorConfig.whiteColor,
                statusBarBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.dark,
              ),
            );
    }
  }

  // To open app exit confirmation dialog
  static openBottomSheetForExitAppConfirmation({
    required Color appBgColor,
    required BaseFlavorConfig flavor,
    required StyleController styles,
  }) {
    Get.bottomSheet(
      CloseAppConfirmation(flavor: flavor, styles: styles),
      backgroundColor: appBgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
    );
  }

  static onCancel() {
    Get.back();
  }

  // To go back
  static onBackPress() async {
    SystemNavigator.pop();
  }
}
