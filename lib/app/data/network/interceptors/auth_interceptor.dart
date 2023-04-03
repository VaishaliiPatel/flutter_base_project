import 'package:cmsocpp/app/data/network/api_controller.dart';
import 'package:cmsocpp/app/data/network/rest_client/rest_client_dio.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/base_configs/controller/local_storage_controller.dart';
import 'package:cmsocpp/core/base/base_instance.dart';
import 'package:cmsocpp/utils/common_methods.dart';
import 'package:cmsocpp/utils/print_log.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends InterceptorsWrapper {
  String? accessToken;
  final LocalStorageController _storage;

  AuthInterceptor() : _storage = BaseInstance.get();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String? token = _storage.getAccessToken();
    printLog('Auth token : $token');
    if (token != null && token.isNotEmpty) {
      options.headers[ApiConfig.authorization] = '${ApiConfig.bearer} $token';
    }
    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    // Assume 401 stands for token expired
    if (err.response?.statusCode == 401) {
      var options = err.requestOptions;
      BaseInstance.get<ApiController>().getNewAccessToken(_storage.getRefreshToken()).then((tokenResponse) async {
        if (tokenResponse.status == 1) {
          //update access token in header
          options.headers[ApiConfig.authorization] =
              accessToken = '${ApiConfig.bearer} ${tokenResponse.data!.accessToken}';
          _storage.saveAccessToken(tokenResponse.data!.accessToken!);
          _storage.saveRefreshToken(tokenResponse.data!.refreshToken!);

          handler.resolve(await _retry(err.requestOptions));
        } else {
          // BaseInstance.get<ApiController>().logoutUser().then((value) {
          CommonMethods.clearLocalData();
          // });
          return handler.reject(err);
        }
      });
      return;
    }
    // else if (err.type == DioErrorType.other ||
    //     err.type == DioErrorType.connectTimeout ||
    //     err is SocketException) {
    //   await scheduleRequestRetry(
    //       requestOptions: err.requestOptions, dio: RestClientDio().dio);
    //   handler.resolve(await _retry(err.requestOptions));
    // }
    return handler.next(err);
  }

  /// Retry Function
  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return RestClientDio().dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data, queryParameters: requestOptions.queryParameters, options: options);
  }
}
