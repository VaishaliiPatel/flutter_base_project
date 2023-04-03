import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password.freezed.dart';
part 'change_password.g.dart';
ChangePasswordModel changePasswordModelFromJson(String str) => ChangePasswordModel.fromJson(json.decode(str));

String changePasswordModelToJson(ChangePasswordModel data) => json.encode(data.toJson());

@freezed
class ChangePasswordModel with _$ChangePasswordModel {
  const factory ChangePasswordModel({int? status, String? message, Data? data, ValidationError? validationError}) =
      _ChangePasswordModel;

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) => _$ChangePasswordModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data() = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
abstract class ValidationError with _$ValidationError {
  const factory ValidationError({
    List<String>? currentPassword,
    List<String>? newPassword,
  }) = _ValidationError;

  factory ValidationError.fromJson(Map<String, dynamic> json) => _$ValidationErrorFromJson(json);
}