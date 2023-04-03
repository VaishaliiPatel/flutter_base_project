import 'package:cmsocpp/app/data/network/api_controller.dart';
import 'package:cmsocpp/app/presentation/screens/reset_password/reset_password_screen.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/base_configs/controller/style_controller.dart';
import 'package:cmsocpp/base_configs/controller/utility_controller.dart';
import 'package:cmsocpp/core/base/base_controller.dart';
import 'package:cmsocpp/core/base/base_instance.dart';
import 'package:cmsocpp/utils/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreenController extends ScreenController {
  final UtilityController _utility;
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController =
      TextEditingController(text: '');

  TextEditingController get emailController => _emailController;
  String? email;

  ForgotPasswordScreenController._()
      : _utility = BaseInstance.get(),
        _apiController = BaseInstance.get();

  factory ForgotPasswordScreenController() {
    return ForgotPasswordScreenController._();
  }

  void closeScreen() => Get.back();

  @override
  BaseFlavorConfig get flavor => _utility.flavor.currentFlavor;

  @override
  StyleController get styles => _utility.style;

  // For API call
  final Rx<bool> _isLoading = false.obs;

  Rx<bool> get isLoading => _isLoading;
  final ApiController _apiController;

  // Input field validation and save inputs
  void validateFields() {
    CommonMethods.hideKeyBoard();
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {}
    formKey.currentState!.save();
    _forgotPassword();
  }

  // API call for forgot password
  Future<void> _forgotPassword() async {
    _isLoading.value = true;
    await _apiController.forgotPasswordAPI(email!).then((response) {
      if (response.status == 1) {
        CommonMethods.showSnackBarSuccess(response.message!);
        // Send user to Reset password screen
        Get.to(() => const ResetPasswordScreen());
      }
    });
    _isLoading.value = false;
  }
}
