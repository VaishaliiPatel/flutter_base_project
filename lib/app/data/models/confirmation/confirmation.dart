// To parse this JSON data, do
//
//     final confirmation = confirmationFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'confirmation.freezed.dart';

part 'confirmation.g.dart';

Confirmation confirmationFromJson(String str) => Confirmation.fromJson(json.decode(str));

String confirmationToJson(Confirmation data) => json.encode(data.toJson());

@Freezed(unionValueCase: FreezedUnionCase.snake)
abstract class Confirmation with _$Confirmation {
  const factory Confirmation({
    int? status,
    String? message,
    Data? data,
    ValidationError? validationError,
  }) = _Confirmation;

  factory Confirmation.fromJson(Map<String, dynamic> json) => _$ConfirmationFromJson(json);
}

@freezed
abstract class Data with _$Data {
  const factory Data() = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
abstract class ValidationError with _$ValidationError {
  const factory ValidationError({
    List<String>? firstName,
    List<String>? email,
  }) = _ValidationError;

  factory ValidationError.fromJson(Map<String, dynamic> json) => _$ValidationErrorFromJson(json);
}
