// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_transaction_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StopTransactionStatusModel _$$_StopTransactionStatusModelFromJson(
        Map json) =>
    _$_StopTransactionStatusModel(
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

Map<String, dynamic> _$$_StopTransactionStatusModelToJson(
        _$_StopTransactionStatusModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.toJson(),
      'validation_error': instance.validationError?.toJson(),
    };

_$_Data _$$_DataFromJson(Map json) => _$_Data(
      taskStatus: json['task_status'] as String?,
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'task_status': instance.taskStatus,
    };

_$_ValidationError _$$_ValidationErrorFromJson(Map json) =>
    _$_ValidationError();

Map<String, dynamic> _$$_ValidationErrorToJson(_$_ValidationError instance) =>
    <String, dynamic>{};
