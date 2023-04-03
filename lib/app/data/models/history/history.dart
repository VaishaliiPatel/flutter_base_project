// To parse this JSON data, do
//
//     final history = historyFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'history.freezed.dart';
part 'history.g.dart';

History historyFromJson(String str) => History.fromJson(json.decode(str));

String historyToJson(History data) => json.encode(data.toJson());

@Freezed(unionValueCase: FreezedUnionCase.snake)
abstract class History with _$History {
  const factory History({
    int? status,
    String? message,
    Data? data,
    ValidationError? validationError,
  }) = _History;

  factory History.fromJson(Map<String, dynamic> json) => _$HistoryFromJson(json);
}

@Freezed(unionValueCase: FreezedUnionCase.snake)
abstract class Data with _$Data {
  const factory Data({
    TransactionData? transactionData,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@Freezed(unionValueCase: FreezedUnionCase.snake)
abstract class TransactionData with _$TransactionData {
  const factory TransactionData({
    int? currentPage,
    List<Datum>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    List<Link>? links,
    dynamic nextPageUrl,
    String? path,
    int? perPage,
    dynamic prevPageUrl,
    int? to,
    int? total,
  }) = _TransactionData;

  factory TransactionData.fromJson(Map<String, dynamic> json) => _$TransactionDataFromJson(json);
}

@Freezed(unionValueCase: FreezedUnionCase.snake)
abstract class Datum with _$Datum {
  const factory Datum({
    int? transactionId,
    String? location,
    int? connectorId,
    String? connectorType,
    String? currentType,
    String? connectorImage,
    String? locationAddress,
    String? startDate,
    String? startTime,
    String? startVal,
    String? endVal,
    String? endTime,
    String? stopReason,
    double? energyConsume,
    double? energyCharge,
    String? duration,
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}

@Freezed(unionValueCase: FreezedUnionCase.snake)
abstract class Link with _$Link {
  const factory Link({
    String? url,
    String? label,
    bool? active,
  }) = _Link;

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);
}

@Freezed(unionValueCase: FreezedUnionCase.snake)
abstract class ValidationError with _$ValidationError {
  const factory ValidationError() = _ValidationError;

  factory ValidationError.fromJson(Map<String, dynamic> json) => _$ValidationErrorFromJson(json);
}
