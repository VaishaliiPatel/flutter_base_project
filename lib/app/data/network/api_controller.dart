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
import 'package:cmsocpp/app/data/network/api_repository.dart';
import 'package:cmsocpp/app/data/network/rest_client/rest_client_dio.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/base_configs/controller/flavor_controller.dart';
import 'package:cmsocpp/core/base/base_controller.dart';
import 'package:cmsocpp/core/base/base_instance.dart';
import 'package:cmsocpp/utils/common_methods.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

import 'rest_client/dio_exception.dart';

class ApiController extends ServiceController implements ApiRepository {
  final RestClientDio _dioClient; // for apis with access token
  final RestClientDio _authClient; // for apis without access token
  final FlavorController _flavor;

  ApiController({required RestClientDio dioClient, required RestClientDio authClient})
      : _dioClient = dioClient,
        _authClient = authClient,
        _flavor = BaseInstance.get();

  // ----------- AUTH APIS ---------- //

  @override
  Future<User> userLoginApi(String email, String password, DeviceInfo deviceInfo) async {
    try {
      Response response = await _authClient.post(
        ApiConfig.login,
        isAuth: true,
        queryParameters: {
          ApiConfig.email: email,
          ApiConfig.password: password,
          ApiConfig.deviceType: deviceInfo.deviceType,
          ApiConfig.deviceToken: deviceInfo.deviceToken,
          ApiConfig.companyId: _flavor.currentFlavor.companyId,
        },
      );
      if (response.statusCode == 200) {
        User res = User.fromJson(response.data);
        if (res.status == 1) {
          return res;
        } else {
          _handleDioError(res.message!);
          return res;
        }
      } else {
        return const User(message: ApiConfig.error);
      }
    } on DioError catch (e) {
      _handleDioError(DioExceptions.fromDioError(e).toString());
      return const User(message: ApiConfig.error);
    }
  }

  @override
  Future<Confirmation> resetPasswordApi(String otp, String password, String email) async {
    try {
      Response response = await _authClient.post(
        ApiConfig.resetPassword,
        isAuth: true,
        queryParameters: {
          ApiConfig.email: email,
          ApiConfig.otp: otp,
          ApiConfig.password: password,
          ApiConfig.companyId: _flavor.currentFlavor.companyId,
        },
      );
      if (response.statusCode == 200) {
        Confirmation res = Confirmation.fromJson(response.data);
        if (res.status == 1) {
          return res;
        } else {
          _handleDioError(res.message!);
          return res;
        }
      } else {
        return const Confirmation(message: ApiConfig.error);
      }
    } on DioError catch (e) {
      _handleDioError(DioExceptions.fromDioError(e).toString());
      return const Confirmation(message: ApiConfig.error);
    }
  }

  @override
  Future<User> userRegisterAPI({
    required String email,
    required String password,
    required String mobile,
    required String firstName,
    required String lastname,
    required int countyCode,
    required DeviceInfo deviceInfo,
    required int checkValidation,
  }) async {
    try {
      Response response = await _authClient.post(
        ApiConfig.register,
        isAuth: true,
        queryParameters: {
          ApiConfig.email: email,
          ApiConfig.password: password,
          ApiConfig.mobileNo: mobile,
          ApiConfig.firstName: firstName,
          ApiConfig.lastName: lastname,
          ApiConfig.countryCode: countyCode,
          ApiConfig.companyId: _flavor.currentFlavor.companyId,
          ApiConfig.deviceType: deviceInfo.deviceType,
          ApiConfig.deviceToken: deviceInfo.deviceToken,
          ApiConfig.checkOnlyValidation: checkValidation,
        },
      );
      if (response.statusCode == 200) {
        User res = User.fromJson(response.data);
        if (res.status == 1) {
          return res;
        } else {
          if (checkValidation == 0) {
            _handleDioError(res.message!);
          }
          return res;
        }
      } else {
        return const User(message: ApiConfig.error);
      }
    } on DioError catch (e) {
      _handleDioError(DioExceptions.fromDioError(e).toString());
      return const User(message: ApiConfig.error);
    }
  }

  // API setup for forgot password
  @override
  Future<Confirmation> forgotPasswordAPI(String email) async {
    try {
      Response response = await _authClient.post(
        ApiConfig.forgotPassword,
        isAuth: true,
        queryParameters: {
          ApiConfig.email: email,
          ApiConfig.companyId: _flavor.currentFlavor.companyId,
        },
      );
      if (response.statusCode == 200) {
        Confirmation res = Confirmation.fromJson(response.data);
        if (res.status == 1) {
          return res;
        } else {
          _handleDioError(res.message!);
          return res;
        }
      } else {
        return const Confirmation(message: ApiConfig.error);
      }
    } on DioError catch (e) {
      _handleDioError(DioExceptions.fromDioError(e).toString());
      return const Confirmation(message: ApiConfig.error);
    }
  }

  @override
  Future<Token> getNewAccessToken(String? refreshToken) async {
    try {
      Response response = await _authClient.post(
        ApiConfig.refreshToken,
        isAuth: true,
        queryParameters: {
          ApiConfig.refreshTokenParam: refreshToken,
          ApiConfig.companyId: _flavor.currentFlavor.companyId,
        },
      );
      if (response.statusCode == 200) {
        Token res = Token.fromJson(response.data);
        if (res.status == 1) {
          return res;
        } else {
          _handleDioError(res.message!);
          return res;
        }
      } else {
        return Token(message: ApiConfig.error, status: response.statusCode);
      }
    } on DioError catch (e) {
      _handleDioError(DioExceptions.fromDioError(e).toString());
      return const Token();
    }
  }

  // ----------- AUTH APIS END ---------- //

  // show snack bar for all type of errors
  _handleDioError(String errorMessage) {
    CommonMethods.showSnackBarError(
      errorMessage,
    );
  }

  // Get user profile api integration
  @override
  Future<UserProfile> getUserProfile() async {
    try {
      Response response = await _dioClient.post(
        ApiConfig.getProfile,
        queryParameters: {
          ApiConfig.companyId: _flavor.currentFlavor.companyId,
        },
      );
      if (response.statusCode == 200) {
        UserProfile res = UserProfile.fromJson(response.data);
        if (res.status == 1) {
          return res;
        } else {
          _handleDioError(res.message!);
          return res;
        }
      } else {
        return UserProfile(message: ApiConfig.error, status: response.statusCode);
      }
    } on DioError catch (e) {
      _handleDioError(DioExceptions.fromDioError(e).toString());
      return const UserProfile();
    }
  }

  // Update user profile api integration
  @override
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
    int? removeImg,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        ApiConfig.firstName: firstName,
        ApiConfig.lastName: lastName,
        ApiConfig.companyId: _flavor.currentFlavor.companyId,
        ApiConfig.city: city,
        ApiConfig.state: state,
        ApiConfig.country: country,
        ApiConfig.pinCode: pinCode,
        ApiConfig.address: address,
        ApiConfig.removeImg: removeImg,
        ApiConfig.userImage: localImage!.isNotEmpty
            ? await MultipartFile.fromFile(
                localImage,
                filename: fileName,
                contentType: MediaType('jpg', 'png'),
              )
            : null,
      });

      Response response = await _dioClient.post(ApiConfig.editProfileDetail, data: formData);
      if (response.statusCode == 200) {
        Confirmation res = Confirmation.fromJson(response.data);
        if (res.status == 1) {
          return res;
        } else {
          _handleDioError(res.message!);
          return res;
        }
      } else {
        return const Confirmation(message: ApiConfig.error);
      }
    } on DioError catch (e) {
      _handleDioError(DioExceptions.fromDioError(e).toString());
      return const Confirmation(message: ApiConfig.error);
    }
  }

  // Logout API integration
  @override
  Future<Confirmation> logoutUser() async {
    try {
      Response response = await _dioClient.post(
        ApiConfig.logout,
        queryParameters: {
          ApiConfig.companyId: _flavor.currentFlavor.companyId,
        },
      );
      if (response.statusCode == 200) {
        Confirmation res = Confirmation.fromJson(response.data);
        if (res.status == 1) {
          return res;
        } else {
          _handleDioError(res.message!);
          return res;
        }
      } else {
        return Confirmation(message: ApiConfig.error, status: response.statusCode);
      }
    } on DioError catch (e) {
      _handleDioError(DioExceptions.fromDioError(e).toString());
      return const Confirmation();
    }
  }

  @override
  Future<ChargePointLocation> getAllChargePointLocation({
    required int page,
    String? filterBy,
    String? searchText,
  }) async {
    try {
      Response response = await _dioClient.post(
        '${ApiConfig.getAllChargePointLocation}$page',
        queryParameters: {
          ApiConfig.companyId: _flavor.currentFlavor.companyId,
          ApiConfig.searchVal: searchText,
          ApiConfig.filterBy: filterBy,
        },
      );
      if (response.statusCode == 200) {
        ChargePointLocation res = ChargePointLocation.fromJson(response.data);
        if (res.status == 1) {
          return res;
        } else {
          _handleDioError(res.message!);
          return res;
        }
      } else {
        return ChargePointLocation(message: ApiConfig.error, status: response.statusCode);
      }
    } on DioError catch (e) {
      _handleDioError(DioExceptions.fromDioError(e).toString());
      return const ChargePointLocation();
    }
  }

  // Validate charger API
  @override
  Future<ValidateCharger> validateCharger({required String chargerCode}) async {
    try {
      Response response = await _dioClient.post(
        ApiConfig.validateCharger,
        queryParameters: {
          ApiConfig.companyId: _flavor.currentFlavor.companyId,
          ApiConfig.chargerCode: chargerCode,
        },
      );
      if (response.statusCode == 200) {
        ValidateCharger res = ValidateCharger.fromJson(response.data);
        if (res.status == 1) {
          return res;
        } else {
          _handleDioError(res.message!);
          return res;
        }
      } else {
        return ValidateCharger(message: ApiConfig.error, status: response.statusCode);
      }
    } on DioError catch (e) {
      _handleDioError(DioExceptions.fromDioError(e).toString());
      return const ValidateCharger();
    }
  }

  @override
  Future<ChangePasswordModel> changePassword({required String password, required String newPassword}) async {
    try {
      Response response = await _dioClient.post(
        ApiConfig.changePassword,
        queryParameters: {
          ApiConfig.companyId: _flavor.currentFlavor.companyId,
          ApiConfig.currentPassword: password,
          ApiConfig.newPassword: newPassword,
        },
      );
      if (response.statusCode == 200) {
        ChangePasswordModel res = ChangePasswordModel.fromJson(response.data);
        if (res.status == 1 || res.status == 101) {
          return res;
        } else {
          _handleDioError(res.message!);
          return res;
        }
      } else {
        return ChangePasswordModel(message: ApiConfig.error, status: response.statusCode);
      }
    } on DioError catch (e) {
      _handleDioError(DioExceptions.fromDioError(e).toString());
      return const ChangePasswordModel();
    }
  }

  // Start Transaction API integration
  @override
  Future<StartTransaction> startTransaction({
    required String chargerCode,
    required int connectorNo,
    required int chargeBy,
    required dynamic energy,
    required String time,
    required double amount,
  }) async {
    try {
      Response response = await _dioClient.post(
        ApiConfig.startTransaction,
        queryParameters: {
          ApiConfig.companyId: _flavor.currentFlavor.companyId,
          ApiConfig.chargerCode: chargerCode,
          ApiConfig.connectorNo: connectorNo,
          ApiConfig.time: time,
          ApiConfig.energy: energy,
          ApiConfig.amount: amount,
          ApiConfig.operationType: chargeBy,
        },
      );
      if (response.statusCode == 200) {
        StartTransaction res = StartTransaction.fromJson(response.data);
        if (res.status == 1) {
          return res;
        } else {
          _handleDioError(res.message!);
          return res;
        }
      } else {
        return StartTransaction(message: ApiConfig.error, status: response.statusCode);
      }
    } on DioError catch (e) {
      _handleDioError(DioExceptions.fromDioError(e).toString());
      return const StartTransaction();
    }
  }

  // Start transaction status API  integration
  @override
  Future<StartTransactionStatusModel> getStartTransactionStatus({required int taskId}) async {
    try {
      Response response = await _dioClient.post(
        ApiConfig.startTransactionStatus,
        queryParameters: {
          ApiConfig.companyId: _flavor.currentFlavor.companyId,
          ApiConfig.taskId: taskId,
        },
      );
      if (response.statusCode == 200) {
        StartTransactionStatusModel res = StartTransactionStatusModel.fromJson(response.data);
        if (res.status == 1) {
          return res;
        } else {
          _handleDioError(res.message!);
          return res;
        }
      } else {
        return StartTransactionStatusModel(message: ApiConfig.error, status: response.statusCode);
      }
    } on DioError catch (e) {
      _handleDioError(DioExceptions.fromDioError(e).toString());
      return const StartTransactionStatusModel();
    }
  }

  // Get transaction meter value API integration
  @override
  Future<TransactionMeterValueModel> getTransactionMeterValue({required int transactionId}) async {
    try {
      Response response = await _dioClient.post(
        ApiConfig.getTransactionMeterValue,
        queryParameters: {
          ApiConfig.companyId: _flavor.currentFlavor.companyId,
          ApiConfig.transactionId: transactionId,
        },
      );
      if (response.statusCode == 200) {
        TransactionMeterValueModel res = TransactionMeterValueModel.fromJson(response.data);
        if (res.status == 1) {
          return res;
        } else {
          // _handleDioError(res.message!);
          return res;
        }
      } else {
        return TransactionMeterValueModel(message: ApiConfig.error, status: response.statusCode);
      }
    } on DioError catch (e) {
      _handleDioError(DioExceptions.fromDioError(e).toString());
      return const TransactionMeterValueModel(message: ApiConfig.error);
    }
  }

  // Stop transaction API integration
  @override
  Future<StopTransaction> stopTransaction({required String chargerCode, required int transactionId}) async {
    try {
      Response response = await _dioClient.post(
        ApiConfig.stopTransaction,
        queryParameters: {
          ApiConfig.companyId: _flavor.currentFlavor.companyId,
          ApiConfig.chargerCode: chargerCode,
          ApiConfig.transactionId: transactionId,
        },
      );
      if (response.statusCode == 200) {
        StopTransaction res = StopTransaction.fromJson(response.data);
        if (res.status == 1) {
          return res;
        } else {
          // _handleDioError(res.message!);
          return res;
        }
      } else {
        return StopTransaction(message: ApiConfig.error, status: response.statusCode);
      }
    } on DioError catch (e) {
      _handleDioError(DioExceptions.fromDioError(e).toString());
      return const StopTransaction();
    }
  }

  // Get stop  transaction status
  @override
  Future<StopTransactionStatusModel> getStopTransactionStatus({required int taskId}) async {
    try {
      Response response = await _dioClient.post(
        ApiConfig.stopTransactionStatus,
        queryParameters: {
          ApiConfig.companyId: _flavor.currentFlavor.companyId,
          ApiConfig.taskId: taskId,
        },
      );
      if (response.statusCode == 200) {
        StopTransactionStatusModel res = StopTransactionStatusModel.fromJson(response.data);
        if (res.status == 1) {
          return res;
        } else {
          // _handleDioError(res.message!);
          return res;
        }
      } else {
        return StopTransactionStatusModel(message: ApiConfig.error, status: response.statusCode);
      }
    } on DioError catch (e) {
      _handleDioError(DioExceptions.fromDioError(e).toString());
      return const StopTransactionStatusModel();
    }
  }

  @override
  Future<History> getTransactionHistory({
    required int page,
    String searchText = '',
    int dayCount = 0,
    String startDate = '',
    String endDate = '',
  }) async {
    try {
      Response response = await _dioClient.post(
        '${ApiConfig.getUserAllTransactions}$page',
        queryParameters: {
          ApiConfig.companyId: _flavor.currentFlavor.companyId,
          ApiConfig.searchVal: searchText,
          ApiConfig.dayCount: dayCount,
          ApiConfig.startDate: startDate,
          ApiConfig.endDate: endDate,
        },
      );
      if (response.statusCode == 200) {
        History res = History.fromJson(response.data);
        if (res.status == 1) {
          return res;
        } else {
          _handleDioError(res.message!);
          return res;
        }
      } else {
        return History(message: ApiConfig.error, status: response.statusCode);
      }
    } on DioError catch (e) {
      _handleDioError(DioExceptions.fromDioError(e).toString());
      return const History(message: ApiConfig.error);
    }
  }

  @override
  Future<ChargingSummary> getTransactionSummery({required int transactionId}) async {
    try {
      Response response = await _dioClient.post(
        ApiConfig.getTransactionById,
        queryParameters: {
          ApiConfig.companyId: _flavor.currentFlavor.companyId,
          ApiConfig.transactionId: transactionId,
        },
      );
      if (response.statusCode == 200) {
        ChargingSummary res = ChargingSummary.fromJson(response.data);
        if (res.status == 1) {
          return res;
        } else {
          _handleDioError(res.message!);
          return res;
        }
      } else {
        return ChargingSummary(message: ApiConfig.error, status: response.statusCode);
      }
    } on DioError catch (e) {
      _handleDioError(DioExceptions.fromDioError(e).toString());
      return const ChargingSummary();
    }
  }

  @override
  Future<Wallet> getUserWalletDetails() async {
    try {
      Response response = await _dioClient.post(
        ApiConfig.getUserWallet,
        queryParameters: {
          ApiConfig.companyId: _flavor.currentFlavor.companyId,
        },
      );
      if (response.statusCode == 200) {
        Wallet res = Wallet.fromJson(response.data);
        if (res.status == 1) {
          return res;
        } else {
          _handleDioError(res.message!);
          return res;
        }
      } else {
        return Wallet(message: ApiConfig.error, status: response.statusCode);
      }
    } on DioError catch (e) {
      _handleDioError(DioExceptions.fromDioError(e).toString());
      return const Wallet();
    }
  }

  // Update wallet API integration
  @override
  Future<UpdateWalletModel> updateWallet({required String paymentId, required int balance}) async {
    try {
      Response response = await _dioClient.post(
        ApiConfig.addUserWallet,
        queryParameters: {
          ApiConfig.companyId: _flavor.currentFlavor.companyId,
          ApiConfig.newBalance: balance,
          ApiConfig.paymentId: paymentId,
        },
      );
      if (response.statusCode == 200) {
        UpdateWalletModel res = UpdateWalletModel.fromJson(response.data);
        if (res.status == 1) {
          return res;
        } else {
          _handleDioError(res.message!);
          return res;
        }
      } else {
        return UpdateWalletModel(message: ApiConfig.error, status: response.statusCode);
      }
    } on DioError catch (e) {
      _handleDioError(DioExceptions.fromDioError(e).toString());
      return const UpdateWalletModel();
    }
  }

  // Payment history API integration
  @override
  Future<PaymentHistoryModel> paymentHistory({
    int dayCount = 0,
    String startDate = '',
    String endDate = '',
    required int page,
  }) async {
    try {
      Response response = await _dioClient.post(
        '${ApiConfig.getUserPaymentHistory}$page',
        queryParameters: {
          ApiConfig.companyId: _flavor.currentFlavor.companyId,
          ApiConfig.dayCount: dayCount,
          ApiConfig.startDate: startDate,
          ApiConfig.endDate: endDate,
        },
      );
      if (response.statusCode == 200) {
        PaymentHistoryModel res = PaymentHistoryModel.fromJson(response.data);
        if (res.status == 1) {
          return res;
        } else {
          _handleDioError(res.message!);
          return res;
        }
      } else {
        return PaymentHistoryModel(message: ApiConfig.error, status: response.statusCode);
      }
    } on DioError catch (e) {
      _handleDioError(DioExceptions.fromDioError(e).toString());
      return const PaymentHistoryModel();
    }
  }
}
