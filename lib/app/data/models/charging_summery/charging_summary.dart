// To parse this JSON data, do
//
//     final chargingSummery = chargingSummeryFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'charging_summary.freezed.dart';
part 'charging_summary.g.dart';

ChargingSummary chargingSummeryFromJson(String str) => ChargingSummary.fromJson(json.decode(str));

String chargingSummeryToJson(ChargingSummary data) => json.encode(data.toJson());

@freezed
abstract class ChargingSummary with _$ChargingSummary {
  const factory ChargingSummary({
    int? status,
    String? message,
    Data? data,
    ValidationError? validationError,
  }) = _ChargingSummary;

  factory ChargingSummary.fromJson(Map<String, dynamic> json) => _$ChargingSummaryFromJson(json);
}

@freezed
abstract class Data with _$Data {
  const factory Data({
    TransactionData? transactionData,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
abstract class TransactionData with _$TransactionData {
  const factory TransactionData({
    DateTime? startTime,
    String? startVal,
    String? endVal,
    DateTime? endTime,
    String? stopReason,
    double? energyConsume,
    double? energyCharge,
    String? duration,
  }) = _TransactionData;

  factory TransactionData.fromJson(Map<String, dynamic> json) => _$TransactionDataFromJson(json);
}

@freezed
abstract class ValidationError with _$ValidationError {
  const factory ValidationError() = _ValidationError;

  factory ValidationError.fromJson(Map<String, dynamic> json) => _$ValidationErrorFromJson(json);
}
