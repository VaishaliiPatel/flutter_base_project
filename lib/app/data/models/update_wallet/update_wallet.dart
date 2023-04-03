import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_wallet.freezed.dart';

part 'update_wallet.g.dart';

UpdateWalletModel updateWalletModelFromJson(String str) => UpdateWalletModel.fromJson(json.decode(str));

String updateWalletModelToJson(UpdateWalletModel data) => json.encode(data.toJson());

@freezed
class UpdateWalletModel with _$UpdateWalletModel {
  const factory UpdateWalletModel({int? status, String? message, Data? data, ValidationError? validationError}) =
      _UpdateWalletModel;

  factory UpdateWalletModel.fromJson(Map<String, dynamic> json) => _$UpdateWalletModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data() = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
abstract class ValidationError with _$ValidationError {
  const factory ValidationError() = _ValidationError;

  factory ValidationError.fromJson(Map<String, dynamic> json) => _$ValidationErrorFromJson(json);
}
