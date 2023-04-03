import 'package:cmsocpp/app/data/network/api_controller.dart';
import 'package:cmsocpp/app/presentation/screens/forgot_password/forgot_password_screen_controller.dart';
import 'package:cmsocpp/app/presentation/screens/login/login_screen.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/base_configs/controller/style_controller.dart';
import 'package:cmsocpp/base_configs/controller/utility_controller.dart';
import 'package:cmsocpp/core/base/base_controller.dart';
import 'package:cmsocpp/core/base/base_instance.dart';
import 'package:cmsocpp/utils/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreenController extends ScreenController {
  final UtilityController _utility;
  final ApiController _apiController;
  final ForgotPasswordScreenController _forgotPasswordScreenController;

  final formKey = GlobalKey<FormState>();

  String? password = '';
  String? confirmPassword = '';
  String otp = '';
  final Rx<bool> _isLoading = false.obs;
  final TextEditingController _passwordController = TextEditingController(text: '');

  TextEditingController get passwordController => _passwordController;
  RxBool isPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;

  ResetPasswordScreenController._()
      : _utility = BaseInstance.get(),
        _apiController = BaseInstance.get(),
        _forgotPasswordScreenController = BaseInstance.get();

  factory ResetPasswordScreenController() {
    return ResetPasswordScreenController._();
  }

  Rx<bool> get isLoading => _isLoading;

  @override
  BaseFlavorConfig get flavor => _utility.flavor.currentFlavor;

  @override
  StyleController get styles => _utility.style;

  // input Field validations and save inputs
  void validateFields() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    resetPasswordProcess();
  }

  // To show or hide password input
  void onChangePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // To show or hide confirm password input
  void onChangeConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  // Back to previous screen
  void onBack() {
    Get.back();
  }

  // Validate otp and call api to set new password
  void resetPasswordProcess() {
    _isLoading.value = true;
    _apiController.resetPasswordApi(otp, password!, _forgotPasswordScreenController.email!).then((response) {
      if (response.status == 1) {
        CommonMethods.showSnackBarSuccess(response.message!);
        // Send user to login screen for re-authentication
        Get.offAll(() => const LoginScreen());
      }
      _isLoading.value = false;
    });
  }
}
