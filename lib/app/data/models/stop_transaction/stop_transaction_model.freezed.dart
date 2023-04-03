// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stop_transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StopTransaction _$StopTransactionFromJson(Map<String, dynamic> json) {
  return _StopTransaction.fromJson(json);
}

/// @nodoc
mixin _$StopTransaction {
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  Data? get data => throw _privateConstructorUsedError;
  ValidationError? get validationError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StopTransactionCopyWith<StopTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StopTransactionCopyWith<$Res> {
  factory $StopTransactionCopyWith(
          StopTransaction value, $Res Function(StopTransaction) then) =
      _$StopTransactionCopyWithImpl<$Res, StopTransaction>;
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
class _$StopTransactionCopyWithImpl<$Res, $Val extends StopTransaction>
    implements $StopTransactionCopyWith<$Res> {
  _$StopTransactionCopyWithImpl(this._value, this._then);

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
abstract class _$$_StopTransactionCopyWith<$Res>
    implements $StopTransactionCopyWith<$Res> {
  factory _$$_StopTransactionCopyWith(
          _$_StopTransaction value, $Res Function(_$_StopTransaction) then) =
      __$$_StopTransactionCopyWithImpl<$Res>;
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
class __$$_StopTransactionCopyWithImpl<$Res>
    extends _$StopTransactionCopyWithImpl<$Res, _$_StopTransaction>
    implements _$$_StopTransactionCopyWith<$Res> {
  __$$_StopTransactionCopyWithImpl(
      _$_StopTransaction _value, $Res Function(_$_StopTransaction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
    Object? validationError = freezed,
  }) {
    return _then(_$_StopTransaction(
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
class _$_StopTransaction implements _StopTransaction {
  const _$_StopTransaction(
      {this.status, this.message, this.data, this.validationError});

  factory _$_StopTransaction.fromJson(Map<String, dynamic> json) =>
      _$$_StopTransactionFromJson(json);

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
    return 'StopTransaction(status: $status, message: $message, data: $data, validationError: $validationError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StopTransaction &&
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
  _$$_StopTransactionCopyWith<_$_StopTransaction> get copyWith =>
      __$$_StopTransactionCopyWithImpl<_$_StopTransaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StopTransactionToJson(
      this,
    );
  }
}

abstract class _StopTransaction implements StopTransaction {
  const factory _StopTransaction(
      {final int? status,
      final String? message,
      final Data? data,
      final ValidationError? validationError}) = _$_StopTransaction;

  factory _StopTransaction.fromJson(Map<String, dynamic> json) =
      _$_StopTransaction.fromJson;

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
  _$$_StopTransactionCopyWith<_$_StopTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  int? get taskId => throw _privateConstructorUsedError;
  String? get transactionId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call({int? taskId, String? transactionId});
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
    Object? taskId = freezed,
    Object? transactionId = freezed,
  }) {
    return _then(_value.copyWith(
      taskId: freezed == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
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
  $Res call({int? taskId, String? transactionId});
}

/// @nodoc
class __$$_DataCopyWithImpl<$Res> extends _$DataCopyWithImpl<$Res, _$_Data>
    implements _$$_DataCopyWith<$Res> {
  __$$_DataCopyWithImpl(_$_Data _value, $Res Function(_$_Data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = freezed,
    Object? transactionId = freezed,
  }) {
    return _then(_$_Data(
      taskId: freezed == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Data implements _Data {
  const _$_Data({this.taskId, this.transactionId});

  factory _$_Data.fromJson(Map<String, dynamic> json) => _$$_DataFromJson(json);

  @override
  final int? taskId;
  @override
  final String? transactionId;

  @override
  String toString() {
    return 'Data(taskId: $taskId, transactionId: $transactionId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, taskId, transactionId);

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
  const factory _Data({final int? taskId, final String? transactionId}) =
      _$_Data;

  factory _Data.fromJson(Map<String, dynamic> json) = _$_Data.fromJson;

  @override
  int? get taskId;
  @override
  String? get transactionId;
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
