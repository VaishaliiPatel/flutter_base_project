import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_history.freezed.dart';

part 'payment_history.g.dart';

PaymentHistoryModel paymentHistoryModelFromJson(String str) => PaymentHistoryModel.fromJson(json.decode(str));

String paymentHistoryModelToJson(PaymentHistoryModel data) => json.encode(data.toJson());

@freezed
abstract class PaymentHistoryModel with _$PaymentHistoryModel {
  const factory PaymentHistoryModel({
    int? status,
    String? message,
    Data? data,
    ValidationError? validationError,
  }) = _PaymentHistoryModel;

  factory PaymentHistoryModel.fromJson(Map<String, dynamic> json) => _$PaymentHistoryModelFromJson(json);
}

@freezed
abstract class Data with _$Data {
  const factory Data({
    PaymentHistory? paymentHistory,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
abstract class PaymentHistory with _$PaymentHistory {
  const factory PaymentHistory({
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
  }) = _PaymentHistory;

  factory PaymentHistory.fromJson(Map<String, dynamic> json) => _$PaymentHistoryFromJson(json);
}

@freezed
abstract class Datum with _$Datum {
  const factory Datum({
    String? location,
    String? dateTime,
    double? amount,
    String? type,
    String? paymentId,
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}

@freezed
abstract class Link with _$Link {
  const factory Link({
    String? url,
    String? label,
    bool? active,
  }) = _Link;

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);
}

@freezed
abstract class ValidationError with _$ValidationError {
  const factory ValidationError() = _ValidationError;

  factory ValidationError.fromJson(Map<String, dynamic> json) => _$ValidationErrorFromJson(json);
}

