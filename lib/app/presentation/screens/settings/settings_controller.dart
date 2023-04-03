import 'package:cmsocpp/app/data/models/confirmation/confirmation.dart';
import 'package:cmsocpp/app/data/network/api_controller.dart';
import 'package:cmsocpp/app/presentation/dialogs/logout_confirmation.dart';
import 'package:cmsocpp/app/presentation/screens/change_password/change_password_screen.dart';
import 'package:cmsocpp/app/presentation/screens/home/home_screen.dart';
import 'package:cmsocpp/app/presentation/screens/profile/profile.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/base_configs/controller/style_controller.dart';
import 'package:cmsocpp/base_configs/controller/utility_controller.dart';
import 'package:cmsocpp/core/base/base_controller.dart';
import 'package:cmsocpp/core/base/base_instance.dart';
import 'package:cmsocpp/utils/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingsScreenController extends ScreenController {
  late UtilityController _utility;
  late ApiController _apiController;
  late RxBool _isDarkTheme;

  RxBool get isDarkTheme => _isDarkTheme; // For API call
  final Rx<bool> _isLoading = false.obs;

  Rx<bool> get isLoading => _isLoading;

  @override
  void onInit() {
    _utility = ScreenController.get();
    _apiController = BaseInstance.get();
    _isDarkTheme = _utility.localStorage.getIsDarkTheme()!.obs;
    super.onInit();
  }

  // Change theme data
  void changeAppTheme(_) {
    _isDarkTheme.value = !_isDarkTheme.value;
    _utility.localStorage.saveIsDarkTheme(_isDarkTheme.value);
    // For add app native status bar
    CommonMethods.getAppStatusBarTheme(utility: _utility);
    _utility.localStorage.saveIndexKey(4);
    Get.offAll(() => const HomeScreen());
  }

  // For logout user and remove user local data from storage
  Future<void> logout() async {
    onBackPress();
    _isLoading.value = true;
    Confirmation confirmation = await _apiController.logoutUser();
    if (confirmation.status == 1) {
      CommonMethods.clearLocalData();
    }
    _isLoading.value = false;
  }

  // Navigate to profile screen
  void onProfileClick() {
    Get.to(() => const ProfileScreen());
  }

  // Navigate to change password screen
  void onChangePassword() {
    Get.to(() => const ChangePasswordScreen());
  }

  // To open logout confirmation dialogs
  void getLogoutConfirmationDialog() {
    Get.defaultDialog(
      onWillPop: onWillPop,
      title: StringConfig.logoutConfirmationText,
      backgroundColor: flavor.appColors!.dialogColor,
      titleStyle: styles.titleStyle,
      contentPadding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 8.h),
      titlePadding: EdgeInsets.only(top: 20.h, bottom: 30.h, left: 20.w, right: 20.w),
      radius: 12.r,
      content: const LogoutConfirmationDialog(),
    ).then(
      (value) {},
    );
  }

  // To go back
  void onBackPress() {
    Get.back();
  }

  // On back from mobile back button
  Future<bool> onWillPop() async {
    _utility.localStorage.saveIndexKey(0);
    return true;
  }

  @override
  BaseFlavorConfig get flavor => _utility.flavor.currentFlavor;

  @override
  StyleController get styles => _utility.style;
}
