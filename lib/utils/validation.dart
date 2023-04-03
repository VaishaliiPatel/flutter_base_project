import 'package:cmsocpp/base_configs/configs/string_config.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

class Validation {
  Validation._();

  // Email validation
  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return StringConfig.pleaseEnterEmail;
    } else if (!GetUtils.isEmail(value)) {
      return StringConfig.pleaseProvideValidEmail;
    }
    return null;
  }

  // Password validation
  static String? validatePassword(String value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (value.trim().isEmpty) {
      return StringConfig.pleaseEnterPassword;
    } else if (value.trim().length < 8) {
      return StringConfig.passwordLengthError;
    } else if (!regExp.hasMatch(value)) {
      return StringConfig.specialCharValidation;
    }
    return null;
  }

  // Password validation on Login
  static String? validatePasswordOnLogin(String value) {
    if (value.trim().isEmpty) {
      return StringConfig.pleaseEnterPassword;
    }
    return null;
  }

  // Confirm password validation
  static String? validateConfirmPassword({required String password, required String confirmPassword}) {
    if (confirmPassword.trim().isEmpty) {
      return StringConfig.pleaseEnterPassword;
    } else if (password != confirmPassword) {
      return StringConfig.passwordsDoNotMatch;
    }
    return null;
  }

  // Username validation
  static String? validateUsername(String value) {
    if (value.trim().isEmpty) {
      return StringConfig.validateUsername;
    }
    if (value.trim().length < 3) {
      return StringConfig.validateUsernameLength;
    }
    // Return null if the entered username is valid
    return null;
  }

  // Mobile number validation
  static String? validateMobileNumber(String value) {
    if (value.trim().isEmpty) {
      return StringConfig.validateMobile;
    }
    // Return null if the entered mobile number is valid
    return null;
  }

  // Check box validation
  static String? validateCheckBox(bool value) {
    if (!value) {
      return StringConfig.validateTAndC;
    }

    // Return null if user select checkbox
    return null;
  }

  // Empty string validation
  static String? validateEmptyField({required String value,  String errorMsg = StringConfig.fieldCannotBeEmpty}) {
    if (value.isEmpty) {
      return errorMsg;
    }
    return null;
  }
}
