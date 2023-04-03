import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'start_transaction_model.freezed.dart';
part 'start_transaction_model.g.dart';
StartTransaction startTransactionFromJson(String str) => StartTransaction.fromJson(json.decode(str));

String startTransactionToJson(StartTransaction data) => json.encode(data.toJson());

@freezed
class StartTransaction with _$StartTransaction {
  const factory StartTransaction({int? status, String? message, Data? data, ValidationError? validationError}) =
      _StartTransaction;

  factory StartTransaction.fromJson(Map<String, dynamic> json) => _$StartTransactionFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({int? taskId}) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class ValidationError with _$ValidationError {
  const factory ValidationError() = _ValidationError;

  factory ValidationError.fromJson(Map<String, dynamic> json) => _$ValidationErrorFromJson(json);
}
