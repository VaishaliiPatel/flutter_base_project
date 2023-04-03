// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'charge_point_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChargePointLocation _$ChargePointLocationFromJson(Map<String, dynamic> json) {
  return _ChargePointLocation.fromJson(json);
}

/// @nodoc
mixin _$ChargePointLocation {
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  Data? get data => throw _privateConstructorUsedError;
  ValidationError? get validationError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChargePointLocationCopyWith<ChargePointLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChargePointLocationCopyWith<$Res> {
  factory $ChargePointLocationCopyWith(
          ChargePointLocation value, $Res Function(ChargePointLocation) then) =
      _$ChargePointLocationCopyWithImpl<$Res, ChargePointLocation>;
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
class _$ChargePointLocationCopyWithImpl<$Res, $Val extends ChargePointLocation>
    implements $ChargePointLocationCopyWith<$Res> {
  _$ChargePointLocationCopyWithImpl(this._value, this._then);

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
abstract class _$$_ChargePointLocationCopyWith<$Res>
    implements $ChargePointLocationCopyWith<$Res> {
  factory _$$_ChargePointLocationCopyWith(_$_ChargePointLocation value,
          $Res Function(_$_ChargePointLocation) then) =
      __$$_ChargePointLocationCopyWithImpl<$Res>;
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
class __$$_ChargePointLocationCopyWithImpl<$Res>
    extends _$ChargePointLocationCopyWithImpl<$Res, _$_ChargePointLocation>
    implements _$$_ChargePointLocationCopyWith<$Res> {
  __$$_ChargePointLocationCopyWithImpl(_$_ChargePointLocation _value,
      $Res Function(_$_ChargePointLocation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
    Object? validationError = freezed,
  }) {
    return _then(_$_ChargePointLocation(
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
class _$_ChargePointLocation implements _ChargePointLocation {
  const _$_ChargePointLocation(
      {this.status, this.message, this.data, this.validationError});

  factory _$_ChargePointLocation.fromJson(Map<String, dynamic> json) =>
      _$$_ChargePointLocationFromJson(json);

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
    return 'ChargePointLocation(status: $status, message: $message, data: $data, validationError: $validationError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChargePointLocation &&
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
  _$$_ChargePointLocationCopyWith<_$_ChargePointLocation> get copyWith =>
      __$$_ChargePointLocationCopyWithImpl<_$_ChargePointLocation>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChargePointLocationToJson(
      this,
    );
  }
}

abstract class _ChargePointLocation implements ChargePointLocation {
  const factory _ChargePointLocation(
      {final int? status,
      final String? message,
      final Data? data,
      final ValidationError? validationError}) = _$_ChargePointLocation;

  factory _ChargePointLocation.fromJson(Map<String, dynamic> json) =
      _$_ChargePointLocation.fromJson;

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
  _$$_ChargePointLocationCopyWith<_$_ChargePointLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  ChargerLocation? get chargerLocation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call({ChargerLocation? chargerLocation});

  $ChargerLocationCopyWith<$Res>? get chargerLocation;
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
    Object? chargerLocation = freezed,
  }) {
    return _then(_value.copyWith(
      chargerLocation: freezed == chargerLocation
          ? _value.chargerLocation
          : chargerLocation // ignore: cast_nullable_to_non_nullable
              as ChargerLocation?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChargerLocationCopyWith<$Res>? get chargerLocation {
    if (_value.chargerLocation == null) {
      return null;
    }

    return $ChargerLocationCopyWith<$Res>(_value.chargerLocation!, (value) {
      return _then(_value.copyWith(chargerLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$_DataCopyWith(_$_Data value, $Res Function(_$_Data) then) =
      __$$_DataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ChargerLocation? chargerLocation});

  @override
  $ChargerLocationCopyWith<$Res>? get chargerLocation;
}

/// @nodoc
class __$$_DataCopyWithImpl<$Res> extends _$DataCopyWithImpl<$Res, _$_Data>
    implements _$$_DataCopyWith<$Res> {
  __$$_DataCopyWithImpl(_$_Data _value, $Res Function(_$_Data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chargerLocation = freezed,
  }) {
    return _then(_$_Data(
      chargerLocation: freezed == chargerLocation
          ? _value.chargerLocation
          : chargerLocation // ignore: cast_nullable_to_non_nullable
              as ChargerLocation?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Data implements _Data {
  const _$_Data({this.chargerLocation});

  factory _$_Data.fromJson(Map<String, dynamic> json) => _$$_DataFromJson(json);

  @override
  final ChargerLocation? chargerLocation;

  @override
  String toString() {
    return 'Data(chargerLocation: $chargerLocation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data &&
            (identical(other.chargerLocation, chargerLocation) ||
                other.chargerLocation == chargerLocation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, chargerLocation);

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
  const factory _Data({final ChargerLocation? chargerLocation}) = _$_Data;

  factory _Data.fromJson(Map<String, dynamic> json) = _$_Data.fromJson;

  @override
  ChargerLocation? get chargerLocation;
  @override
  @JsonKey(ignore: true)
  _$$_DataCopyWith<_$_Data> get copyWith => throw _privateConstructorUsedError;
}

ChargerLocation _$ChargerLocationFromJson(Map<String, dynamic> json) {
  return _ChargerLocation.fromJson(json);
}

/// @nodoc
mixin _$ChargerLocation {
  int? get currentPage => throw _privateConstructorUsedError;
  List<Datum>? get data => throw _privateConstructorUsedError;
  String? get firstPageUrl => throw _privateConstructorUsedError;
  int? get from => throw _privateConstructorUsedError;
  int? get lastPage => throw _privateConstructorUsedError;
  String? get lastPageUrl => throw _privateConstructorUsedError;
  List<Link>? get links => throw _privateConstructorUsedError;
  dynamic get nextPageUrl => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;
  int? get perPage => throw _privateConstructorUsedError;
  dynamic get prevPageUrl => throw _privateConstructorUsedError;
  int? get to => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChargerLocationCopyWith<ChargerLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChargerLocationCopyWith<$Res> {
  factory $ChargerLocationCopyWith(
          ChargerLocation value, $Res Function(ChargerLocation) then) =
      _$ChargerLocationCopyWithImpl<$Res, ChargerLocation>;
  @useResult
  $Res call(
      {int? currentPage,
      List<Datum>? data,
      String? firstPageUrl,
      int? from,
      int? lastPage,
      String? lastPageUrl,
      List<Link>? links,
      dynamic nextPageUrl,
      String? path,
      int? perPage,
      dynamic prevPageUrl,
      int? to,
      int? total});
}

/// @nodoc
class _$ChargerLocationCopyWithImpl<$Res, $Val extends ChargerLocation>
    implements $ChargerLocationCopyWith<$Res> {
  _$ChargerLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = freezed,
    Object? data = freezed,
    Object? firstPageUrl = freezed,
    Object? from = freezed,
    Object? lastPage = freezed,
    Object? lastPageUrl = freezed,
    Object? links = freezed,
    Object? nextPageUrl = freezed,
    Object? path = freezed,
    Object? perPage = freezed,
    Object? prevPageUrl = freezed,
    Object? to = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Datum>?,
      firstPageUrl: freezed == firstPageUrl
          ? _value.firstPageUrl
          : firstPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPageUrl: freezed == lastPageUrl
          ? _value.lastPageUrl
          : lastPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<Link>?,
      nextPageUrl: freezed == nextPageUrl
          ? _value.nextPageUrl
          : nextPageUrl // ignore: cast_nullable_to_non_nullable
              as dynamic,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      prevPageUrl: freezed == prevPageUrl
          ? _value.prevPageUrl
          : prevPageUrl // ignore: cast_nullable_to_non_nullable
              as dynamic,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChargerLocationCopyWith<$Res>
    implements $ChargerLocationCopyWith<$Res> {
  factory _$$_ChargerLocationCopyWith(
          _$_ChargerLocation value, $Res Function(_$_ChargerLocation) then) =
      __$$_ChargerLocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? currentPage,
      List<Datum>? data,
      String? firstPageUrl,
      int? from,
      int? lastPage,
      String? lastPageUrl,
      List<Link>? links,
      dynamic nextPageUrl,
      String? path,
      int? perPage,
      dynamic prevPageUrl,
      int? to,
      int? total});
}

/// @nodoc
class __$$_ChargerLocationCopyWithImpl<$Res>
    extends _$ChargerLocationCopyWithImpl<$Res, _$_ChargerLocation>
    implements _$$_ChargerLocationCopyWith<$Res> {
  __$$_ChargerLocationCopyWithImpl(
      _$_ChargerLocation _value, $Res Function(_$_ChargerLocation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = freezed,
    Object? data = freezed,
    Object? firstPageUrl = freezed,
    Object? from = freezed,
    Object? lastPage = freezed,
    Object? lastPageUrl = freezed,
    Object? links = freezed,
    Object? nextPageUrl = freezed,
    Object? path = freezed,
    Object? perPage = freezed,
    Object? prevPageUrl = freezed,
    Object? to = freezed,
    Object? total = freezed,
  }) {
    return _then(_$_ChargerLocation(
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Datum>?,
      firstPageUrl: freezed == firstPageUrl
          ? _value.firstPageUrl
          : firstPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPageUrl: freezed == lastPageUrl
          ? _value.lastPageUrl
          : lastPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      links: freezed == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<Link>?,
      nextPageUrl: freezed == nextPageUrl
          ? _value.nextPageUrl
          : nextPageUrl // ignore: cast_nullable_to_non_nullable
              as dynamic,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      prevPageUrl: freezed == prevPageUrl
          ? _value.prevPageUrl
          : prevPageUrl // ignore: cast_nullable_to_non_nullable
              as dynamic,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChargerLocation implements _ChargerLocation {
  const _$_ChargerLocation(
      {this.currentPage,
      final List<Datum>? data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      final List<Link>? links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total})
      : _data = data,
        _links = links;

  factory _$_ChargerLocation.fromJson(Map<String, dynamic> json) =>
      _$$_ChargerLocationFromJson(json);

  @override
  final int? currentPage;
  final List<Datum>? _data;
  @override
  List<Datum>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? firstPageUrl;
  @override
  final int? from;
  @override
  final int? lastPage;
  @override
  final String? lastPageUrl;
  final List<Link>? _links;
  @override
  List<Link>? get links {
    final value = _links;
    if (value == null) return null;
    if (_links is EqualUnmodifiableListView) return _links;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final dynamic nextPageUrl;
  @override
  final String? path;
  @override
  final int? perPage;
  @override
  final dynamic prevPageUrl;
  @override
  final int? to;
  @override
  final int? total;

  @override
  String toString() {
    return 'ChargerLocation(currentPage: $currentPage, data: $data, firstPageUrl: $firstPageUrl, from: $from, lastPage: $lastPage, lastPageUrl: $lastPageUrl, links: $links, nextPageUrl: $nextPageUrl, path: $path, perPage: $perPage, prevPageUrl: $prevPageUrl, to: $to, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChargerLocation &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.firstPageUrl, firstPageUrl) ||
                other.firstPageUrl == firstPageUrl) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.lastPageUrl, lastPageUrl) ||
                other.lastPageUrl == lastPageUrl) &&
            const DeepCollectionEquality().equals(other._links, _links) &&
            const DeepCollectionEquality()
                .equals(other.nextPageUrl, nextPageUrl) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            const DeepCollectionEquality()
                .equals(other.prevPageUrl, prevPageUrl) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentPage,
      const DeepCollectionEquality().hash(_data),
      firstPageUrl,
      from,
      lastPage,
      lastPageUrl,
      const DeepCollectionEquality().hash(_links),
      const DeepCollectionEquality().hash(nextPageUrl),
      path,
      perPage,
      const DeepCollectionEquality().hash(prevPageUrl),
      to,
      total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChargerLocationCopyWith<_$_ChargerLocation> get copyWith =>
      __$$_ChargerLocationCopyWithImpl<_$_ChargerLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChargerLocationToJson(
      this,
    );
  }
}

abstract class _ChargerLocation implements ChargerLocation {
  const factory _ChargerLocation(
      {final int? currentPage,
      final List<Datum>? data,
      final String? firstPageUrl,
      final int? from,
      final int? lastPage,
      final String? lastPageUrl,
      final List<Link>? links,
      final dynamic nextPageUrl,
      final String? path,
      final int? perPage,
      final dynamic prevPageUrl,
      final int? to,
      final int? total}) = _$_ChargerLocation;

  factory _ChargerLocation.fromJson(Map<String, dynamic> json) =
      _$_ChargerLocation.fromJson;

  @override
  int? get currentPage;
  @override
  List<Datum>? get data;
  @override
  String? get firstPageUrl;
  @override
  int? get from;
  @override
  int? get lastPage;
  @override
  String? get lastPageUrl;
  @override
  List<Link>? get links;
  @override
  dynamic get nextPageUrl;
  @override
  String? get path;
  @override
  int? get perPage;
  @override
  dynamic get prevPageUrl;
  @override
  int? get to;
  @override
  int? get total;
  @override
  @JsonKey(ignore: true)
  _$$_ChargerLocationCopyWith<_$_ChargerLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

Datum _$DatumFromJson(Map<String, dynamic> json) {
  return _Datum.fromJson(json);
}

/// @nodoc
mixin _$Datum {
  String? get companyName => throw _privateConstructorUsedError;
  String? get chargeBoxId => throw _privateConstructorUsedError;
  int? get chargeBoxPk => throw _privateConstructorUsedError;
  String? get chargeBoxType => throw _privateConstructorUsedError;
  String? get phaseType => throw _privateConstructorUsedError;
  String? get tariffPlan => throw _privateConstructorUsedError;
  String? get zoneName => throw _privateConstructorUsedError;
  String? get locationName => throw _privateConstructorUsedError;
  String? get locationAddress => throw _privateConstructorUsedError;
  String? get locationCity => throw _privateConstructorUsedError;
  String? get locationState => throw _privateConstructorUsedError;
  String? get locationCountry => throw _privateConstructorUsedError;
  String? get locationPincode => throw _privateConstructorUsedError;
  String? get locationLatitude => throw _privateConstructorUsedError;
  String? get locationLongitude => throw _privateConstructorUsedError;
  bool? get isChargingRunning => throw _privateConstructorUsedError;
  int? get transactionId => throw _privateConstructorUsedError;
  String? get tariffPlanCharge => throw _privateConstructorUsedError;
  List<ConnectorsByType>? get acConnectors =>
      throw _privateConstructorUsedError;
  List<ConnectorsByType>? get dcConnectors =>
      throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DatumCopyWith<Datum> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatumCopyWith<$Res> {
  factory $DatumCopyWith(Datum value, $Res Function(Datum) then) =
      _$DatumCopyWithImpl<$Res, Datum>;
  @useResult
  $Res call(
      {String? companyName,
      String? chargeBoxId,
      int? chargeBoxPk,
      String? chargeBoxType,
      String? phaseType,
      String? tariffPlan,
      String? zoneName,
      String? locationName,
      String? locationAddress,
      String? locationCity,
      String? locationState,
      String? locationCountry,
      String? locationPincode,
      String? locationLatitude,
      String? locationLongitude,
      bool? isChargingRunning,
      int? transactionId,
      String? tariffPlanCharge,
      List<ConnectorsByType>? acConnectors,
      List<ConnectorsByType>? dcConnectors,
      String? status});
}

/// @nodoc
class _$DatumCopyWithImpl<$Res, $Val extends Datum>
    implements $DatumCopyWith<$Res> {
  _$DatumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyName = freezed,
    Object? chargeBoxId = freezed,
    Object? chargeBoxPk = freezed,
    Object? chargeBoxType = freezed,
    Object? phaseType = freezed,
    Object? tariffPlan = freezed,
    Object? zoneName = freezed,
    Object? locationName = freezed,
    Object? locationAddress = freezed,
    Object? locationCity = freezed,
    Object? locationState = freezed,
    Object? locationCountry = freezed,
    Object? locationPincode = freezed,
    Object? locationLatitude = freezed,
    Object? locationLongitude = freezed,
    Object? isChargingRunning = freezed,
    Object? transactionId = freezed,
    Object? tariffPlanCharge = freezed,
    Object? acConnectors = freezed,
    Object? dcConnectors = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      chargeBoxId: freezed == chargeBoxId
          ? _value.chargeBoxId
          : chargeBoxId // ignore: cast_nullable_to_non_nullable
              as String?,
      chargeBoxPk: freezed == chargeBoxPk
          ? _value.chargeBoxPk
          : chargeBoxPk // ignore: cast_nullable_to_non_nullable
              as int?,
      chargeBoxType: freezed == chargeBoxType
          ? _value.chargeBoxType
          : chargeBoxType // ignore: cast_nullable_to_non_nullable
              as String?,
      phaseType: freezed == phaseType
          ? _value.phaseType
          : phaseType // ignore: cast_nullable_to_non_nullable
              as String?,
      tariffPlan: freezed == tariffPlan
          ? _value.tariffPlan
          : tariffPlan // ignore: cast_nullable_to_non_nullable
              as String?,
      zoneName: freezed == zoneName
          ? _value.zoneName
          : zoneName // ignore: cast_nullable_to_non_nullable
              as String?,
      locationName: freezed == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
      locationAddress: freezed == locationAddress
          ? _value.locationAddress
          : locationAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      locationCity: freezed == locationCity
          ? _value.locationCity
          : locationCity // ignore: cast_nullable_to_non_nullable
              as String?,
      locationState: freezed == locationState
          ? _value.locationState
          : locationState // ignore: cast_nullable_to_non_nullable
              as String?,
      locationCountry: freezed == locationCountry
          ? _value.locationCountry
          : locationCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      locationPincode: freezed == locationPincode
          ? _value.locationPincode
          : locationPincode // ignore: cast_nullable_to_non_nullable
              as String?,
      locationLatitude: freezed == locationLatitude
          ? _value.locationLatitude
          : locationLatitude // ignore: cast_nullable_to_non_nullable
              as String?,
      locationLongitude: freezed == locationLongitude
          ? _value.locationLongitude
          : locationLongitude // ignore: cast_nullable_to_non_nullable
              as String?,
      isChargingRunning: freezed == isChargingRunning
          ? _value.isChargingRunning
          : isChargingRunning // ignore: cast_nullable_to_non_nullable
              as bool?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int?,
      tariffPlanCharge: freezed == tariffPlanCharge
          ? _value.tariffPlanCharge
          : tariffPlanCharge // ignore: cast_nullable_to_non_nullable
              as String?,
      acConnectors: freezed == acConnectors
          ? _value.acConnectors
          : acConnectors // ignore: cast_nullable_to_non_nullable
              as List<ConnectorsByType>?,
      dcConnectors: freezed == dcConnectors
          ? _value.dcConnectors
          : dcConnectors // ignore: cast_nullable_to_non_nullable
              as List<ConnectorsByType>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DatumCopyWith<$Res> implements $DatumCopyWith<$Res> {
  factory _$$_DatumCopyWith(_$_Datum value, $Res Function(_$_Datum) then) =
      __$$_DatumCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? companyName,
      String? chargeBoxId,
      int? chargeBoxPk,
      String? chargeBoxType,
      String? phaseType,
      String? tariffPlan,
      String? zoneName,
      String? locationName,
      String? locationAddress,
      String? locationCity,
      String? locationState,
      String? locationCountry,
      String? locationPincode,
      String? locationLatitude,
      String? locationLongitude,
      bool? isChargingRunning,
      int? transactionId,
      String? tariffPlanCharge,
      List<ConnectorsByType>? acConnectors,
      List<ConnectorsByType>? dcConnectors,
      String? status});
}

/// @nodoc
class __$$_DatumCopyWithImpl<$Res> extends _$DatumCopyWithImpl<$Res, _$_Datum>
    implements _$$_DatumCopyWith<$Res> {
  __$$_DatumCopyWithImpl(_$_Datum _value, $Res Function(_$_Datum) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyName = freezed,
    Object? chargeBoxId = freezed,
    Object? chargeBoxPk = freezed,
    Object? chargeBoxType = freezed,
    Object? phaseType = freezed,
    Object? tariffPlan = freezed,
    Object? zoneName = freezed,
    Object? locationName = freezed,
    Object? locationAddress = freezed,
    Object? locationCity = freezed,
    Object? locationState = freezed,
    Object? locationCountry = freezed,
    Object? locationPincode = freezed,
    Object? locationLatitude = freezed,
    Object? locationLongitude = freezed,
    Object? isChargingRunning = freezed,
    Object? transactionId = freezed,
    Object? tariffPlanCharge = freezed,
    Object? acConnectors = freezed,
    Object? dcConnectors = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_Datum(
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      chargeBoxId: freezed == chargeBoxId
          ? _value.chargeBoxId
          : chargeBoxId // ignore: cast_nullable_to_non_nullable
              as String?,
      chargeBoxPk: freezed == chargeBoxPk
          ? _value.chargeBoxPk
          : chargeBoxPk // ignore: cast_nullable_to_non_nullable
              as int?,
      chargeBoxType: freezed == chargeBoxType
          ? _value.chargeBoxType
          : chargeBoxType // ignore: cast_nullable_to_non_nullable
              as String?,
      phaseType: freezed == phaseType
          ? _value.phaseType
          : phaseType // ignore: cast_nullable_to_non_nullable
              as String?,
      tariffPlan: freezed == tariffPlan
          ? _value.tariffPlan
          : tariffPlan // ignore: cast_nullable_to_non_nullable
              as String?,
      zoneName: freezed == zoneName
          ? _value.zoneName
          : zoneName // ignore: cast_nullable_to_non_nullable
              as String?,
      locationName: freezed == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
      locationAddress: freezed == locationAddress
          ? _value.locationAddress
          : locationAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      locationCity: freezed == locationCity
          ? _value.locationCity
          : locationCity // ignore: cast_nullable_to_non_nullable
              as String?,
      locationState: freezed == locationState
          ? _value.locationState
          : locationState // ignore: cast_nullable_to_non_nullable
              as String?,
      locationCountry: freezed == locationCountry
          ? _value.locationCountry
          : locationCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      locationPincode: freezed == locationPincode
          ? _value.locationPincode
          : locationPincode // ignore: cast_nullable_to_non_nullable
              as String?,
      locationLatitude: freezed == locationLatitude
          ? _value.locationLatitude
          : locationLatitude // ignore: cast_nullable_to_non_nullable
              as String?,
      locationLongitude: freezed == locationLongitude
          ? _value.locationLongitude
          : locationLongitude // ignore: cast_nullable_to_non_nullable
              as String?,
      isChargingRunning: freezed == isChargingRunning
          ? _value.isChargingRunning
          : isChargingRunning // ignore: cast_nullable_to_non_nullable
              as bool?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int?,
      tariffPlanCharge: freezed == tariffPlanCharge
          ? _value.tariffPlanCharge
          : tariffPlanCharge // ignore: cast_nullable_to_non_nullable
              as String?,
      acConnectors: freezed == acConnectors
          ? _value._acConnectors
          : acConnectors // ignore: cast_nullable_to_non_nullable
              as List<ConnectorsByType>?,
      dcConnectors: freezed == dcConnectors
          ? _value._dcConnectors
          : dcConnectors // ignore: cast_nullable_to_non_nullable
              as List<ConnectorsByType>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Datum implements _Datum {
  const _$_Datum(
      {this.companyName,
      this.chargeBoxId,
      this.chargeBoxPk,
      this.chargeBoxType,
      this.phaseType,
      this.tariffPlan,
      this.zoneName,
      this.locationName,
      this.locationAddress,
      this.locationCity,
      this.locationState,
      this.locationCountry,
      this.locationPincode,
      this.locationLatitude,
      this.locationLongitude,
      this.isChargingRunning,
      this.transactionId,
      this.tariffPlanCharge,
      final List<ConnectorsByType>? acConnectors,
      final List<ConnectorsByType>? dcConnectors,
      this.status})
      : _acConnectors = acConnectors,
        _dcConnectors = dcConnectors;

  factory _$_Datum.fromJson(Map<String, dynamic> json) =>
      _$$_DatumFromJson(json);

  @override
  final String? companyName;
  @override
  final String? chargeBoxId;
  @override
  final int? chargeBoxPk;
  @override
  final String? chargeBoxType;
  @override
  final String? phaseType;
  @override
  final String? tariffPlan;
  @override
  final String? zoneName;
  @override
  final String? locationName;
  @override
  final String? locationAddress;
  @override
  final String? locationCity;
  @override
  final String? locationState;
  @override
  final String? locationCountry;
  @override
  final String? locationPincode;
  @override
  final String? locationLatitude;
  @override
  final String? locationLongitude;
  @override
  final bool? isChargingRunning;
  @override
  final int? transactionId;
  @override
  final String? tariffPlanCharge;
  final List<ConnectorsByType>? _acConnectors;
  @override
  List<ConnectorsByType>? get acConnectors {
    final value = _acConnectors;
    if (value == null) return null;
    if (_acConnectors is EqualUnmodifiableListView) return _acConnectors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ConnectorsByType>? _dcConnectors;
  @override
  List<ConnectorsByType>? get dcConnectors {
    final value = _dcConnectors;
    if (value == null) return null;
    if (_dcConnectors is EqualUnmodifiableListView) return _dcConnectors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? status;

  @override
  String toString() {
    return 'Datum(companyName: $companyName, chargeBoxId: $chargeBoxId, chargeBoxPk: $chargeBoxPk, chargeBoxType: $chargeBoxType, phaseType: $phaseType, tariffPlan: $tariffPlan, zoneName: $zoneName, locationName: $locationName, locationAddress: $locationAddress, locationCity: $locationCity, locationState: $locationState, locationCountry: $locationCountry, locationPincode: $locationPincode, locationLatitude: $locationLatitude, locationLongitude: $locationLongitude, isChargingRunning: $isChargingRunning, transactionId: $transactionId, tariffPlanCharge: $tariffPlanCharge, acConnectors: $acConnectors, dcConnectors: $dcConnectors, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Datum &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.chargeBoxId, chargeBoxId) ||
                other.chargeBoxId == chargeBoxId) &&
            (identical(other.chargeBoxPk, chargeBoxPk) ||
                other.chargeBoxPk == chargeBoxPk) &&
            (identical(other.chargeBoxType, chargeBoxType) ||
                other.chargeBoxType == chargeBoxType) &&
            (identical(other.phaseType, phaseType) ||
                other.phaseType == phaseType) &&
            (identical(other.tariffPlan, tariffPlan) ||
                other.tariffPlan == tariffPlan) &&
            (identical(other.zoneName, zoneName) ||
                other.zoneName == zoneName) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.locationAddress, locationAddress) ||
                other.locationAddress == locationAddress) &&
            (identical(other.locationCity, locationCity) ||
                other.locationCity == locationCity) &&
            (identical(other.locationState, locationState) ||
                other.locationState == locationState) &&
            (identical(other.locationCountry, locationCountry) ||
                other.locationCountry == locationCountry) &&
            (identical(other.locationPincode, locationPincode) ||
                other.locationPincode == locationPincode) &&
            (identical(other.locationLatitude, locationLatitude) ||
                other.locationLatitude == locationLatitude) &&
            (identical(other.locationLongitude, locationLongitude) ||
                other.locationLongitude == locationLongitude) &&
            (identical(other.isChargingRunning, isChargingRunning) ||
                other.isChargingRunning == isChargingRunning) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.tariffPlanCharge, tariffPlanCharge) ||
                other.tariffPlanCharge == tariffPlanCharge) &&
            const DeepCollectionEquality()
                .equals(other._acConnectors, _acConnectors) &&
            const DeepCollectionEquality()
                .equals(other._dcConnectors, _dcConnectors) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        companyName,
        chargeBoxId,
        chargeBoxPk,
        chargeBoxType,
        phaseType,
        tariffPlan,
        zoneName,
        locationName,
        locationAddress,
        locationCity,
        locationState,
        locationCountry,
        locationPincode,
        locationLatitude,
        locationLongitude,
        isChargingRunning,
        transactionId,
        tariffPlanCharge,
        const DeepCollectionEquality().hash(_acConnectors),
        const DeepCollectionEquality().hash(_dcConnectors),
        status
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DatumCopyWith<_$_Datum> get copyWith =>
      __$$_DatumCopyWithImpl<_$_Datum>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DatumToJson(
      this,
    );
  }
}

abstract class _Datum implements Datum {
  const factory _Datum(
      {final String? companyName,
      final String? chargeBoxId,
      final int? chargeBoxPk,
      final String? chargeBoxType,
      final String? phaseType,
      final String? tariffPlan,
      final String? zoneName,
      final String? locationName,
      final String? locationAddress,
      final String? locationCity,
      final String? locationState,
      final String? locationCountry,
      final String? locationPincode,
      final String? locationLatitude,
      final String? locationLongitude,
      final bool? isChargingRunning,
      final int? transactionId,
      final String? tariffPlanCharge,
      final List<ConnectorsByType>? acConnectors,
      final List<ConnectorsByType>? dcConnectors,
      final String? status}) = _$_Datum;

  factory _Datum.fromJson(Map<String, dynamic> json) = _$_Datum.fromJson;

  @override
  String? get companyName;
  @override
  String? get chargeBoxId;
  @override
  int? get chargeBoxPk;
  @override
  String? get chargeBoxType;
  @override
  String? get phaseType;
  @override
  String? get tariffPlan;
  @override
  String? get zoneName;
  @override
  String? get locationName;
  @override
  String? get locationAddress;
  @override
  String? get locationCity;
  @override
  String? get locationState;
  @override
  String? get locationCountry;
  @override
  String? get locationPincode;
  @override
  String? get locationLatitude;
  @override
  String? get locationLongitude;
  @override
  bool? get isChargingRunning;
  @override
  int? get transactionId;
  @override
  String? get tariffPlanCharge;
  @override
  List<ConnectorsByType>? get acConnectors;
  @override
  List<ConnectorsByType>? get dcConnectors;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$_DatumCopyWith<_$_Datum> get copyWith =>
      throw _privateConstructorUsedError;
}

ConnectorsByType _$ConnectorsByTypeFromJson(Map<String, dynamic> json) {
  return _ConnectorsByType.fromJson(json);
}

/// @nodoc
mixin _$ConnectorsByType {
  int? get connectorPk => throw _privateConstructorUsedError;
  String? get chargeBoxId => throw _privateConstructorUsedError;
  int? get connectorId => throw _privateConstructorUsedError;
  int? get connectorTypePk => throw _privateConstructorUsedError;
  String? get currentType => throw _privateConstructorUsedError;
  String? get connectorType => throw _privateConstructorUsedError;
  String? get connectorImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConnectorsByTypeCopyWith<ConnectorsByType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectorsByTypeCopyWith<$Res> {
  factory $ConnectorsByTypeCopyWith(
          ConnectorsByType value, $Res Function(ConnectorsByType) then) =
      _$ConnectorsByTypeCopyWithImpl<$Res, ConnectorsByType>;
  @useResult
  $Res call(
      {int? connectorPk,
      String? chargeBoxId,
      int? connectorId,
      int? connectorTypePk,
      String? currentType,
      String? connectorType,
      String? connectorImage});
}

/// @nodoc
class _$ConnectorsByTypeCopyWithImpl<$Res, $Val extends ConnectorsByType>
    implements $ConnectorsByTypeCopyWith<$Res> {
  _$ConnectorsByTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connectorPk = freezed,
    Object? chargeBoxId = freezed,
    Object? connectorId = freezed,
    Object? connectorTypePk = freezed,
    Object? currentType = freezed,
    Object? connectorType = freezed,
    Object? connectorImage = freezed,
  }) {
    return _then(_value.copyWith(
      connectorPk: freezed == connectorPk
          ? _value.connectorPk
          : connectorPk // ignore: cast_nullable_to_non_nullable
              as int?,
      chargeBoxId: freezed == chargeBoxId
          ? _value.chargeBoxId
          : chargeBoxId // ignore: cast_nullable_to_non_nullable
              as String?,
      connectorId: freezed == connectorId
          ? _value.connectorId
          : connectorId // ignore: cast_nullable_to_non_nullable
              as int?,
      connectorTypePk: freezed == connectorTypePk
          ? _value.connectorTypePk
          : connectorTypePk // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$_ConnectorsByTypeCopyWith<$Res>
    implements $ConnectorsByTypeCopyWith<$Res> {
  factory _$$_ConnectorsByTypeCopyWith(
          _$_ConnectorsByType value, $Res Function(_$_ConnectorsByType) then) =
      __$$_ConnectorsByTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? connectorPk,
      String? chargeBoxId,
      int? connectorId,
      int? connectorTypePk,
      String? currentType,
      String? connectorType,
      String? connectorImage});
}

/// @nodoc
class __$$_ConnectorsByTypeCopyWithImpl<$Res>
    extends _$ConnectorsByTypeCopyWithImpl<$Res, _$_ConnectorsByType>
    implements _$$_ConnectorsByTypeCopyWith<$Res> {
  __$$_ConnectorsByTypeCopyWithImpl(
      _$_ConnectorsByType _value, $Res Function(_$_ConnectorsByType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connectorPk = freezed,
    Object? chargeBoxId = freezed,
    Object? connectorId = freezed,
    Object? connectorTypePk = freezed,
    Object? currentType = freezed,
    Object? connectorType = freezed,
    Object? connectorImage = freezed,
  }) {
    return _then(_$_ConnectorsByType(
      connectorPk: freezed == connectorPk
          ? _value.connectorPk
          : connectorPk // ignore: cast_nullable_to_non_nullable
              as int?,
      chargeBoxId: freezed == chargeBoxId
          ? _value.chargeBoxId
          : chargeBoxId // ignore: cast_nullable_to_non_nullable
              as String?,
      connectorId: freezed == connectorId
          ? _value.connectorId
          : connectorId // ignore: cast_nullable_to_non_nullable
              as int?,
      connectorTypePk: freezed == connectorTypePk
          ? _value.connectorTypePk
          : connectorTypePk // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$_ConnectorsByType implements _ConnectorsByType {
  const _$_ConnectorsByType(
      {this.connectorPk,
      this.chargeBoxId,
      this.connectorId,
      this.connectorTypePk,
      this.currentType,
      this.connectorType,
      this.connectorImage});

  factory _$_ConnectorsByType.fromJson(Map<String, dynamic> json) =>
      _$$_ConnectorsByTypeFromJson(json);

  @override
  final int? connectorPk;
  @override
  final String? chargeBoxId;
  @override
  final int? connectorId;
  @override
  final int? connectorTypePk;
  @override
  final String? currentType;
  @override
  final String? connectorType;
  @override
  final String? connectorImage;

  @override
  String toString() {
    return 'ConnectorsByType(connectorPk: $connectorPk, chargeBoxId: $chargeBoxId, connectorId: $connectorId, connectorTypePk: $connectorTypePk, currentType: $currentType, connectorType: $connectorType, connectorImage: $connectorImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConnectorsByType &&
            (identical(other.connectorPk, connectorPk) ||
                other.connectorPk == connectorPk) &&
            (identical(other.chargeBoxId, chargeBoxId) ||
                other.chargeBoxId == chargeBoxId) &&
            (identical(other.connectorId, connectorId) ||
                other.connectorId == connectorId) &&
            (identical(other.connectorTypePk, connectorTypePk) ||
                other.connectorTypePk == connectorTypePk) &&
            (identical(other.currentType, currentType) ||
                other.currentType == currentType) &&
            (identical(other.connectorType, connectorType) ||
                other.connectorType == connectorType) &&
            (identical(other.connectorImage, connectorImage) ||
                other.connectorImage == connectorImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, connectorPk, chargeBoxId,
      connectorId, connectorTypePk, currentType, connectorType, connectorImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConnectorsByTypeCopyWith<_$_ConnectorsByType> get copyWith =>
      __$$_ConnectorsByTypeCopyWithImpl<_$_ConnectorsByType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConnectorsByTypeToJson(
      this,
    );
  }
}

abstract class _ConnectorsByType implements ConnectorsByType {
  const factory _ConnectorsByType(
      {final int? connectorPk,
      final String? chargeBoxId,
      final int? connectorId,
      final int? connectorTypePk,
      final String? currentType,
      final String? connectorType,
      final String? connectorImage}) = _$_ConnectorsByType;

  factory _ConnectorsByType.fromJson(Map<String, dynamic> json) =
      _$_ConnectorsByType.fromJson;

  @override
  int? get connectorPk;
  @override
  String? get chargeBoxId;
  @override
  int? get connectorId;
  @override
  int? get connectorTypePk;
  @override
  String? get currentType;
  @override
  String? get connectorType;
  @override
  String? get connectorImage;
  @override
  @JsonKey(ignore: true)
  _$$_ConnectorsByTypeCopyWith<_$_ConnectorsByType> get copyWith =>
      throw _privateConstructorUsedError;
}

Link _$LinkFromJson(Map<String, dynamic> json) {
  return _Link.fromJson(json);
}

/// @nodoc
mixin _$Link {
  String? get url => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LinkCopyWith<Link> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinkCopyWith<$Res> {
  factory $LinkCopyWith(Link value, $Res Function(Link) then) =
      _$LinkCopyWithImpl<$Res, Link>;
  @useResult
  $Res call({String? url, String? label, bool? active});
}

/// @nodoc
class _$LinkCopyWithImpl<$Res, $Val extends Link>
    implements $LinkCopyWith<$Res> {
  _$LinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? label = freezed,
    Object? active = freezed,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LinkCopyWith<$Res> implements $LinkCopyWith<$Res> {
  factory _$$_LinkCopyWith(_$_Link value, $Res Function(_$_Link) then) =
      __$$_LinkCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? url, String? label, bool? active});
}

/// @nodoc
class __$$_LinkCopyWithImpl<$Res> extends _$LinkCopyWithImpl<$Res, _$_Link>
    implements _$$_LinkCopyWith<$Res> {
  __$$_LinkCopyWithImpl(_$_Link _value, $Res Function(_$_Link) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? label = freezed,
    Object? active = freezed,
  }) {
    return _then(_$_Link(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Link implements _Link {
  const _$_Link({this.url, this.label, this.active});

  factory _$_Link.fromJson(Map<String, dynamic> json) => _$$_LinkFromJson(json);

  @override
  final String? url;
  @override
  final String? label;
  @override
  final bool? active;

  @override
  String toString() {
    return 'Link(url: $url, label: $label, active: $active)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Link &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url, label, active);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LinkCopyWith<_$_Link> get copyWith =>
      __$$_LinkCopyWithImpl<_$_Link>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LinkToJson(
      this,
    );
  }
}

abstract class _Link implements Link {
  const factory _Link(
      {final String? url, final String? label, final bool? active}) = _$_Link;

  factory _Link.fromJson(Map<String, dynamic> json) = _$_Link.fromJson;

  @override
  String? get url;
  @override
  String? get label;
  @override
  bool? get active;
  @override
  @JsonKey(ignore: true)
  _$$_LinkCopyWith<_$_Link> get copyWith => throw _privateConstructorUsedError;
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
