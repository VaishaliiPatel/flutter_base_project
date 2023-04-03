// To parse this JSON data, do
//
//     final wallet = walletFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'wallet.freezed.dart';
part 'wallet.g.dart';

Wallet walletFromJson(String str) => Wallet.fromJson(json.decode(str));

String walletToJson(Wallet data) => json.encode(data.toJson());

@freezed
abstract class Wallet with _$Wallet {
  const factory Wallet({
    int? status,
    String? message,
    Data? data,
    ValidationError? validationError,
  }) = _Wallet;

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);
}

@Freezed(unionValueCase: FreezedUnionCase.snake)
abstract class Data with _$Data {
  const factory Data({
    int? userId,
    double? wallet,
    double? reservedWalletBal,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
abstract class ValidationError with _$ValidationError {
  const factory ValidationError() = _ValidationError;

  factory ValidationError.fromJson(Map<String, dynamic> json) => _$ValidationErrorFromJson(json);
}
