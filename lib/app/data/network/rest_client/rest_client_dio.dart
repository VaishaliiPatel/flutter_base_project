import 'package:cmsocpp/base_configs/configs/api_config.dart';
import 'package:cmsocpp/base_configs/controller/flavor_controller.dart';
import 'package:cmsocpp/core/base/base_instance.dart';
import 'package:dio/dio.dart';

class RestClientDio {
  Dio? _dio;
  Dio? _dioAuth;
  Dio get dio => _dio!;
  Dio get dioAuth => _dioAuth!;
  final FlavorController _flavor = BaseInstance.get();

  // Dio client for authentication apis
  RestClientDio.auth() {
    _dioAuth = Dio(BaseOptions(
      baseUrl: _flavor.currentFlavor.baseUrl,
      connectTimeout: ApiConfig.connectTimeout,
      receiveTimeout: ApiConfig.receiveTimeout,
      responseType: ResponseType.json,
    ));
  }

  // Dio client for other apis
  RestClientDio() {
    _dio = Dio(BaseOptions(
      baseUrl: _flavor.currentFlavor.baseUrl,
      connectTimeout: ApiConfig.connectTimeout,
      receiveTimeout: ApiConfig.receiveTimeout,
      responseType: ResponseType.json,
    ));
  }

  // Get:-----------------------------------------------------------------------
  Future<Response> get<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool? isAuth = false,
  }) async {
    Dio dio = isAuth! ? _dioAuth! : _dio!;
    try {
      final Response response = await dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Response> post<T>(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool? isAuth = false,
  }) async {
    Dio dio = isAuth! ? _dioAuth! : _dio!;
    try {
      final Response response = await dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<Response> put<T>(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool? isAuth = false,
  }) async {
    Dio dio = isAuth! ? _dioAuth! : _dio!;
    try {
      final Response response = await dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<Response> delete<T>(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool? isAuth = false,
  }) async {
    Dio dio = isAuth! ? _dioAuth! : _dio!;
    try {
      final Response response = await dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
