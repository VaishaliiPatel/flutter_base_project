import 'dart:convert';

import 'package:cmsocpp/app/data/models/user/user.dart';
import 'package:cmsocpp/app/data/models/user_data/user_data.dart';
import 'package:cmsocpp/app/presentation/screens/forgot_password/forgot_password_screen.dart';
import 'package:cmsocpp/app/presentation/screens/home/home_screen.dart';
import 'package:cmsocpp/app/presentation/screens/register/register_screen.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/base_configs/controller/style_controller.dart';
import 'package:cmsocpp/base_configs/controller/utility_controller.dart';
import 'package:cmsocpp/core/base/base_controller.dart';
import 'package:cmsocpp/core/base/base_instance.dart';
import 'package:cmsocpp/utils/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenController extends ScreenController {
  factory LoginScreenController() {
    return LoginScreenController._();
  }

  RxBool isPasswordVisible = false.obs;

  LoginScreenController._() : _utility = BaseInstance.get();

  final formKey = GlobalKey<FormState>();
  final UtilityController _utility;
  final Rx<bool> _isLoading = false.obs;

  Rx<bool> get isLoading => _isLoading;
  User _user = const User();
  String password = '';
  String email = '';

  // To navigate to Forgot Password screen
  void navigateToForgotPasswordScreen() {
    Get.to(() => const ForgotPasswordScreen());
  }

  // To navigate to Register screen
  void navigateToRegisterScreen() {
    Get.off(() => const RegisterScreen());
  }

  // To show or hide password input
  void onChangePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  @override
  BaseFlavorConfig get flavor => _utility.flavor.currentFlavor;

  @override
  StyleController get styles => _utility.style;

  // get user object
  User get user => _user;

  // Input field validation and save inputs
  void validateFields() {
    CommonMethods.hideKeyBoard();
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    _userLoginProcess();
  }

  // User login api call
  Future<void> _userLoginProcess() async {
    _isLoading.value = true;
    DeviceInfo deviceInfo = await CommonMethods.getDeviceInfo();
    _user = await _utility.api.userLoginApi(email, password, deviceInfo);
    if (_user.status == 1 && _user.data != null) {
      // Save access token to local storage
      _utility.localStorage.saveAccessToken(_user.data!.accessToken!);
      _utility.localStorage.saveRefreshToken(_user.data!.refreshToken!);
      _utility.localStorage.setIsUserLoggedIn(true);

      // Store user credential
      UserDataModel userData = UserDataModel(mobile: _user.data!.user!.mobileNo!, email: _user.data!.user!.email!);
      String str = json.encode(userData);
      _utility.localStorage.setUserData(str);
      // navigate to home screen after successful login
      Get.offAll(() => const HomeScreen());
    }
    _isLoading.value = false;
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
}
