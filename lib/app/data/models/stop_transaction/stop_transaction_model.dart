import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'stop_transaction_model.freezed.dart';

part 'stop_transaction_model.g.dart';

StopTransaction stopTransactionFromJson(String str) => StopTransaction.fromJson(json.decode(str));

String stopTransactionToJson(StopTransaction data) => json.encode(data.toJson());

@freezed
class StopTransaction with _$StopTransaction {
  const factory StopTransaction({int? status, String? message, Data? data, ValidationError? validationError}) =
      _StopTransaction;

  factory StopTransaction.fromJson(Map<String, dynamic> json) => _$StopTransactionFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    int? taskId,
    String? transactionId,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class ValidationError with _$ValidationError {
  const factory ValidationError() = _ValidationError;

  factory ValidationError.fromJson(Map<String, dynamic> json) => _$ValidationErrorFromJson(json);
}
