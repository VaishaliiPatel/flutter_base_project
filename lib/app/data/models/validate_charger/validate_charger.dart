// To parse this JSON data, do
//
//     final validateCharger = validateChargerFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'validate_charger.freezed.dart';
part 'validate_charger.g.dart';

ValidateCharger validateChargerFromJson(String str) => ValidateCharger.fromJson(json.decode(str));

String validateChargerToJson(ValidateCharger data) => json.encode(data.toJson());

@Freezed(unionValueCase: FreezedUnionCase.snake)
abstract class ValidateCharger with _$ValidateCharger {
  const factory ValidateCharger({
    int? status,
    String? message,
    Data? data,
    ValidationError? validationError,
  }) = _ValidateCharger;

  factory ValidateCharger.fromJson(Map<String, dynamic> json) => _$ValidateChargerFromJson(json);
}

@Freezed(unionValueCase: FreezedUnionCase.snake)
abstract class Data with _$Data {
  const factory Data({
    List<ConnectorId>? connectorId,
    String? location,
    String? tariffPlan,
    String? tariffPlanCharge,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@Freezed(unionValueCase: FreezedUnionCase.snake)
abstract class ConnectorId with _$ConnectorId {
  const factory ConnectorId({
    int? connectorId,
    int? connectorPk,
    String? connectorStatus,
    String? currentType,
    String? connectorType,
    String? connectorImage,
  }) = _ConnectorId;

  factory ConnectorId.fromJson(Map<String, dynamic> json) => _$ConnectorIdFromJson(json);
}

@Freezed(unionValueCase: FreezedUnionCase.snake)
abstract class ValidationError with _$ValidationError {
  const factory ValidationError() = _ValidationError;

  factory ValidationError.fromJson(Map<String, dynamic> json) => _$ValidationErrorFromJson(json);
}
