// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_meter_value_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionMeterValueModel _$TransactionMeterValueModelFromJson(
    Map<String, dynamic> json) {
  return _TransactionMeterValueModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionMeterValueModel {
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  Data? get data => throw _privateConstructorUsedError;
  ValidationError? get validationError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionMeterValueModelCopyWith<TransactionMeterValueModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionMeterValueModelCopyWith<$Res> {
  factory $TransactionMeterValueModelCopyWith(TransactionMeterValueModel value,
          $Res Function(TransactionMeterValueModel) then) =
      _$TransactionMeterValueModelCopyWithImpl<$Res,
          TransactionMeterValueModel>;
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
class _$TransactionMeterValueModelCopyWithImpl<$Res,
        $Val extends TransactionMeterValueModel>
    implements $TransactionMeterValueModelCopyWith<$Res> {
  _$TransactionMeterValueModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_TransactionMeterValueModelCopyWith<$Res>
    implements $TransactionMeterValueModelCopyWith<$Res> {
  factory _$$_TransactionMeterValueModelCopyWith(
          _$_TransactionMeterValueModel value,
          $Res Function(_$_TransactionMeterValueModel) then) =
      __$$_TransactionMeterValueModelCopyWithImpl<$Res>;
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
class __$$_TransactionMeterValueModelCopyWithImpl<$Res>
    extends _$TransactionMeterValueModelCopyWithImpl<$Res,
        _$_TransactionMeterValueModel>
    implements _$$_TransactionMeterValueModelCopyWith<$Res> {
  __$$_TransactionMeterValueModelCopyWithImpl(
      _$_TransactionMeterValueModel _value,
      $Res Function(_$_TransactionMeterValueModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
    Object? validationError = freezed,
  }) {
    return _then(_$_TransactionMeterValueModel(
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
class _$_TransactionMeterValueModel implements _TransactionMeterValueModel {
  const _$_TransactionMeterValueModel(
      {this.status, this.message, this.data, this.validationError});

  factory _$_TransactionMeterValueModel.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionMeterValueModelFromJson(json);

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
    return 'TransactionMeterValueModel(status: $status, message: $message, data: $data, validationError: $validationError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionMeterValueModel &&
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
  _$$_TransactionMeterValueModelCopyWith<_$_TransactionMeterValueModel>
      get copyWith => __$$_TransactionMeterValueModelCopyWithImpl<
          _$_TransactionMeterValueModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionMeterValueModelToJson(
      this,
    );
  }
}

abstract class _TransactionMeterValueModel
    implements TransactionMeterValueModel {
  const factory _TransactionMeterValueModel(
      {final int? status,
      final String? message,
      final Data? data,
      final ValidationError? validationError}) = _$_TransactionMeterValueModel;

  factory _TransactionMeterValueModel.fromJson(Map<String, dynamic> json) =
      _$_TransactionMeterValueModel.fromJson;

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
  _$$_TransactionMeterValueModelCopyWith<_$_TransactionMeterValueModel>
      get copyWith => throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  double? get energyUsed => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;
  bool? get isChargingStop => throw _privateConstructorUsedError;
  String? get remainingTime => throw _privateConstructorUsedError;
  int? get remainingTimeInSeconds => throw _privateConstructorUsedError;
  int? get selectedOperationType => throw _privateConstructorUsedError;
  double? get selectedEnergy => throw _privateConstructorUsedError;
  String? get totalTime => throw _privateConstructorUsedError;
  int? get totalTimeSeconds => throw _privateConstructorUsedError;
  double? get energyUsageCharge => throw _privateConstructorUsedError;
  double? get totalAmountForCharge => throw _privateConstructorUsedError;
  double? get remainAmountForCharge => throw _privateConstructorUsedError;

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
      {double? energyUsed,
      String? unit,
      bool? isChargingStop,
      String? remainingTime,
      int? remainingTimeInSeconds,
      int? selectedOperationType,
      double? selectedEnergy,
      String? totalTime,
      int? totalTimeSeconds,
      double? energyUsageCharge,
      double? totalAmountForCharge,
      double? remainAmountForCharge});
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
    Object? energyUsed = freezed,
    Object? unit = freezed,
    Object? isChargingStop = freezed,
    Object? remainingTime = freezed,
    Object? remainingTimeInSeconds = freezed,
    Object? selectedOperationType = freezed,
    Object? selectedEnergy = freezed,
    Object? totalTime = freezed,
    Object? totalTimeSeconds = freezed,
    Object? energyUsageCharge = freezed,
    Object? totalAmountForCharge = freezed,
    Object? remainAmountForCharge = freezed,
  }) {
    return _then(_value.copyWith(
      energyUsed: freezed == energyUsed
          ? _value.energyUsed
          : energyUsed // ignore: cast_nullable_to_non_nullable
              as double?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      isChargingStop: freezed == isChargingStop
          ? _value.isChargingStop
          : isChargingStop // ignore: cast_nullable_to_non_nullable
              as bool?,
      remainingTime: freezed == remainingTime
          ? _value.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as String?,
      remainingTimeInSeconds: freezed == remainingTimeInSeconds
          ? _value.remainingTimeInSeconds
          : remainingTimeInSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      selectedOperationType: freezed == selectedOperationType
          ? _value.selectedOperationType
          : selectedOperationType // ignore: cast_nullable_to_non_nullable
              as int?,
      selectedEnergy: freezed == selectedEnergy
          ? _value.selectedEnergy
          : selectedEnergy // ignore: cast_nullable_to_non_nullable
              as double?,
      totalTime: freezed == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as String?,
      totalTimeSeconds: freezed == totalTimeSeconds
          ? _value.totalTimeSeconds
          : totalTimeSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      energyUsageCharge: freezed == energyUsageCharge
          ? _value.energyUsageCharge
          : energyUsageCharge // ignore: cast_nullable_to_non_nullable
              as double?,
      totalAmountForCharge: freezed == totalAmountForCharge
          ? _value.totalAmountForCharge
          : totalAmountForCharge // ignore: cast_nullable_to_non_nullable
              as double?,
      remainAmountForCharge: freezed == remainAmountForCharge
          ? _value.remainAmountForCharge
          : remainAmountForCharge // ignore: cast_nullable_to_non_nullable
              as double?,
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
      {double? energyUsed,
      String? unit,
      bool? isChargingStop,
      String? remainingTime,
      int? remainingTimeInSeconds,
      int? selectedOperationType,
      double? selectedEnergy,
      String? totalTime,
      int? totalTimeSeconds,
      double? energyUsageCharge,
      double? totalAmountForCharge,
      double? remainAmountForCharge});
}

/// @nodoc
class __$$_DataCopyWithImpl<$Res> extends _$DataCopyWithImpl<$Res, _$_Data>
    implements _$$_DataCopyWith<$Res> {
  __$$_DataCopyWithImpl(_$_Data _value, $Res Function(_$_Data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? energyUsed = freezed,
    Object? unit = freezed,
    Object? isChargingStop = freezed,
    Object? remainingTime = freezed,
    Object? remainingTimeInSeconds = freezed,
    Object? selectedOperationType = freezed,
    Object? selectedEnergy = freezed,
    Object? totalTime = freezed,
    Object? totalTimeSeconds = freezed,
    Object? energyUsageCharge = freezed,
    Object? totalAmountForCharge = freezed,
    Object? remainAmountForCharge = freezed,
  }) {
    return _then(_$_Data(
      energyUsed: freezed == energyUsed
          ? _value.energyUsed
          : energyUsed // ignore: cast_nullable_to_non_nullable
              as double?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      isChargingStop: freezed == isChargingStop
          ? _value.isChargingStop
          : isChargingStop // ignore: cast_nullable_to_non_nullable
              as bool?,
      remainingTime: freezed == remainingTime
          ? _value.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as String?,
      remainingTimeInSeconds: freezed == remainingTimeInSeconds
          ? _value.remainingTimeInSeconds
          : remainingTimeInSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      selectedOperationType: freezed == selectedOperationType
          ? _value.selectedOperationType
          : selectedOperationType // ignore: cast_nullable_to_non_nullable
              as int?,
      selectedEnergy: freezed == selectedEnergy
          ? _value.selectedEnergy
          : selectedEnergy // ignore: cast_nullable_to_non_nullable
              as double?,
      totalTime: freezed == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as String?,
      totalTimeSeconds: freezed == totalTimeSeconds
          ? _value.totalTimeSeconds
          : totalTimeSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      energyUsageCharge: freezed == energyUsageCharge
          ? _value.energyUsageCharge
          : energyUsageCharge // ignore: cast_nullable_to_non_nullable
              as double?,
      totalAmountForCharge: freezed == totalAmountForCharge
          ? _value.totalAmountForCharge
          : totalAmountForCharge // ignore: cast_nullable_to_non_nullable
              as double?,
      remainAmountForCharge: freezed == remainAmountForCharge
          ? _value.remainAmountForCharge
          : remainAmountForCharge // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Data implements _Data {
  const _$_Data(
      {this.energyUsed,
      this.unit,
      this.isChargingStop,
      this.remainingTime,
      this.remainingTimeInSeconds,
      this.selectedOperationType,
      this.selectedEnergy,
      this.totalTime,
      this.totalTimeSeconds,
      this.energyUsageCharge,
      this.totalAmountForCharge,
      this.remainAmountForCharge});

  factory _$_Data.fromJson(Map<String, dynamic> json) => _$$_DataFromJson(json);

  @override
  final double? energyUsed;
  @override
  final String? unit;
  @override
  final bool? isChargingStop;
  @override
  final String? remainingTime;
  @override
  final int? remainingTimeInSeconds;
  @override
  final int? selectedOperationType;
  @override
  final double? selectedEnergy;
  @override
  final String? totalTime;
  @override
  final int? totalTimeSeconds;
  @override
  final double? energyUsageCharge;
  @override
  final double? totalAmountForCharge;
  @override
  final double? remainAmountForCharge;

  @override
  String toString() {
    return 'Data(energyUsed: $energyUsed, unit: $unit, isChargingStop: $isChargingStop, remainingTime: $remainingTime, remainingTimeInSeconds: $remainingTimeInSeconds, selectedOperationType: $selectedOperationType, selectedEnergy: $selectedEnergy, totalTime: $totalTime, totalTimeSeconds: $totalTimeSeconds, energyUsageCharge: $energyUsageCharge, totalAmountForCharge: $totalAmountForCharge, remainAmountForCharge: $remainAmountForCharge)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data &&
            (identical(other.energyUsed, energyUsed) ||
                other.energyUsed == energyUsed) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.isChargingStop, isChargingStop) ||
                other.isChargingStop == isChargingStop) &&
            (identical(other.remainingTime, remainingTime) ||
                other.remainingTime == remainingTime) &&
            (identical(other.remainingTimeInSeconds, remainingTimeInSeconds) ||
                other.remainingTimeInSeconds == remainingTimeInSeconds) &&
            (identical(other.selectedOperationType, selectedOperationType) ||
                other.selectedOperationType == selectedOperationType) &&
            (identical(other.selectedEnergy, selectedEnergy) ||
                other.selectedEnergy == selectedEnergy) &&
            (identical(other.totalTime, totalTime) ||
                other.totalTime == totalTime) &&
            (identical(other.totalTimeSeconds, totalTimeSeconds) ||
                other.totalTimeSeconds == totalTimeSeconds) &&
            (identical(other.energyUsageCharge, energyUsageCharge) ||
                other.energyUsageCharge == energyUsageCharge) &&
            (identical(other.totalAmountForCharge, totalAmountForCharge) ||
                other.totalAmountForCharge == totalAmountForCharge) &&
            (identical(other.remainAmountForCharge, remainAmountForCharge) ||
                other.remainAmountForCharge == remainAmountForCharge));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      energyUsed,
      unit,
      isChargingStop,
      remainingTime,
      remainingTimeInSeconds,
      selectedOperationType,
      selectedEnergy,
      totalTime,
      totalTimeSeconds,
      energyUsageCharge,
      totalAmountForCharge,
      remainAmountForCharge);

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
      {final double? energyUsed,
      final String? unit,
      final bool? isChargingStop,
      final String? remainingTime,
      final int? remainingTimeInSeconds,
      final int? selectedOperationType,
      final double? selectedEnergy,
      final String? totalTime,
      final int? totalTimeSeconds,
      final double? energyUsageCharge,
      final double? totalAmountForCharge,
      final double? remainAmountForCharge}) = _$_Data;

  factory _Data.fromJson(Map<String, dynamic> json) = _$_Data.fromJson;

  @override
  double? get energyUsed;
  @override
  String? get unit;
  @override
  bool? get isChargingStop;
  @override
  String? get remainingTime;
  @override
  int? get remainingTimeInSeconds;
  @override
  int? get selectedOperationType;
  @override
  double? get selectedEnergy;
  @override
  String? get totalTime;
  @override
  int? get totalTimeSeconds;
  @override
  double? get energyUsageCharge;
  @override
  double? get totalAmountForCharge;
  @override
  double? get remainAmountForCharge;
  @override
  @JsonKey(ignore: true)
  _$$_DataCopyWith<_$_Data> get copyWith => throw _privateConstructorUsedError;
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
