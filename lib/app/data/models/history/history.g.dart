// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_History _$$_HistoryFromJson(Map json) => _$_History(
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

Map<String, dynamic> _$$_HistoryToJson(_$_History instance) =>
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

Map<String, dynamic> _$$_TransactionDataToJson(_$_TransactionData instance) =>
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
      transactionId: json['transaction_id'] as int?,
      location: json['location'] as String?,
      connectorId: json['connector_id'] as int?,
      connectorType: json['connector_type'] as String?,
      currentType: json['current_type'] as String?,
      connectorImage: json['connector_image'] as String?,
      locationAddress: json['location_address'] as String?,
      startDate: json['start_date'] as String?,
      startTime: json['start_time'] as String?,
      startVal: json['start_val'] as String?,
      endVal: json['end_val'] as String?,
      endTime: json['end_time'] as String?,
      stopReason: json['stop_reason'] as String?,
      energyConsume: (json['energy_consume'] as num?)?.toDouble(),
      energyCharge: (json['energy_charge'] as num?)?.toDouble(),
      duration: json['duration'] as String?,
    );

Map<String, dynamic> _$$_DatumToJson(_$_Datum instance) => <String, dynamic>{
      'transaction_id': instance.transactionId,
      'location': instance.location,
      'connector_id': instance.connectorId,
      'connector_type': instance.connectorType,
      'current_type': instance.currentType,
      'connector_image': instance.connectorImage,
      'location_address': instance.locationAddress,
      'start_date': instance.startDate,
      'start_time': instance.startTime,
      'start_val': instance.startVal,
      'end_val': instance.endVal,
      'end_time': instance.endTime,
      'stop_reason': instance.stopReason,
      'energy_consume': instance.energyConsume,
      'energy_charge': instance.energyCharge,
      'duration': instance.duration,
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
