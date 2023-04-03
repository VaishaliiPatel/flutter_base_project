// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_charger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ValidateCharger _$$_ValidateChargerFromJson(Map json) => _$_ValidateCharger(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(Map<String, dynamic>.from(json['data'] as Map)),
      validationError: json['validation_error'] == null
          ? null
          : ValidationError.fromJson(
              Map<String, dynamic>.from(json['validation_error'] as Map)),
    );

Map<String, dynamic> _$$_ValidateChargerToJson(_$_ValidateCharger instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.toJson(),
      'validation_error': instance.validationError?.toJson(),
    };

_$_Data _$$_DataFromJson(Map json) => _$_Data(
      connectorId: (json['connector_id'] as List<dynamic>?)
          ?.map(
              (e) => ConnectorId.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      location: json['location'] as String?,
      tariffPlan: json['tariff_plan'] as String?,
      tariffPlanCharge: json['tariff_plan_charge'] as String?,
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'connector_id': instance.connectorId?.map((e) => e.toJson()).toList(),
      'location': instance.location,
      'tariff_plan': instance.tariffPlan,
      'tariff_plan_charge': instance.tariffPlanCharge,
    };

_$_ConnectorId _$$_ConnectorIdFromJson(Map json) => _$_ConnectorId(
      connectorId: json['connector_id'] as int?,
      connectorPk: json['connector_pk'] as int?,
      connectorStatus: json['connector_status'] as String?,
      currentType: json['current_type'] as String?,
      connectorType: json['connector_type'] as String?,
      connectorImage: json['connector_image'] as String?,
    );

Map<String, dynamic> _$$_ConnectorIdToJson(_$_ConnectorId instance) =>
    <String, dynamic>{
      'connector_id': instance.connectorId,
      'connector_pk': instance.connectorPk,
      'connector_status': instance.connectorStatus,
      'current_type': instance.currentType,
      'connector_type': instance.connectorType,
      'connector_image': instance.connectorImage,
    };

_$_ValidationError _$$_ValidationErrorFromJson(Map json) =>
    _$_ValidationError();

Map<String, dynamic> _$$_ValidationErrorToJson(_$_ValidationError instance) =>
    <String, dynamic>{};
