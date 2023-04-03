// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirmation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Confirmation _$$_ConfirmationFromJson(Map json) => _$_Confirmation(
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

Map<String, dynamic> _$$_ConfirmationToJson(_$_Confirmation instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.toJson(),
      'validation_error': instance.validationError?.toJson(),
    };

_$_Data _$$_DataFromJson(Map json) => _$_Data();

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{};

_$_ValidationError _$$_ValidationErrorFromJson(Map json) => _$_ValidationError(
      firstName: (json['first_name'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      email:
          (json['email'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_ValidationErrorToJson(_$_ValidationError instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'email': instance.email,
    };
