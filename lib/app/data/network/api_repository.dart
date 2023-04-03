import 'package:cmsocpp/app/data/models/change_password/change_password.dart';
import 'package:cmsocpp/app/data/models/charge_point_location/charge_point_location.dart';
import 'package:cmsocpp/app/data/models/charging_summery/charging_summary.dart';
import 'package:cmsocpp/app/data/models/confirmation/confirmation.dart';
import 'package:cmsocpp/app/data/models/history/history.dart';
import 'package:cmsocpp/app/data/models/payment_history/payment_history.dart';
import 'package:cmsocpp/app/data/models/start_transaction/start_transaction_model.dart';
import 'package:cmsocpp/app/data/models/start_transaction_status/start_transaction_status_model.dart';
import 'package:cmsocpp/app/data/models/stop_transaction/stop_transaction_model.dart';
import 'package:cmsocpp/app/data/models/stop_transaction_status/stop_transaction_status_model.dart';
import 'package:cmsocpp/app/data/models/token/token.dart';
import 'package:cmsocpp/app/data/models/transaction_meter_value/transaction_meter_value_model.dart';
import 'package:cmsocpp/app/data/models/update_wallet/update_wallet.dart';
import 'package:cmsocpp/app/data/models/user/user.dart';
import 'package:cmsocpp/app/data/models/user_profile/user_profile.dart';
import 'package:cmsocpp/app/data/models/validate_charger/validate_charger.dart';
import 'package:cmsocpp/app/data/models/wallet/wallet.dart';
import 'package:cmsocpp/utils/common_methods.dart';

abstract class ApiRepository {
  // User login api
  Future<User> userLoginApi(String email, String password, DeviceInfo deviceInfo);

  // Reset password api
  Future<Confirmation> resetPasswordApi(String otp, String password, String email);

  // Fetch new access token
  Future<Token> getNewAccessToken(String refreshToken);

  // User Register api
  Future<User> userRegisterAPI({
    required String email,
    required String password,
    required String mobile,
    required String firstName,
    required String lastname,
    required int countyCode,
    required DeviceInfo deviceInfo,
    required int checkValidation,
  });

  // Forgot password api
  Future<Confirmation> forgotPasswordAPI(String email);

  // Logout api
  Future<Confirmation> logoutUser();

  // Fetch user profile details
  Future<UserProfile> getUserProfile();

  // Update user profile data
  Future<Confirmation> updateUserProfile({
    required String firstName,
    required String lastName,
    String? city,
    String? state,
    String? country,
    String? address,
    String? pinCode,
    String? fileName,
    String? localImage,
  });

  // Get all Charge points list
  Future<ChargePointLocation> getAllChargePointLocation({
    required int page,
    String filterBy,
    String searchText,
  });

  // Validate charger
  Future<ValidateCharger> validateCharger({required String chargerCode});

  // Change password
  Future<ChangePasswordModel> changePassword({required String password, required String newPassword});

  // Start transaction
  Future<StartTransaction> startTransaction({
    required String chargerCode,
    required int connectorNo,
    required int chargeBy,
    required dynamic energy,
    required String time,
    required double amount,
  });

  // Start transaction status
  Future<StartTransactionStatusModel> getStartTransactionStatus({required int taskId});

  // Get transaction meter value
  Future<TransactionMeterValueModel> getTransactionMeterValue({required int transactionId});

  // Stop transaction
  Future<StopTransaction> stopTransaction({required String chargerCode, required int transactionId});

  // Stop transaction status
  Future<StopTransactionStatusModel> getStopTransactionStatus({required int taskId});

  // Transaction History
  Future<History> getTransactionHistory({
    required int page,
    String searchText,
    int dayCount,
    String startDate,
    String endDate,
  });

  // Transaction History
  Future<Wallet> getUserWalletDetails();

  // Transaction History
  Future<ChargingSummary> getTransactionSummery({required int transactionId});

  // Update wallet
  Future<UpdateWalletModel> updateWallet({required String paymentId, required int balance});

  // Payment transaction history
  Future<PaymentHistoryModel> paymentHistory({
    int dayCount,
    String startDate,
    String endDate,
    required int page,
  });
}
