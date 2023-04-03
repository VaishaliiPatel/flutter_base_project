// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentHistoryModel _$$_PaymentHistoryModelFromJson(Map json) =>
    _$_PaymentHistoryModel(
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

Map<String, dynamic> _$$_PaymentHistoryModelToJson(
        _$_PaymentHistoryModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.toJson(),
      'validation_error': instance.validationError?.toJson(),
    };

_$_Data _$$_DataFromJson(Map json) => _$_Data(
      paymentHistory: json['payment_history'] == null
          ? null
          : PaymentHistory.fromJson(
              Map<String, dynamic>.from(json['payment_history'] as Map)),
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'payment_history': instance.paymentHistory?.toJson(),
    };

_$_PaymentHistory _$$_PaymentHistoryFromJson(Map json) => _$_PaymentHistory(
      currentPage: json['current_page'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      firstPageUrl: json['first_page_url'] as String?,
      from: json['from'] as int?,
      lastPage: json['last_page'] as int?,
      lastPageUrl: json['last_page_url'] as String?,
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => Link.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      nextPageUrl: json['next_page_url'],
      path: json['path'] as String?,
      perPage: json['per_page'] as int?,
      prevPageUrl: json['prev_page_url'],
      to: json['to'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$$_PaymentHistoryToJson(_$_PaymentHistory instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'first_page_url': instance.firstPageUrl,
      'from': instance.from,
      'last_page': instance.lastPage,
      'last_page_url': instance.lastPageUrl,
      'links': instance.links?.map((e) => e.toJson()).toList(),
      'next_page_url': instance.nextPageUrl,
      'path': instance.path,
      'per_page': instance.perPage,
      'prev_page_url': instance.prevPageUrl,
      'to': instance.to,
      'total': instance.total,
    };

_$_Datum _$$_DatumFromJson(Map json) => _$_Datum(
      location: json['location'] as String?,
      dateTime: json['date_time'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      type: json['type'] as String?,
      paymentId: json['payment_id'] as String?,
    );

Map<String, dynamic> _$$_DatumToJson(_$_Datum instance) => <String, dynamic>{
      'location': instance.location,
      'date_time': instance.dateTime,
      'amount': instance.amount,
      'type': instance.type,
      'payment_id': instance.paymentId,
    };

_$_Link _$$_LinkFromJson(Map json) => _$_Link(
      url: json['url'] as String?,
      label: json['label'] as String?,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$$_LinkToJson(_$_Link instance) => <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };

_$_ValidationError _$$_ValidationErrorFromJson(Map json) =>
    _$_ValidationError();

Map<String, dynamic> _$$_ValidationErrorToJson(_$_ValidationError instance) =>
    <String, dynamic>{};
