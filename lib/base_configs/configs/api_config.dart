import 'package:dio/dio.dart';

import 'app_config.dart';

abstract class ApiConfig {
  ApiConfig._();

  static const String baseUrlBacancy = AppConfig.baseUrlBacancy;

  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
  static const ResponseType responseType = ResponseType.json;

  // Razorpay payment key
  static const String paymentKey = 'rzp_test_gQnK7QQhSRvRmT';

  // Error codes
  static const int alreadyStoppedChargingErrorCode =
      3; // If Charging is Already stopped and user will try to stop again,
  // then error code 3 will be returned from api
  static const int unAuthorisedErrorCode =
      4; // If two or more users starts transaction at the same time then other users will get authorization error,
  // then error code 4 will be returned from api
  static const int errorCode = 0;
  static const int successCode = 1;

  // Header Parameters
  static const String authorization = 'Authorization';
  static const String accessToken = 'access_token';
  static const String bearer = 'Bearer';

  // Api End Points
  static const String register = 'register';
  static const String login = 'login';
  static const String resetPassword = 'resetPassword';
  static const String refreshToken = 'refreshToken';
  static const String logout = 'logout';
  static const String changePassword = 'changePassword';
  static const String forgotPassword = 'forgot';
  static const String getProfile = 'getProfile';
  static const String editProfileDetail = 'editProfileDetail';
  static const String getAllChargePointLocation = 'getAllChargePointLocation?page=';
  static const String validateCharger = 'validateCharger';
  static const String getUserAllTransactions = 'getUserAllTransactions?page=';
  static const String startTransaction = 'startTransaction';
  static const String startTransactionStatus = 'getRemoteStartStatus';
  static const String getTransactionMeterValue = 'getTransactionMeterValue';
  static const String stopTransaction = 'stopTransaction';
  static const String stopTransactionStatus = 'getRemoteStopStatus';
  static const String addUserWallet = 'addUserWallet';
  static const String getUserPaymentHistory = 'getUserPaymentHistory?page=';
  static const String getUserWallet = 'getUserWallet';
  static const String getTransactionById = 'getTransactionById';

  // Api Parameters
  static const String email = 'email';
  static const String password = 'password';
  static const String deviceType = 'device_type';
  static const String deviceToken = 'device_token';
  static const String mobileNo = 'mobile_no';
  static const String firstName = 'first_name';
  static const String lastName = 'last_name';
  static const String countryCode = 'country_code';
  static const String companyId = 'company_id';
  static const String otp = 'otp';
  static const String refreshTokenParam = 'refresh_token';
  static const String checkOnlyValidation = 'check_only_validation';
  static const String userImage = 'user_image';
  static const String address = 'address';
  static const String removeImg = 'remove_img';
  static const String country = 'country';
  static const String state = 'state';
  static const String city = 'city';
  static const String pinCode = 'pincode';
  static const String chargerCode = 'charger_code';
  static const String connectorNo = 'connector_no';
  static const String taskId = 'task_id';
  static const String transactionId = 'transaction_id';
  static const String currentPassword = 'current_password';
  static const String newPassword = 'new_password';
  static const String newBalance = 'new_balance';
  static const String paymentId = 'payment_id';
  static const String searchVal = 'search_val';
  static const String dayCount = 'day_count';
  static const String startDate = 'start_date';
  static const String endDate = 'end_date';
  static const String operationType = 'operation_type';
  static const String time = 'time';
  static const String energy = 'energy';
  static const String amount = 'amount';
  static const String filter = 'filter';
  static const String filterBy = 'filter_val';

  // Error
  static const String error = 'Error';
  static const String logoutUser = 'Logout User';
}
