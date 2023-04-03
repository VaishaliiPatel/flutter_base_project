import 'package:cmsocpp/app/data/models/user/user.dart' as user_model;
import 'package:cmsocpp/app/data/network/api_controller.dart';
import 'package:cmsocpp/app/presentation/screens/login/login_screen.dart';
import 'package:cmsocpp/app/presentation/screens/otp/otp_screen.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/base_configs/controller/style_controller.dart';
import 'package:cmsocpp/base_configs/controller/utility_controller.dart';
import 'package:cmsocpp/core/base/base_controller.dart';
import 'package:cmsocpp/core/base/base_instance.dart';
import 'package:cmsocpp/utils/common_methods.dart';
import 'package:cmsocpp/utils/validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreenController extends ScreenController {
  final UtilityController _utility;
  final ApiController _apiController;

  String email = '';
  String firstName = '';
  String lastName = '';
  String mobile = '';
  RxString password = ''.obs;
  RxInt countryDialCode = 91.obs;
  String confirmPassword = '';
  RxBool isPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;
  RxBool isChecked = false.obs;
  String? emailError;
  String? mobileFieldError;
  String verificationId = '';
  final formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // For API call
  final Rx<bool> _isLoading = false.obs;

  Rx<bool> get isLoading => _isLoading;

  RegisterScreenController._()
      : _utility = BaseInstance.get(),
        _apiController = BaseInstance.get();

  factory RegisterScreenController() {
    return RegisterScreenController._();
  }

  // To select terms and condition
  void onCheck(bool? isCheck) {
    isChecked.value = isCheck!;
  }

  // To show or hide password input
  void onChangePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // To show or hide confirm password input
  bool onChangeConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
    return isConfirmPasswordVisible.value;
  }

  // To navigate to OTP screen
  void validateAndNavigateToOTPScreen() {
    emailError = null;
    mobileFieldError = null;
    final isValid = formKey.currentState != null && formKey.currentState!.validate();
    if (isValid) {
      if (isChecked.value) {
        formKey.currentState!.save();
        _registerUser();
      } else {
        CommonMethods.showSnackBarError(StringConfig.validateTAndC);
      }
    }
  }

  // local and server validation on Email address
  String? validateEmailAddress(String value) {
    return emailError = (Validation.validateEmail(value) != null)
        ? Validation.validateEmail(value)
        : (emailError != null)
            ? emailError
            : null;
  }

  // local and server validation on Mobile no
  String? validateMobileNumber(String value) {
    return mobileFieldError = (Validation.validateMobileNumber(value) != null)
        ? Validation.validateMobileNumber(value)
        : (mobileFieldError != null)
            ? mobileFieldError
            : null;
  }

  // API call for the user registration
  Future<void> _registerUser() async {
    _isLoading.value = true;
    DeviceInfo deviceInfo = await CommonMethods.getDeviceInfo();
    user_model.User user = await _apiController.userRegisterAPI(
      email: email,
      password: password.value,
      mobile: mobile,
      firstName: firstName,
      lastname: lastName,
      countyCode: countryDialCode.value,
      deviceInfo: deviceInfo,
      checkValidation: 1,
    );
    if (user.status == 101) {
      if (user.validationError!.email != null) {
        emailError = user.validationError!.email!.first;
      }
      if (user.validationError!.mobileNo != null) {
        mobileFieldError = user.validationError!.mobileNo!.first;
      }
    }
    _isLoading.value = false;
    final validate = formKey.currentState!.validate();
    if (validate) {
      formKey.currentState!.save();
      onSendOTPVerification();
    }
  }

  // Send otp for mobile verification
  onSendOTPVerification() async {
    _isLoading.value = true;
    await firebaseAuth
        .verifyPhoneNumber(
      phoneNumber: CommonMethods.getMobileNumber(mobile: mobile, countryCode: countryDialCode.value),
      verificationCompleted: (phoneAuthCredential) {},
      verificationFailed: (firebaseAuthException) {
        _isLoading.value = false;
        if (StringConfig.mobileFormatError == firebaseAuthException.message.toString() ||
            StringConfig.mobileFormatErrorWithFormatExample == firebaseAuthException.message.toString() ||
            StringConfig.tooLongMobileNumberError == firebaseAuthException.message.toString() ||
            StringConfig.tooShortMobileNumberError == firebaseAuthException.message.toString()) {
          CommonMethods.showSnackBarError(StringConfig.validMobileError);
        } else {
          CommonMethods.showSnackBarError(firebaseAuthException.message.toString());
        }
      },
      codeSent: (String s, [int? l]) {
        _isLoading.value = false;
        Get.to(() => const OTPScreen());
        CommonMethods.showSnackBarSuccess(StringConfig.sendOTPMessage);
        verificationId = s;
        _isLoading.value = false;
      },
      codeAutoRetrievalTimeout: (String s) {},
    )
        .then((value) {
      CommonMethods.hideKeyBoard();
    });
  }

  // To navigate to Login screen
  void navigateToLoginScreen() {
    Get.off(() => const LoginScreen());
  }

  void onBackPress() {
    Get.back();
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
  BaseFlavorConfig get flavor => _utility.flavor.currentFlavor;

  @override
  StyleController get styles => _utility.style;
}
