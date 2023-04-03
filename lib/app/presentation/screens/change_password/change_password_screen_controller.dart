import 'package:cmsocpp/app/data/network/api_controller.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/base_configs/controller/style_controller.dart';
import 'package:cmsocpp/base_configs/controller/utility_controller.dart';
import 'package:cmsocpp/core/base/base_controller.dart';
import 'package:cmsocpp/core/base/base_instance.dart';
import 'package:cmsocpp/utils/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreenController extends ScreenController {
  final UtilityController _utility;
  final ApiController _apiController;

  final formKey = GlobalKey<FormState>();

  String? password = '';
  String? confirmPassword = '';
  String? currentPassword = '';

  final Rx<bool> _isLoading = false.obs;
  final TextEditingController _passwordController = TextEditingController(text: '');

  TextEditingController get passwordController => _passwordController;
  RxBool isPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;
  RxBool isCurrentPasswordVisible = false.obs;

  ChangePasswordScreenController._()
      : _utility = BaseInstance.get(),
        _apiController = BaseInstance.get();

  factory ChangePasswordScreenController() {
    return ChangePasswordScreenController._();
  }

  Rx<bool> get isLoading => _isLoading;

  @override
  BaseFlavorConfig get flavor => _utility.flavor.currentFlavor;

  @override
  StyleController get styles => _utility.style;

  // Input Field validations and save inputs
  void validateFields() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    changePassword();
  }

  // To show or hide password input
  void onChangePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // To show or hide confirm password input
  void onChangeConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  // To show or hide confirm password input
  void onChangeCurrentPasswordVisibility() {
    isCurrentPasswordVisible.value = !isCurrentPasswordVisible.value;
  }

  // Back to previous screen
  void onBack() {
    Get.back();
  }

  // Validate otp and call api to set new password
  void changePassword() {
    _isLoading.value = true;
    try {
      _apiController.changePassword(password: currentPassword!, newPassword: password!).then((response) {
        if (response.status == 1) {
          Get.back();
          CommonMethods.showSnackBarSuccess(response.message!);
        } else if (response.status == 101) {
          if (response.validationError!.currentPassword != null) {
            CommonMethods.showSnackBarError(response.validationError!.currentPassword!.first);
          }
        }
        _isLoading.value = false;
      });
    } catch (error) {
      _isLoading.value = false;
    }
  }
}
