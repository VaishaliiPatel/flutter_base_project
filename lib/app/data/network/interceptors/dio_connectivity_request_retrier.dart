import 'dart:async';

import 'package:cmsocpp/utils/print_log.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

Future<Response> scheduleRequestRetry({RequestOptions? requestOptions, Dio? dio}) async {
  StreamSubscription? streamSubscription;
  Connectivity connectivity = Connectivity();
  final responseCompleter = Completer<Response>();

  streamSubscription = connectivity.onConnectivityChanged.listen(

    (connectivityResult) async {
      printLog('connectivity changed $connectivityResult');
      // We're connected either to WiFi or mobile data
      if (connectivityResult != ConnectivityResult.none) {
        // Ensure that only one retry happens per connectivity change by cancelling the listener
        streamSubscription!.cancel();
        // Copy & paste the failed request's data into the new request
        responseCompleter.complete(
          dio!.request(
            requestOptions!.path,
            cancelToken: requestOptions.cancelToken,
            data: requestOptions.data,
            onReceiveProgress: requestOptions.onReceiveProgress,
            onSendProgress: requestOptions.onSendProgress,
            queryParameters: requestOptions.queryParameters,
            options: Options(
              method: requestOptions.method,
              headers: requestOptions.headers,
            ),
          ),
        );
      }
    },
  );
  return responseCompleter.future;
}
