// To parse this JSON data, do
//
//     final confirmation = confirmationFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'user.freezed.dart';
part 'user.g.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

@Freezed(unionValueCase: FreezedUnionCase.snake)
abstract class User with _$User {
  const factory User({
    int? status,
    String? message,
    Data? data,
    ValidationError? validationError,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
abstract class Data with _$Data {
  const factory Data({
    UserClass? user,
    String? accessToken,
    String? refreshToken,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
abstract class UserClass with _$UserClass {
  factory UserClass.fromJson(Map<String, dynamic> json) => _$UserClassFromJson(json);

  const factory UserClass({
    int? userPk,
    String? firstName,
    String? lastName,
    String? access,
    String? mobileNo,
    String? email,
    int? countryCode,
    String? userImage,
    String? address,
    String? city,
    String? state,
    String? country,
    String? pincode,
  }) = _UserClass;
}

@freezed
abstract class ValidationError with _$ValidationError {
  const factory ValidationError({
    List<String>? mobileNo,
    List<String>? email,
  }) = _ValidationError;

  factory ValidationError.fromJson(Map<String, dynamic> json) => _$ValidationErrorFromJson(json);
}
