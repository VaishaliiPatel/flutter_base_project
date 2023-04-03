// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_meter_value_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionMeterValueModel _$$_TransactionMeterValueModelFromJson(
        Map json) =>
    _$_TransactionMeterValueModel(
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

Map<String, dynamic> _$$_TransactionMeterValueModelToJson(
        _$_TransactionMeterValueModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.toJson(),
      'validation_error': instance.validationError?.toJson(),
    };

_$_Data _$$_DataFromJson(Map json) => _$_Data(
      energyUsed: (json['energy_used'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
      isChargingStop: json['is_charging_stop'] as bool?,
      remainingTime: json['remaining_time'] as String?,
      remainingTimeInSeconds: json['remaining_time_in_seconds'] as int?,
      selectedOperationType: json['selected_operation_type'] as int?,
      selectedEnergy: (json['selected_energy'] as num?)?.toDouble(),
      totalTime: json['total_time'] as String?,
      totalTimeSeconds: json['total_time_seconds'] as int?,
      energyUsageCharge: (json['energy_usage_charge'] as num?)?.toDouble(),
      totalAmountForCharge:
          (json['total_amount_for_charge'] as num?)?.toDouble(),
      remainAmountForCharge:
          (json['remain_amount_for_charge'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'energy_used': instance.energyUsed,
      'unit': instance.unit,
      'is_charging_stop': instance.isChargingStop,
      'remaining_time': instance.remainingTime,
      'remaining_time_in_seconds': instance.remainingTimeInSeconds,
      'selected_operation_type': instance.selectedOperationType,
      'selected_energy': instance.selectedEnergy,
      'total_time': instance.totalTime,
      'total_time_seconds': instance.totalTimeSeconds,
      'energy_usage_charge': instance.energyUsageCharge,
      'total_amount_for_charge': instance.totalAmountForCharge,
      'remain_amount_for_charge': instance.remainAmountForCharge,
    };

_$_ValidationError _$$_ValidationErrorFromJson(Map json) =>
    _$_ValidationError();

Map<String, dynamic> _$$_ValidationErrorToJson(_$_ValidationError instance) =>
    <String, dynamic>{};
