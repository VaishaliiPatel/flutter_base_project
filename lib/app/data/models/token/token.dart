// To parse this JSON data, do
//
//     final token = tokenFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'token.freezed.dart';
part 'token.g.dart';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toJson());

@Freezed(unionValueCase: FreezedUnionCase.snake)
abstract class Token with _$Token {
  const factory Token({
    int? status,
    String? message,
    Data? data,
    ValidationError? validationError,
  }) = _Token;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}

@freezed
abstract class Data with _$Data {
  const factory Data({
    String? accessToken,
    String? refreshToken,
  }) = _Data;

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
