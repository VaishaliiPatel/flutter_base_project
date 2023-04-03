// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charge_point_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChargePointLocation _$$_ChargePointLocationFromJson(Map json) =>
    _$_ChargePointLocation(
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

Map<String, dynamic> _$$_ChargePointLocationToJson(
        _$_ChargePointLocation instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.toJson(),
      'validation_error': instance.validationError?.toJson(),
    };

_$_Data _$$_DataFromJson(Map json) => _$_Data(
      chargerLocation: json['charger_location'] == null
          ? null
          : ChargerLocation.fromJson(
              Map<String, dynamic>.from(json['charger_location'] as Map)),
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'charger_location': instance.chargerLocation?.toJson(),
    };

_$_ChargerLocation _$$_ChargerLocationFromJson(Map json) => _$_ChargerLocation(
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

Map<String, dynamic> _$$_ChargerLocationToJson(_$_ChargerLocation instance) =>
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
      companyName: json['company_name'] as String?,
      chargeBoxId: json['charge_box_id'] as String?,
      chargeBoxPk: json['charge_box_pk'] as int?,
      chargeBoxType: json['charge_box_type'] as String?,
      phaseType: json['phase_type'] as String?,
      tariffPlan: json['tariff_plan'] as String?,
      zoneName: json['zone_name'] as String?,
      locationName: json['location_name'] as String?,
      locationAddress: json['location_address'] as String?,
      locationCity: json['location_city'] as String?,
      locationState: json['location_state'] as String?,
      locationCountry: json['location_country'] as String?,
      locationPincode: json['location_pincode'] as String?,
      locationLatitude: json['location_latitude'] as String?,
      locationLongitude: json['location_longitude'] as String?,
      isChargingRunning: json['is_charging_running'] as bool?,
      transactionId: json['transaction_id'] as int?,
      tariffPlanCharge: json['tariff_plan_charge'] as String?,
      acConnectors: (json['ac_connectors'] as List<dynamic>?)
          ?.map((e) =>
              ConnectorsByType.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      dcConnectors: (json['dc_connectors'] as List<dynamic>?)
          ?.map((e) =>
              ConnectorsByType.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_DatumToJson(_$_Datum instance) => <String, dynamic>{
      'company_name': instance.companyName,
      'charge_box_id': instance.chargeBoxId,
      'charge_box_pk': instance.chargeBoxPk,
      'charge_box_type': instance.chargeBoxType,
      'phase_type': instance.phaseType,
      'tariff_plan': instance.tariffPlan,
      'zone_name': instance.zoneName,
      'location_name': instance.locationName,
      'location_address': instance.locationAddress,
      'location_city': instance.locationCity,
      'location_state': instance.locationState,
      'location_country': instance.locationCountry,
      'location_pincode': instance.locationPincode,
      'location_latitude': instance.locationLatitude,
      'location_longitude': instance.locationLongitude,
      'is_charging_running': instance.isChargingRunning,
      'transaction_id': instance.transactionId,
      'tariff_plan_charge': instance.tariffPlanCharge,
      'ac_connectors': instance.acConnectors?.map((e) => e.toJson()).toList(),
      'dc_connectors': instance.dcConnectors?.map((e) => e.toJson()).toList(),
      'status': instance.status,
    };

_$_ConnectorsByType _$$_ConnectorsByTypeFromJson(Map json) =>
    _$_ConnectorsByType(
      connectorPk: json['connector_pk'] as int?,
      chargeBoxId: json['charge_box_id'] as String?,
      connectorId: json['connector_id'] as int?,
      connectorTypePk: json['connector_type_pk'] as int?,
      currentType: json['current_type'] as String?,
      connectorType: json['connector_type'] as String?,
      connectorImage: json['connector_image'] as String?,
    );

Map<String, dynamic> _$$_ConnectorsByTypeToJson(_$_ConnectorsByType instance) =>
    <String, dynamic>{
      'connector_pk': instance.connectorPk,
      'charge_box_id': instance.chargeBoxId,
      'connector_id': instance.connectorId,
      'connector_type_pk': instance.connectorTypePk,
      'current_type': instance.currentType,
      'connector_type': instance.connectorType,
      'connector_image': instance.connectorImage,
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
