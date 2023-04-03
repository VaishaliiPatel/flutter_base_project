// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';

part 'user_profile.g.dart';

UserProfile userProfileFromJson(String str) => UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    int? status,
    String? message,
    Data? data,
    ValidationError? validationError,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
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
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class ValidationError with _$ValidationError {
  const factory ValidationError() = _ValidationError;

  factory ValidationError.fromJson(Map<String, dynamic> json) => _$ValidationErrorFromJson(json);
}
