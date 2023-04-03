// To parse this JSON data, do
//
//     final chargePointLocation = chargePointLocationFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'charge_point_location.freezed.dart';

part 'charge_point_location.g.dart';

ChargePointLocation chargePointLocationFromJson(String str) => ChargePointLocation.fromJson(json.decode(str));

String chargePointLocationToJson(ChargePointLocation data) => json.encode(data.toJson());

@freezed
abstract class ChargePointLocation with _$ChargePointLocation {
  const factory ChargePointLocation({
    int? status,
    String? message,
    Data? data,
    ValidationError? validationError,
  }) = _ChargePointLocation;

  factory ChargePointLocation.fromJson(Map<String, dynamic> json) => _$ChargePointLocationFromJson(json);
}

@freezed
abstract class Data with _$Data {
  const factory Data({
    ChargerLocation? chargerLocation,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@Freezed(unionValueCase: FreezedUnionCase.snake)
abstract class ChargerLocation with _$ChargerLocation {
  const factory ChargerLocation({
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
  }) = _ChargerLocation;

  factory ChargerLocation.fromJson(Map<String, dynamic> json) => _$ChargerLocationFromJson(json);
}

@Freezed(unionValueCase: FreezedUnionCase.snake)
abstract class Datum with _$Datum {
  const factory Datum({
    String? companyName,
    String? chargeBoxId,
    int? chargeBoxPk,
    String? chargeBoxType,
    String? phaseType,
    String? tariffPlan,
    String? zoneName,
    String? locationName,
    String? locationAddress,
    String? locationCity,
    String? locationState,
    String? locationCountry,
    String? locationPincode,
    String? locationLatitude,
    String? locationLongitude,
    bool? isChargingRunning,
    int? transactionId,
    String? tariffPlanCharge,
    List<ConnectorsByType>? acConnectors,
    List<ConnectorsByType>? dcConnectors,
    String? status,
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}
@freezed
abstract class ConnectorsByType with _$ConnectorsByType {
  const factory ConnectorsByType({
    int? connectorPk,
    String? chargeBoxId,
    int? connectorId,
    int? connectorTypePk,
    String? currentType,
    String? connectorType,
    String? connectorImage,
  }) = _ConnectorsByType;

  factory ConnectorsByType.fromJson(Map<String, dynamic> json) => _$ConnectorsByTypeFromJson(json);
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
