// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map json) => _$_User(
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

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.toJson(),
      'validation_error': instance.validationError?.toJson(),
    };

_$_Data _$$_DataFromJson(Map json) => _$_Data(
      user: json['user'] == null
          ? null
          : UserClass.fromJson(Map<String, dynamic>.from(json['user'] as Map)),
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'user': instance.user?.toJson(),
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };

_$_UserClass _$$_UserClassFromJson(Map json) => _$_UserClass(
      userPk: json['user_pk'] as int?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      access: json['access'] as String?,
      mobileNo: json['mobile_no'] as String?,
      email: json['email'] as String?,
      countryCode: json['country_code'] as int?,
      userImage: json['user_image'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      pincode: json['pincode'] as String?,
    );

Map<String, dynamic> _$$_UserClassToJson(_$_UserClass instance) =>
    <String, dynamic>{
      'user_pk': instance.userPk,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'access': instance.access,
      'mobile_no': instance.mobileNo,
      'email': instance.email,
      'country_code': instance.countryCode,
      'user_image': instance.userImage,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'pincode': instance.pincode,
    };

_$_ValidationError _$$_ValidationErrorFromJson(Map json) => _$_ValidationError(
      mobileNo: (json['mobile_no'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      email:
          (json['email'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_ValidationErrorToJson(_$_ValidationError instance) =>
    <String, dynamic>{
      'mobile_no': instance.mobileNo,
      'email': instance.email,
    };
