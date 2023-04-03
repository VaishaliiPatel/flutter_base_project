// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'validate_charger.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ValidateCharger _$ValidateChargerFromJson(Map<String, dynamic> json) {
  return _ValidateCharger.fromJson(json);
}

/// @nodoc
mixin _$ValidateCharger {
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  Data? get data => throw _privateConstructorUsedError;
  ValidationError? get validationError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ValidateChargerCopyWith<ValidateCharger> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidateChargerCopyWith<$Res> {
  factory $ValidateChargerCopyWith(
          ValidateCharger value, $Res Function(ValidateCharger) then) =
      _$ValidateChargerCopyWithImpl<$Res, ValidateCharger>;
  @useResult
  $Res call(
      {int? status,
      String? message,
      Data? data,
      ValidationError? validationError});

  $DataCopyWith<$Res>? get data;
  $ValidationErrorCopyWith<$Res>? get validationError;
}

/// @nodoc
class _$ValidateChargerCopyWithImpl<$Res, $Val extends ValidateCharger>
    implements $ValidateChargerCopyWith<$Res> {
  _$ValidateChargerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
    Object? validationError = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      validationError: freezed == validationError
          ? _value.validationError
          : validationError // ignore: cast_nullable_to_non_nullable
              as ValidationError?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ValidationErrorCopyWith<$Res>? get validationError {
    if (_value.validationError == null) {
      return null;
    }

    return $ValidationErrorCopyWith<$Res>(_value.validationError!, (value) {
      return _then(_value.copyWith(validationError: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ValidateChargerCopyWith<$Res>
    implements $ValidateChargerCopyWith<$Res> {
  factory _$$_ValidateChargerCopyWith(
          _$_ValidateCharger value, $Res Function(_$_ValidateCharger) then) =
      __$$_ValidateChargerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? status,
      String? message,
      Data? data,
      ValidationError? validationError});

  @override
  $DataCopyWith<$Res>? get data;
  @override
  $ValidationErrorCopyWith<$Res>? get validationError;
}

/// @nodoc
class __$$_ValidateChargerCopyWithImpl<$Res>
    extends _$ValidateChargerCopyWithImpl<$Res, _$_ValidateCharger>
    implements _$$_ValidateChargerCopyWith<$Res> {
  __$$_ValidateChargerCopyWithImpl(
      _$_ValidateCharger _value, $Res Function(_$_ValidateCharger) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
    Object? validationError = freezed,
  }) {
    return _then(_$_ValidateCharger(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      validationError: freezed == validationError
          ? _value.validationError
          : validationError // ignore: cast_nullable_to_non_nullable
              as ValidationError?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ValidateCharger implements _ValidateCharger {
  const _$_ValidateCharger(
      {this.status, this.message, this.data, this.validationError});

  factory _$_ValidateCharger.fromJson(Map<String, dynamic> json) =>
      _$$_ValidateChargerFromJson(json);

  @override
  final int? status;
  @override
  final String? message;
  @override
  final Data? data;
  @override
  final ValidationError? validationError;

  @override
  String toString() {
    return 'ValidateCharger(status: $status, message: $message, data: $data, validationError: $validationError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ValidateCharger &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.validationError, validationError) ||
                other.validationError == validationError));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, message, data, validationError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ValidateChargerCopyWith<_$_ValidateCharger> get copyWith =>
      __$$_ValidateChargerCopyWithImpl<_$_ValidateCharger>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ValidateChargerToJson(
      this,
    );
  }
}

abstract class _ValidateCharger implements ValidateCharger {
  const factory _ValidateCharger(
      {final int? status,
      final String? message,
      final Data? data,
      final ValidationError? validationError}) = _$_ValidateCharger;

  factory _ValidateCharger.fromJson(Map<String, dynamic> json) =
      _$_ValidateCharger.fromJson;

  @override
  int? get status;
  @override
  String? get message;
  @override
  Data? get data;
  @override
  ValidationError? get validationError;
  @override
  @JsonKey(ignore: true)
  _$$_ValidateChargerCopyWith<_$_ValidateCharger> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  List<ConnectorId>? get connectorId => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get tariffPlan => throw _privateConstructorUsedError;
  String? get tariffPlanCharge => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {List<ConnectorId>? connectorId,
      String? location,
      String? tariffPlan,
      String? tariffPlanCharge});
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connectorId = freezed,
    Object? location = freezed,
    Object? tariffPlan = freezed,
    Object? tariffPlanCharge = freezed,
  }) {
    return _then(_value.copyWith(
      connectorId: freezed == connectorId
          ? _value.connectorId
          : connectorId // ignore: cast_nullable_to_non_nullable
              as List<ConnectorId>?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      tariffPlan: freezed == tariffPlan
          ? _value.tariffPlan
          : tariffPlan // ignore: cast_nullable_to_non_nullable
              as String?,
      tariffPlanCharge: freezed == tariffPlanCharge
          ? _value.tariffPlanCharge
          : tariffPlanCharge // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$_DataCopyWith(_$_Data value, $Res Function(_$_Data) then) =
      __$$_DataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ConnectorId>? connectorId,
      String? location,
      String? tariffPlan,
      String? tariffPlanCharge});
}

/// @nodoc
class __$$_DataCopyWithImpl<$Res> extends _$DataCopyWithImpl<$Res, _$_Data>
    implements _$$_DataCopyWith<$Res> {
  __$$_DataCopyWithImpl(_$_Data _value, $Res Function(_$_Data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connectorId = freezed,
    Object? location = freezed,
    Object? tariffPlan = freezed,
    Object? tariffPlanCharge = freezed,
  }) {
    return _then(_$_Data(
      connectorId: freezed == connectorId
          ? _value._connectorId
          : connectorId // ignore: cast_nullable_to_non_nullable
              as List<ConnectorId>?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      tariffPlan: freezed == tariffPlan
          ? _value.tariffPlan
          : tariffPlan // ignore: cast_nullable_to_non_nullable
              as String?,
      tariffPlanCharge: freezed == tariffPlanCharge
          ? _value.tariffPlanCharge
          : tariffPlanCharge // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Data implements _Data {
  const _$_Data(
      {final List<ConnectorId>? connectorId,
      this.location,
      this.tariffPlan,
      this.tariffPlanCharge})
      : _connectorId = connectorId;

  factory _$_Data.fromJson(Map<String, dynamic> json) => _$$_DataFromJson(json);

  final List<ConnectorId>? _connectorId;
  @override
  List<ConnectorId>? get connectorId {
    final value = _connectorId;
    if (value == null) return null;
    if (_connectorId is EqualUnmodifiableListView) return _connectorId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? location;
  @override
  final String? tariffPlan;
  @override
  final String? tariffPlanCharge;

  @override
  String toString() {
    return 'Data(connectorId: $connectorId, location: $location, tariffPlan: $tariffPlan, tariffPlanCharge: $tariffPlanCharge)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data &&
            const DeepCollectionEquality()
                .equals(other._connectorId, _connectorId) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.tariffPlan, tariffPlan) ||
                other.tariffPlan == tariffPlan) &&
            (identical(other.tariffPlanCharge, tariffPlanCharge) ||
                other.tariffPlanCharge == tariffPlanCharge));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_connectorId),
      location,
      tariffPlan,
      tariffPlanCharge);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataCopyWith<_$_Data> get copyWith =>
      __$$_DataCopyWithImpl<_$_Data>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  const factory _Data(
      {final List<ConnectorId>? connectorId,
      final String? location,
      final String? tariffPlan,
      final String? tariffPlanCharge}) = _$_Data;

  factory _Data.fromJson(Map<String, dynamic> json) = _$_Data.fromJson;

  @override
  List<ConnectorId>? get connectorId;
  @override
  String? get location;
  @override
  String? get tariffPlan;
  @override
  String? get tariffPlanCharge;
  @override
  @JsonKey(ignore: true)
  _$$_DataCopyWith<_$_Data> get copyWith => throw _privateConstructorUsedError;
}

ConnectorId _$ConnectorIdFromJson(Map<String, dynamic> json) {
  return _ConnectorId.fromJson(json);
}

/// @nodoc
mixin _$ConnectorId {
  int? get connectorId => throw _privateConstructorUsedError;
  int? get connectorPk => throw _privateConstructorUsedError;
  String? get connectorStatus => throw _privateConstructorUsedError;
  String? get currentType => throw _privateConstructorUsedError;
  String? get connectorType => throw _privateConstructorUsedError;
  String? get connectorImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConnectorIdCopyWith<ConnectorId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectorIdCopyWith<$Res> {
  factory $ConnectorIdCopyWith(
          ConnectorId value, $Res Function(ConnectorId) then) =
      _$ConnectorIdCopyWithImpl<$Res, ConnectorId>;
  @useResult
  $Res call(
      {int? connectorId,
      int? connectorPk,
      String? connectorStatus,
      String? currentType,
      String? connectorType,
      String? connectorImage});
}

/// @nodoc
class _$ConnectorIdCopyWithImpl<$Res, $Val extends ConnectorId>
    implements $ConnectorIdCopyWith<$Res> {
  _$ConnectorIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connectorId = freezed,
    Object? connectorPk = freezed,
    Object? connectorStatus = freezed,
    Object? currentType = freezed,
    Object? connectorType = freezed,
    Object? connectorImage = freezed,
  }) {
    return _then(_value.copyWith(
      connectorId: freezed == connectorId
          ? _value.connectorId
          : connectorId // ignore: cast_nullable_to_non_nullable
              as int?,
      connectorPk: freezed == connectorPk
          ? _value.connectorPk
          : connectorPk // ignore: cast_nullable_to_non_nullable
              as int?,
      connectorStatus: freezed == connectorStatus
          ? _value.connectorStatus
          : connectorStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      currentType: freezed == currentType
          ? _value.currentType
          : currentType // ignore: cast_nullable_to_non_nullable
              as String?,
      connectorType: freezed == connectorType
          ? _value.connectorType
          : connectorType // ignore: cast_nullable_to_non_nullable
              as String?,
      connectorImage: freezed == connectorImage
          ? _value.connectorImage
          : connectorImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConnectorIdCopyWith<$Res>
    implements $ConnectorIdCopyWith<$Res> {
  factory _$$_ConnectorIdCopyWith(
          _$_ConnectorId value, $Res Function(_$_ConnectorId) then) =
      __$$_ConnectorIdCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? connectorId,
      int? connectorPk,
      String? connectorStatus,
      String? currentType,
      String? connectorType,
      String? connectorImage});
}

/// @nodoc
class __$$_ConnectorIdCopyWithImpl<$Res>
    extends _$ConnectorIdCopyWithImpl<$Res, _$_ConnectorId>
    implements _$$_ConnectorIdCopyWith<$Res> {
  __$$_ConnectorIdCopyWithImpl(
      _$_ConnectorId _value, $Res Function(_$_ConnectorId) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connectorId = freezed,
    Object? connectorPk = freezed,
    Object? connectorStatus = freezed,
    Object? currentType = freezed,
    Object? connectorType = freezed,
    Object? connectorImage = freezed,
  }) {
    return _then(_$_ConnectorId(
      connectorId: freezed == connectorId
          ? _value.connectorId
          : connectorId // ignore: cast_nullable_to_non_nullable
              as int?,
      connectorPk: freezed == connectorPk
          ? _value.connectorPk
          : connectorPk // ignore: cast_nullable_to_non_nullable
              as int?,
      connectorStatus: freezed == connectorStatus
          ? _value.connectorStatus
          : connectorStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      currentType: freezed == currentType
          ? _value.currentType
          : currentType // ignore: cast_nullable_to_non_nullable
              as String?,
      connectorType: freezed == connectorType
          ? _value.connectorType
          : connectorType // ignore: cast_nullable_to_non_nullable
              as String?,
      connectorImage: freezed == connectorImage
          ? _value.connectorImage
          : connectorImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ConnectorId implements _ConnectorId {
  const _$_ConnectorId(
      {this.connectorId,
      this.connectorPk,
      this.connectorStatus,
      this.currentType,
      this.connectorType,
      this.connectorImage});

  factory _$_ConnectorId.fromJson(Map<String, dynamic> json) =>
      _$$_ConnectorIdFromJson(json);

  @override
  final int? connectorId;
  @override
  final int? connectorPk;
  @override
  final String? connectorStatus;
  @override
  final String? currentType;
  @override
  final String? connectorType;
  @override
  final String? connectorImage;

  @override
  String toString() {
    return 'ConnectorId(connectorId: $connectorId, connectorPk: $connectorPk, connectorStatus: $connectorStatus, currentType: $currentType, connectorType: $connectorType, connectorImage: $connectorImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConnectorId &&
            (identical(other.connectorId, connectorId) ||
                other.connectorId == connectorId) &&
            (identical(other.connectorPk, connectorPk) ||
                other.connectorPk == connectorPk) &&
            (identical(other.connectorStatus, connectorStatus) ||
                other.connectorStatus == connectorStatus) &&
            (identical(other.currentType, currentType) ||
                other.currentType == currentType) &&
            (identical(other.connectorType, connectorType) ||
                other.connectorType == connectorType) &&
            (identical(other.connectorImage, connectorImage) ||
                other.connectorImage == connectorImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, connectorId, connectorPk,
      connectorStatus, currentType, connectorType, connectorImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConnectorIdCopyWith<_$_ConnectorId> get copyWith =>
      __$$_ConnectorIdCopyWithImpl<_$_ConnectorId>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConnectorIdToJson(
      this,
    );
  }
}

abstract class _ConnectorId implements ConnectorId {
  const factory _ConnectorId(
      {final int? connectorId,
      final int? connectorPk,
      final String? connectorStatus,
      final String? currentType,
      final String? connectorType,
      final String? connectorImage}) = _$_ConnectorId;

  factory _ConnectorId.fromJson(Map<String, dynamic> json) =
      _$_ConnectorId.fromJson;

  @override
  int? get connectorId;
  @override
  int? get connectorPk;
  @override
  String? get connectorStatus;
  @override
  String? get currentType;
  @override
  String? get connectorType;
  @override
  String? get connectorImage;
  @override
  @JsonKey(ignore: true)
  _$$_ConnectorIdCopyWith<_$_ConnectorId> get copyWith =>
      throw _privateConstructorUsedError;
}

ValidationError _$ValidationErrorFromJson(Map<String, dynamic> json) {
  return _ValidationError.fromJson(json);
}

/// @nodoc
mixin _$ValidationError {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidationErrorCopyWith<$Res> {
  factory $ValidationErrorCopyWith(
          ValidationError value, $Res Function(ValidationError) then) =
      _$ValidationErrorCopyWithImpl<$Res, ValidationError>;
}

/// @nodoc
class _$ValidationErrorCopyWithImpl<$Res, $Val extends ValidationError>
    implements $ValidationErrorCopyWith<$Res> {
  _$ValidationErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ValidationErrorCopyWith<$Res> {
  factory _$$_ValidationErrorCopyWith(
          _$_ValidationError value, $Res Function(_$_ValidationError) then) =
      __$$_ValidationErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ValidationErrorCopyWithImpl<$Res>
    extends _$ValidationErrorCopyWithImpl<$Res, _$_ValidationError>
    implements _$$_ValidationErrorCopyWith<$Res> {
  __$$_ValidationErrorCopyWithImpl(
      _$_ValidationError _value, $Res Function(_$_ValidationError) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$_ValidationError implements _ValidationError {
  const _$_ValidationError();

  factory _$_ValidationError.fromJson(Map<String, dynamic> json) =>
      _$$_ValidationErrorFromJson(json);

  @override
  String toString() {
    return 'ValidationError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ValidationError);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$_ValidationErrorToJson(
      this,
    );
  }
}

abstract class _ValidationError implements ValidationError {
  const factory _ValidationError() = _$_ValidationError;

  factory _ValidationError.fromJson(Map<String, dynamic> json) =
      _$_ValidationError.fromJson;
}
