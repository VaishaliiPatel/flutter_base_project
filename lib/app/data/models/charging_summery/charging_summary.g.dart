// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charging_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChargingSummary _$$_ChargingSummaryFromJson(Map json) => _$_ChargingSummary(
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

Map<String, dynamic> _$$_ChargingSummaryToJson(_$_ChargingSummary instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.toJson(),
      'validation_error': instance.validationError?.toJson(),
    };

_$_Data _$$_DataFromJson(Map json) => _$_Data(
      transactionData: json['transaction_data'] == null
          ? null
          : TransactionData.fromJson(
              Map<String, dynamic>.from(json['transaction_data'] as Map)),
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'transaction_data': instance.transactionData?.toJson(),
    };

_$_TransactionData _$$_TransactionDataFromJson(Map json) => _$_TransactionData(
      startTime: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      startVal: json['start_val'] as String?,
      endVal: json['end_val'] as String?,
      endTime: json['end_time'] == null
          ? null
          : DateTime.parse(json['end_time'] as String),
      stopReason: json['stop_reason'] as String?,
      energyConsume: (json['energy_consume'] as num?)?.toDouble(),
      energyCharge: (json['energy_charge'] as num?)?.toDouble(),
      duration: json['duration'] as String?,
    );

Map<String, dynamic> _$$_TransactionDataToJson(_$_TransactionData instance) =>
    <String, dynamic>{
      'start_time': instance.startTime?.toIso8601String(),
      'start_val': instance.startVal,
      'end_val': instance.endVal,
      'end_time': instance.endTime?.toIso8601String(),
      'stop_reason': instance.stopReason,
      'energy_consume': instance.energyConsume,
      'energy_charge': instance.energyCharge,
      'duration': instance.duration,
    };

_$_ValidationError _$$_ValidationErrorFromJson(Map json) =>
    _$_ValidationError();

Map<String, dynamic> _$$_ValidationErrorToJson(_$_ValidationError instance) =>
    <String, dynamic>{};
