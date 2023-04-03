// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  Data? get data => throw _privateConstructorUsedError;
  ValidationError? get validationError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
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
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

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
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
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
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
    Object? validationError = freezed,
  }) {
    return _then(_$_User(
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
class _$_User implements _User {
  const _$_User({this.status, this.message, this.data, this.validationError});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

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
    return 'User(status: $status, message: $message, data: $data, validationError: $validationError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
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
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {final int? status,
      final String? message,
      final Data? data,
      final ValidationError? validationError}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

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
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  UserClass? get user => throw _privateConstructorUsedError;
  String? get accessToken => throw _privateConstructorUsedError;
  String? get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call({UserClass? user, String? accessToken, String? refreshToken});

  $UserClassCopyWith<$Res>? get user;
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
    Object? user = freezed,
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserClass?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserClassCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserClassCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$_DataCopyWith(_$_Data value, $Res Function(_$_Data) then) =
      __$$_DataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserClass? user, String? accessToken, String? refreshToken});

  @override
  $UserClassCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_DataCopyWithImpl<$Res> extends _$DataCopyWithImpl<$Res, _$_Data>
    implements _$$_DataCopyWith<$Res> {
  __$$_DataCopyWithImpl(_$_Data _value, $Res Function(_$_Data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_$_Data(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserClass?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Data implements _Data {
  const _$_Data({this.user, this.accessToken, this.refreshToken});

  factory _$_Data.fromJson(Map<String, dynamic> json) => _$$_DataFromJson(json);

  @override
  final UserClass? user;
  @override
  final String? accessToken;
  @override
  final String? refreshToken;

  @override
  String toString() {
    return 'Data(user: $user, accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user, accessToken, refreshToken);

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
      {final UserClass? user,
      final String? accessToken,
      final String? refreshToken}) = _$_Data;

  factory _Data.fromJson(Map<String, dynamic> json) = _$_Data.fromJson;

  @override
  UserClass? get user;
  @override
  String? get accessToken;
  @override
  String? get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$_DataCopyWith<_$_Data> get copyWith => throw _privateConstructorUsedError;
}

UserClass _$UserClassFromJson(Map<String, dynamic> json) {
  return _UserClass.fromJson(json);
}

/// @nodoc
mixin _$UserClass {
  int? get userPk => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get access => throw _privateConstructorUsedError;
  String? get mobileNo => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  int? get countryCode => throw _privateConstructorUsedError;
  String? get userImage => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get pincode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserClassCopyWith<UserClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserClassCopyWith<$Res> {
  factory $UserClassCopyWith(UserClass value, $Res Function(UserClass) then) =
      _$UserClassCopyWithImpl<$Res, UserClass>;
  @useResult
  $Res call(
      {int? userPk,
      String? firstName,
      String? lastName,
      String? access,
      String? mobileNo,
      String? email,
      int? countryCode,
      String? userImage,
      String? address,
      String? city,
      String? state,
      String? country,
      String? pincode});
}

/// @nodoc
class _$UserClassCopyWithImpl<$Res, $Val extends UserClass>
    implements $UserClassCopyWith<$Res> {
  _$UserClassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userPk = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? access = freezed,
    Object? mobileNo = freezed,
    Object? email = freezed,
    Object? countryCode = freezed,
    Object? userImage = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? pincode = freezed,
  }) {
    return _then(_value.copyWith(
      userPk: freezed == userPk
          ? _value.userPk
          : userPk // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      access: freezed == access
          ? _value.access
          : access // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as int?,
      userImage: freezed == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      pincode: freezed == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserClassCopyWith<$Res> implements $UserClassCopyWith<$Res> {
  factory _$$_UserClassCopyWith(
          _$_UserClass value, $Res Function(_$_UserClass) then) =
      __$$_UserClassCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? userPk,
      String? firstName,
      String? lastName,
      String? access,
      String? mobileNo,
      String? email,
      int? countryCode,
      String? userImage,
      String? address,
      String? city,
      String? state,
      String? country,
      String? pincode});
}

/// @nodoc
class __$$_UserClassCopyWithImpl<$Res>
    extends _$UserClassCopyWithImpl<$Res, _$_UserClass>
    implements _$$_UserClassCopyWith<$Res> {
  __$$_UserClassCopyWithImpl(
      _$_UserClass _value, $Res Function(_$_UserClass) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userPk = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? access = freezed,
    Object? mobileNo = freezed,
    Object? email = freezed,
    Object? countryCode = freezed,
    Object? userImage = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? pincode = freezed,
  }) {
    return _then(_$_UserClass(
      userPk: freezed == userPk
          ? _value.userPk
          : userPk // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      access: freezed == access
          ? _value.access
          : access // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as int?,
      userImage: freezed == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      pincode: freezed == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserClass implements _UserClass {
  const _$_UserClass(
      {this.userPk,
      this.firstName,
      this.lastName,
      this.access,
      this.mobileNo,
      this.email,
      this.countryCode,
      this.userImage,
      this.address,
      this.city,
      this.state,
      this.country,
      this.pincode});

  factory _$_UserClass.fromJson(Map<String, dynamic> json) =>
      _$$_UserClassFromJson(json);

  @override
  final int? userPk;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? access;
  @override
  final String? mobileNo;
  @override
  final String? email;
  @override
  final int? countryCode;
  @override
  final String? userImage;
  @override
  final String? address;
  @override
  final String? city;
  @override
  final String? state;
  @override
  final String? country;
  @override
  final String? pincode;

  @override
  String toString() {
    return 'UserClass(userPk: $userPk, firstName: $firstName, lastName: $lastName, access: $access, mobileNo: $mobileNo, email: $email, countryCode: $countryCode, userImage: $userImage, address: $address, city: $city, state: $state, country: $country, pincode: $pincode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserClass &&
            (identical(other.userPk, userPk) || other.userPk == userPk) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.access, access) || other.access == access) &&
            (identical(other.mobileNo, mobileNo) ||
                other.mobileNo == mobileNo) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.userImage, userImage) ||
                other.userImage == userImage) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.pincode, pincode) || other.pincode == pincode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userPk,
      firstName,
      lastName,
      access,
      mobileNo,
      email,
      countryCode,
      userImage,
      address,
      city,
      state,
      country,
      pincode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserClassCopyWith<_$_UserClass> get copyWith =>
      __$$_UserClassCopyWithImpl<_$_UserClass>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserClassToJson(
      this,
    );
  }
}

abstract class _UserClass implements UserClass {
  const factory _UserClass(
      {final int? userPk,
      final String? firstName,
      final String? lastName,
      final String? access,
      final String? mobileNo,
      final String? email,
      final int? countryCode,
      final String? userImage,
      final String? address,
      final String? city,
      final String? state,
      final String? country,
      final String? pincode}) = _$_UserClass;

  factory _UserClass.fromJson(Map<String, dynamic> json) =
      _$_UserClass.fromJson;

  @override
  int? get userPk;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get access;
  @override
  String? get mobileNo;
  @override
  String? get email;
  @override
  int? get countryCode;
  @override
  String? get userImage;
  @override
  String? get address;
  @override
  String? get city;
  @override
  String? get state;
  @override
  String? get country;
  @override
  String? get pincode;
  @override
  @JsonKey(ignore: true)
  _$$_UserClassCopyWith<_$_UserClass> get copyWith =>
      throw _privateConstructorUsedError;
}

ValidationError _$ValidationErrorFromJson(Map<String, dynamic> json) {
  return _ValidationError.fromJson(json);
}

/// @nodoc
mixin _$ValidationError {
  List<String>? get mobileNo => throw _privateConstructorUsedError;
  List<String>? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ValidationErrorCopyWith<ValidationError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidationErrorCopyWith<$Res> {
  factory $ValidationErrorCopyWith(
          ValidationError value, $Res Function(ValidationError) then) =
      _$ValidationErrorCopyWithImpl<$Res, ValidationError>;
  @useResult
  $Res call({List<String>? mobileNo, List<String>? email});
}

/// @nodoc
class _$ValidationErrorCopyWithImpl<$Res, $Val extends ValidationError>
    implements $ValidationErrorCopyWith<$Res> {
  _$ValidationErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mobileNo = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ValidationErrorCopyWith<$Res>
    implements $ValidationErrorCopyWith<$Res> {
  factory _$$_ValidationErrorCopyWith(
          _$_ValidationError value, $Res Function(_$_ValidationError) then) =
      __$$_ValidationErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String>? mobileNo, List<String>? email});
}

/// @nodoc
class __$$_ValidationErrorCopyWithImpl<$Res>
    extends _$ValidationErrorCopyWithImpl<$Res, _$_ValidationError>
    implements _$$_ValidationErrorCopyWith<$Res> {
  __$$_ValidationErrorCopyWithImpl(
      _$_ValidationError _value, $Res Function(_$_ValidationError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mobileNo = freezed,
    Object? email = freezed,
  }) {
    return _then(_$_ValidationError(
      mobileNo: freezed == mobileNo
          ? _value._mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      email: freezed == email
          ? _value._email
          : email // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ValidationError implements _ValidationError {
  const _$_ValidationError(
      {final List<String>? mobileNo, final List<String>? email})
      : _mobileNo = mobileNo,
        _email = email;

  factory _$_ValidationError.fromJson(Map<String, dynamic> json) =>
      _$$_ValidationErrorFromJson(json);

  final List<String>? _mobileNo;
  @override
  List<String>? get mobileNo {
    final value = _mobileNo;
    if (value == null) return null;
    if (_mobileNo is EqualUnmodifiableListView) return _mobileNo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _email;
  @override
  List<String>? get email {
    final value = _email;
    if (value == null) return null;
    if (_email is EqualUnmodifiableListView) return _email;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ValidationError(mobileNo: $mobileNo, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ValidationError &&
            const DeepCollectionEquality().equals(other._mobileNo, _mobileNo) &&
            const DeepCollectionEquality().equals(other._email, _email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_mobileNo),
      const DeepCollectionEquality().hash(_email));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ValidationErrorCopyWith<_$_ValidationError> get copyWith =>
      __$$_ValidationErrorCopyWithImpl<_$_ValidationError>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ValidationErrorToJson(
      this,
    );
  }
}

abstract class _ValidationError implements ValidationError {
  const factory _ValidationError(
      {final List<String>? mobileNo,
      final List<String>? email}) = _$_ValidationError;

  factory _ValidationError.fromJson(Map<String, dynamic> json) =
      _$_ValidationError.fromJson;

  @override
  List<String>? get mobileNo;
  @override
  List<String>? get email;
  @override
  @JsonKey(ignore: true)
  _$$_ValidationErrorCopyWith<_$_ValidationError> get copyWith =>
      throw _privateConstructorUsedError;
}
