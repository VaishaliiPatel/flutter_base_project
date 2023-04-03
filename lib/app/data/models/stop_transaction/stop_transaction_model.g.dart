// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StopTransaction _$$_StopTransactionFromJson(Map json) => _$_StopTransaction(
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

Map<String, dynamic> _$$_StopTransactionToJson(_$_StopTransaction instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.toJson(),
      'validation_error': instance.validationError?.toJson(),
    };

_$_Data _$$_DataFromJson(Map json) => _$_Data(
      taskId: json['task_id'] as int?,
      transactionId: json['transaction_id'] as String?,
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'task_id': instance.taskId,
      'transaction_id': instance.transactionId,
    };

_$_ValidationError _$$_ValidationErrorFromJson(Map json) =>
    _$_ValidationError();

Map<String, dynamic> _$$_ValidationErrorToJson(_$_ValidationError instance) =>
    <String, dynamic>{};
