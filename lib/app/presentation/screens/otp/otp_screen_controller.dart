import 'dart:async';
import 'dart:convert';

import 'package:cmsocpp/app/data/models/user/user.dart' as user_model;
import 'package:cmsocpp/app/data/models/user_data/user_data.dart';
import 'package:cmsocpp/app/presentation/screens/home/home_screen.dart';
import 'package:cmsocpp/app/presentation/screens/register/register_screen_controller.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/base_configs/controller/style_controller.dart';
import 'package:cmsocpp/base_configs/controller/utility_controller.dart';
import 'package:cmsocpp/core/base/base_controller.dart';
import 'package:cmsocpp/core/base/base_instance.dart';
import 'package:cmsocpp/utils/common_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPScreenController extends ScreenController {
  final UtilityController _utility;

  OTPScreenController._() : _utility = BaseInstance.get();

  bool showErrorMessage = false;
  String? otp;
  final formKey = GlobalKey<FormState>();
  RegisterScreenController registerController = Get.find<RegisterScreenController>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // For API call
  final Rx<bool> _isLoading = false.obs;

  Rx<bool> get isLoading => _isLoading;
  user_model.User _user = const user_model.User();
  String firstTwoMobileDigit = '12';
  String lastTwoMobileDigit = '89';

  RxInt secondsRemaining = 60.obs;
  RxBool enableResend = false.obs;
  late Timer timer;

  factory OTPScreenController() {
    return OTPScreenController._();
  }

  @override
  void onInit() {
    firstTwoMobileDigit = registerController.mobile.substring(0, 2);
    lastTwoMobileDigit =
        registerController.mobile.substring(registerController.mobile.length - 2, registerController.mobile.length);
    setOtpTimer();
    super.onInit();
  }

  // Set resend otp timer
  void setOtpTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (secondsRemaining.value != 0) {
          secondsRemaining.value--;
        } else {
          enableResend.value = true;
          timer.cancel();
        }
      },
    );
  }

  // Back from screen back button
  void onBackPress() {
    CommonMethods.hideKeyBoard();
    Get.back();
  }

// For verify otp numbers
  void onVerifyOTP() {
    if (otp != null && otp!.length < 6) {
      CommonMethods.showSnackBarError(StringConfig.otpLengthError);
      return;
    }
    bool isValid = formKey.currentState != null && formKey.currentState!.validate();
    if (isValid) {
      formKey.currentState!.save();
      validateFirebaseOTP('');
    }
  }

  // For Validate OTP
  void validateFirebaseOTP(String data) async {
    try {
      _isLoading.value = true;
      PhoneAuthCredential authCred =
          PhoneAuthProvider.credential(verificationId: registerController.verificationId, smsCode: otp!);
      await firebaseAuth.signInWithCredential(authCred);
      _isLoading.value = false;
      _registerUser();
    } catch (e) {
      _isLoading.value = false;
      if (e is FirebaseAuthException) {
        if (StringConfig.firebaseInvalidOTPError == e.message.toString() ||
            StringConfig.firebaseInvalidOTPErrorSmallLetters == e.message.toString()) {
          CommonMethods.showSnackBarError(StringConfig.otpLengthError);
        } else if (StringConfig.firebaseOTPExpireMsg == e.message.toString() ||
            StringConfig.firebaseOTPExpireMsgSmall == e.message.toString()) {
          Get.back();
          CommonMethods.showSnackBarError(e.message.toString());
        } else {
          CommonMethods.showSnackBarError(e.message.toString());
        }
      }
    }
  }

  // API call for the user registration
  Future<void> _registerUser() async {
    _isLoading.value = true;
    DeviceInfo deviceInfo = await CommonMethods.getDeviceInfo();
    _user = await _utility.api.userRegisterAPI(
        email: registerController.email,
        password: registerController.password.value,
        mobile: registerController.mobile,
        firstName: registerController.firstName,
        lastname: registerController.lastName,
        countyCode: registerController.countryDialCode.value,
        deviceInfo: deviceInfo,
        checkValidation: 0);
    if (_user.status == 1 && _user.data != null) {
      // Save access token to local storage
      _utility.localStorage.saveAccessToken(_user.data!.accessToken!);
      _utility.localStorage.saveRefreshToken(_user.data!.refreshToken!);
      _utility.localStorage.setIsUserLoggedIn(true);

      // Store user credential
      UserDataModel userData = UserDataModel(mobile: registerController.mobile, email: registerController.email);
      String str = json.encode(userData);
      _utility.localStorage.setUserData(str);
      // navigate to home screen after successful login
      Get.offAll(() => const HomeScreen());
    }

    _isLoading.value = false;
  }

  // For resend OTP
  void onResendOTP() async {
    _isLoading.value = true;
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: CommonMethods.getMobileNumber(
          mobile: registerController.mobile, countryCode: registerController.countryDialCode.value),
      verificationCompleted: (phoneAuthCredential) {},
      verificationFailed: (firebaseAuthException) {
        _isLoading.value = false;
        CommonMethods.showSnackBarError(firebaseAuthException.message.toString());
        secondsRemaining.value = 60;
        enableResend.value = false;
        setOtpTimer();
      },
      codeSent: (String s, [int? l]) {
        _isLoading.value = false;
        registerController.verificationId = s;
        CommonMethods.showSnackBarSuccess(StringConfig.resendOTPMessage);
        secondsRemaining.value = 60;
        enableResend.value = false;
        setOtpTimer();
      },
      codeAutoRetrievalTimeout: (String s) {},
    );
  }

  @override
  BaseFlavorConfig get flavor => _utility.flavor.currentFlavor;

  @override
  StyleController get styles => _utility.style;
}

