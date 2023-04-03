import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'stop_transaction_status_model.freezed.dart';

part 'stop_transaction_status_model.g.dart';

StopTransactionStatusModel stopTransactionStatusModelFromJson(String str) =>
    StopTransactionStatusModel.fromJson(json.decode(str));

String stopTransactionStatusModelStatusModelToJson(StopTransactionStatusModel data) => json.encode(data.toJson());

@freezed
class StopTransactionStatusModel with _$StopTransactionStatusModel {
  const factory StopTransactionStatusModel(
      {int? status, String? message, Data? data, ValidationError? validationError}) = _StopTransactionStatusModel;

  factory StopTransactionStatusModel.fromJson(Map<String, dynamic> json) =>
      _$StopTransactionStatusModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    String? taskStatus,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class ValidationError with _$ValidationError {
  const factory ValidationError() = _ValidationError;

  factory ValidationError.fromJson(Map<String, dynamic> json) => _$ValidationErrorFromJson(json);
}
