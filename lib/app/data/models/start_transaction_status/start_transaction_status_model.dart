import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'start_transaction_status_model.freezed.dart';

part 'start_transaction_status_model.g.dart';

StartTransactionStatusModel startTransactionStatusModelFromJson(String str) =>
    StartTransactionStatusModel.fromJson(json.decode(str));

String startTransactionStatusModelStatusModelToJson(StartTransactionStatusModel data) => json.encode(data.toJson());

@freezed
class StartTransactionStatusModel with _$StartTransactionStatusModel {
  const factory StartTransactionStatusModel(
      {int? status, String? message, Data? data, ValidationError? validationError}) = _StartTransactionStatusModel;

  factory StartTransactionStatusModel.fromJson(Map<String, dynamic> json) =>
      _$StartTransactionStatusModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    String? taskStatus,
    int? transactionId,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class ValidationError with _$ValidationError {
  const factory ValidationError() = _ValidationError;

  factory ValidationError.fromJson(Map<String, dynamic> json) => _$ValidationErrorFromJson(json);
}
