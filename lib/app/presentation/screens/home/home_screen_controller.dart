import 'dart:async';

import 'package:cmsocpp/app/presentation/screens/history/history_screen.dart';
import 'package:cmsocpp/app/presentation/screens/map/map_controller.dart';
import 'package:cmsocpp/app/presentation/screens/map/map_screen.dart';
import 'package:cmsocpp/app/presentation/screens/payment/payment_history.dart';
import 'package:cmsocpp/app/presentation/screens/qr_scanner/qr_scanner_screen.dart';
import 'package:cmsocpp/app/presentation/screens/qr_scanner/qr_scanner_screen_controller.dart';
import 'package:cmsocpp/app/presentation/screens/settings/settings_screen.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/base_configs/controller/style_controller.dart';
import 'package:cmsocpp/base_configs/controller/utility_controller.dart';
import 'package:cmsocpp/core/base/base_controller.dart';
import 'package:cmsocpp/core/base/base_instance.dart';
import 'package:cmsocpp/utils/common_methods.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeScreenController extends ScreenController with WidgetsBindingObserver {
  late UtilityController utility;
  late RxInt currentIndex;
  RxInt previousIndex = 0.obs;

  // RxBool isTransactionStart = false.obs;
  // late Timer timer;
  List<Widget> widgetOptions = [
    const MapScreen(),
    const QrScannerScreen(),
    const HistoryScreen(),
    const PaymentHistoryScreen(),
    const SettingsScreen(),
  ];
  late RxBool isDarkTheme;
  String token = '';
  late Dio dio;
  late MapController mapController;
  bool isBack = true;

  @override
  void onInit() {
    mapController = Get.put(MapController());
    utility = ScreenController.get();
    isDarkTheme = utility.localStorage.getIsDarkTheme()!.obs;
    currentIndex = utility.localStorage.getIndexKey()!.obs;
    token = utility.localStorage.getAccessToken()!;
    super.onInit();
  }

  // Change tab from bottom navigation bar
  Future<void> onIndexChange(int index) async {
    currentIndex.value = index;
    if (Get.isRegistered<QrScannerScreenController>()) {
      var controller = BaseInstance.get<QrScannerScreenController>();
      // If QR scanner screen is visible then toggle animation
      if (index == 1) {
        controller.resumeAnimationOnTabChange();
      } else {
        if (controller.animationController!.isAnimating) controller.pauseAnimationOnTabChange();
      }
    }
  }

  // On back from mobile back button
  Future<bool> onWillPop() async {
    Get.back();
    return false;
  }

  // On back from mobile back button
  Future<bool> onMobileBackPress() async {
    CommonMethods.openBottomSheetForExitAppConfirmation(
      appBgColor: flavor.appColors!.appBgColor!,
      flavor: flavor,
      styles: styles,
    );
    return true;
  }

  @override
  BaseFlavorConfig get flavor => utility.flavor.currentFlavor;

  @override
  StyleController get styles => utility.style;
}
