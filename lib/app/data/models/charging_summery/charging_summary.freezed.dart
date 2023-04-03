// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'charging_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChargingSummary _$ChargingSummaryFromJson(Map<String, dynamic> json) {
  return _ChargingSummary.fromJson(json);
}

/// @nodoc
mixin _$ChargingSummary {
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  Data? get data => throw _privateConstructorUsedError;
  ValidationError? get validationError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChargingSummaryCopyWith<ChargingSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChargingSummaryCopyWith<$Res> {
  factory $ChargingSummaryCopyWith(
          ChargingSummary value, $Res Function(ChargingSummary) then) =
      _$ChargingSummaryCopyWithImpl<$Res, ChargingSummary>;
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
class _$ChargingSummaryCopyWithImpl<$Res, $Val extends ChargingSummary>
    implements $ChargingSummaryCopyWith<$Res> {
  _$ChargingSummaryCopyWithImpl(this._value, this._then);

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
abstract class _$$_ChargingSummaryCopyWith<$Res>
    implements $ChargingSummaryCopyWith<$Res> {
  factory _$$_ChargingSummaryCopyWith(
          _$_ChargingSummary value, $Res Function(_$_ChargingSummary) then) =
      __$$_ChargingSummaryCopyWithImpl<$Res>;
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
class __$$_ChargingSummaryCopyWithImpl<$Res>
    extends _$ChargingSummaryCopyWithImpl<$Res, _$_ChargingSummary>
    implements _$$_ChargingSummaryCopyWith<$Res> {
  __$$_ChargingSummaryCopyWithImpl(
      _$_ChargingSummary _value, $Res Function(_$_ChargingSummary) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
    Object? validationError = freezed,
  }) {
    return _then(_$_ChargingSummary(
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
class _$_ChargingSummary implements _ChargingSummary {
  const _$_ChargingSummary(
      {this.status, this.message, this.data, this.validationError});

  factory _$_ChargingSummary.fromJson(Map<String, dynamic> json) =>
      _$$_ChargingSummaryFromJson(json);

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
    return 'ChargingSummary(status: $status, message: $message, data: $data, validationError: $validationError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChargingSummary &&
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
  _$$_ChargingSummaryCopyWith<_$_ChargingSummary> get copyWith =>
      __$$_ChargingSummaryCopyWithImpl<_$_ChargingSummary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChargingSummaryToJson(
      this,
    );
  }
}

abstract class _ChargingSummary implements ChargingSummary {
  const factory _ChargingSummary(
      {final int? status,
      final String? message,
      final Data? data,
      final ValidationError? validationError}) = _$_ChargingSummary;

  factory _ChargingSummary.fromJson(Map<String, dynamic> json) =
      _$_ChargingSummary.fromJson;

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
  _$$_ChargingSummaryCopyWith<_$_ChargingSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  TransactionData? get transactionData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call({TransactionData? transactionData});

  $TransactionDataCopyWith<$Res>? get transactionData;
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
    Object? transactionData = freezed,
  }) {
    return _then(_value.copyWith(
      transactionData: freezed == transactionData
          ? _value.transactionData
          : transactionData // ignore: cast_nullable_to_non_nullable
              as TransactionData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionDataCopyWith<$Res>? get transactionData {
    if (_value.transactionData == null) {
      return null;
    }

    return $TransactionDataCopyWith<$Res>(_value.transactionData!, (value) {
      return _then(_value.copyWith(transactionData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$_DataCopyWith(_$_Data value, $Res Function(_$_Data) then) =
      __$$_DataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TransactionData? transactionData});

  @override
  $TransactionDataCopyWith<$Res>? get transactionData;
}

/// @nodoc
class __$$_DataCopyWithImpl<$Res> extends _$DataCopyWithImpl<$Res, _$_Data>
    implements _$$_DataCopyWith<$Res> {
  __$$_DataCopyWithImpl(_$_Data _value, $Res Function(_$_Data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionData = freezed,
  }) {
    return _then(_$_Data(
      transactionData: freezed == transactionData
          ? _value.transactionData
          : transactionData // ignore: cast_nullable_to_non_nullable
              as TransactionData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Data implements _Data {
  const _$_Data({this.transactionData});

  factory _$_Data.fromJson(Map<String, dynamic> json) => _$$_DataFromJson(json);

  @override
  final TransactionData? transactionData;

  @override
  String toString() {
    return 'Data(transactionData: $transactionData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data &&
            (identical(other.transactionData, transactionData) ||
                other.transactionData == transactionData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, transactionData);

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
  const factory _Data({final TransactionData? transactionData}) = _$_Data;

  factory _Data.fromJson(Map<String, dynamic> json) = _$_Data.fromJson;

  @override
  TransactionData? get transactionData;
  @override
  @JsonKey(ignore: true)
  _$$_DataCopyWith<_$_Data> get copyWith => throw _privateConstructorUsedError;
}

TransactionData _$TransactionDataFromJson(Map<String, dynamic> json) {
  return _TransactionData.fromJson(json);
}

/// @nodoc
mixin _$TransactionData {
  DateTime? get startTime => throw _privateConstructorUsedError;
  String? get startVal => throw _privateConstructorUsedError;
  String? get endVal => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  String? get stopReason => throw _privateConstructorUsedError;
  double? get energyConsume => throw _privateConstructorUsedError;
  double? get energyCharge => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionDataCopyWith<TransactionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionDataCopyWith<$Res> {
  factory $TransactionDataCopyWith(
          TransactionData value, $Res Function(TransactionData) then) =
      _$TransactionDataCopyWithImpl<$Res, TransactionData>;
  @useResult
  $Res call(
      {DateTime? startTime,
      String? startVal,
      String? endVal,
      DateTime? endTime,
      String? stopReason,
      double? energyConsume,
      double? energyCharge,
      String? duration});
}

/// @nodoc
class _$TransactionDataCopyWithImpl<$Res, $Val extends TransactionData>
    implements $TransactionDataCopyWith<$Res> {
  _$TransactionDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = freezed,
    Object? startVal = freezed,
    Object? endVal = freezed,
    Object? endTime = freezed,
    Object? stopReason = freezed,
    Object? energyConsume = freezed,
    Object? energyCharge = freezed,
    Object? duration = freezed,
  }) {
    return _then(_value.copyWith(
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startVal: freezed == startVal
          ? _value.startVal
          : startVal // ignore: cast_nullable_to_non_nullable
              as String?,
      endVal: freezed == endVal
          ? _value.endVal
          : endVal // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      stopReason: freezed == stopReason
          ? _value.stopReason
          : stopReason // ignore: cast_nullable_to_non_nullable
              as String?,
      energyConsume: freezed == energyConsume
          ? _value.energyConsume
          : energyConsume // ignore: cast_nullable_to_non_nullable
              as double?,
      energyCharge: freezed == energyCharge
          ? _value.energyCharge
          : energyCharge // ignore: cast_nullable_to_non_nullable
              as double?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionDataCopyWith<$Res>
    implements $TransactionDataCopyWith<$Res> {
  factory _$$_TransactionDataCopyWith(
          _$_TransactionData value, $Res Function(_$_TransactionData) then) =
      __$$_TransactionDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? startTime,
      String? startVal,
      String? endVal,
      DateTime? endTime,
      String? stopReason,
      double? energyConsume,
      double? energyCharge,
      String? duration});
}

/// @nodoc
class __$$_TransactionDataCopyWithImpl<$Res>
    extends _$TransactionDataCopyWithImpl<$Res, _$_TransactionData>
    implements _$$_TransactionDataCopyWith<$Res> {
  __$$_TransactionDataCopyWithImpl(
      _$_TransactionData _value, $Res Function(_$_TransactionData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = freezed,
    Object? startVal = freezed,
    Object? endVal = freezed,
    Object? endTime = freezed,
    Object? stopReason = freezed,
    Object? energyConsume = freezed,
    Object? energyCharge = freezed,
    Object? duration = freezed,
  }) {
    return _then(_$_TransactionData(
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startVal: freezed == startVal
          ? _value.startVal
          : startVal // ignore: cast_nullable_to_non_nullable
              as String?,
      endVal: freezed == endVal
          ? _value.endVal
          : endVal // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      stopReason: freezed == stopReason
          ? _value.stopReason
          : stopReason // ignore: cast_nullable_to_non_nullable
              as String?,
      energyConsume: freezed == energyConsume
          ? _value.energyConsume
          : energyConsume // ignore: cast_nullable_to_non_nullable
              as double?,
      energyCharge: freezed == energyCharge
          ? _value.energyCharge
          : energyCharge // ignore: cast_nullable_to_non_nullable
              as double?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionData implements _TransactionData {
  const _$_TransactionData(
      {this.startTime,
      this.startVal,
      this.endVal,
      this.endTime,
      this.stopReason,
      this.energyConsume,
      this.energyCharge,
      this.duration});

  factory _$_TransactionData.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionDataFromJson(json);

  @override
  final DateTime? startTime;
  @override
  final String? startVal;
  @override
  final String? endVal;
  @override
  final DateTime? endTime;
  @override
  final String? stopReason;
  @override
  final double? energyConsume;
  @override
  final double? energyCharge;
  @override
  final String? duration;

  @override
  String toString() {
    return 'TransactionData(startTime: $startTime, startVal: $startVal, endVal: $endVal, endTime: $endTime, stopReason: $stopReason, energyConsume: $energyConsume, energyCharge: $energyCharge, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionData &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.startVal, startVal) ||
                other.startVal == startVal) &&
            (identical(other.endVal, endVal) || other.endVal == endVal) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.stopReason, stopReason) ||
                other.stopReason == stopReason) &&
            (identical(other.energyConsume, energyConsume) ||
                other.energyConsume == energyConsume) &&
            (identical(other.energyCharge, energyCharge) ||
                other.energyCharge == energyCharge) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, startTime, startVal, endVal,
      endTime, stopReason, energyConsume, energyCharge, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionDataCopyWith<_$_TransactionData> get copyWith =>
      __$$_TransactionDataCopyWithImpl<_$_TransactionData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionDataToJson(
      this,
    );
  }
}

abstract class _TransactionData implements TransactionData {
  const factory _TransactionData(
      {final DateTime? startTime,
      final String? startVal,
      final String? endVal,
      final DateTime? endTime,
      final String? stopReason,
      final double? energyConsume,
      final double? energyCharge,
      final String? duration}) = _$_TransactionData;

  factory _TransactionData.fromJson(Map<String, dynamic> json) =
      _$_TransactionData.fromJson;

  @override
  DateTime? get startTime;
  @override
  String? get startVal;
  @override
  String? get endVal;
  @override
  DateTime? get endTime;
  @override
  String? get stopReason;
  @override
  double? get energyConsume;
  @override
  double? get energyCharge;
  @override
  String? get duration;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionDataCopyWith<_$_TransactionData> get copyWith =>
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
