// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginObject {
  String get userName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginObjectCopyWith<LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginObjectCopyWith<$Res> {
  factory $LoginObjectCopyWith(
          LoginObject value, $Res Function(LoginObject) then) =
      _$LoginObjectCopyWithImpl<$Res, LoginObject>;
  @useResult
  $Res call({String userName, String password});
}

/// @nodoc
class _$LoginObjectCopyWithImpl<$Res, $Val extends LoginObject>
    implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginObjectImplCopyWith<$Res>
    implements $LoginObjectCopyWith<$Res> {
  factory _$$LoginObjectImplCopyWith(
          _$LoginObjectImpl value, $Res Function(_$LoginObjectImpl) then) =
      __$$LoginObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userName, String password});
}

/// @nodoc
class __$$LoginObjectImplCopyWithImpl<$Res>
    extends _$LoginObjectCopyWithImpl<$Res, _$LoginObjectImpl>
    implements _$$LoginObjectImplCopyWith<$Res> {
  __$$LoginObjectImplCopyWithImpl(
      _$LoginObjectImpl _value, $Res Function(_$LoginObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? password = null,
  }) {
    return _then(_$LoginObjectImpl(
      null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginObjectImpl implements _LoginObject {
  _$LoginObjectImpl(this.userName, this.password);

  @override
  final String userName;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginObject(userName: $userName, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginObjectImpl &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userName, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginObjectImplCopyWith<_$LoginObjectImpl> get copyWith =>
      __$$LoginObjectImplCopyWithImpl<_$LoginObjectImpl>(this, _$identity);
}

abstract class _LoginObject implements LoginObject {
  factory _LoginObject(final String userName, final String password) =
      _$LoginObjectImpl;

  @override
  String get userName;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$LoginObjectImplCopyWith<_$LoginObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ForgetPassword {
  String get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgetPasswordCopyWith<ForgetPassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgetPasswordCopyWith<$Res> {
  factory $ForgetPasswordCopyWith(
          ForgetPassword value, $Res Function(ForgetPassword) then) =
      _$ForgetPasswordCopyWithImpl<$Res, ForgetPassword>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$ForgetPasswordCopyWithImpl<$Res, $Val extends ForgetPassword>
    implements $ForgetPasswordCopyWith<$Res> {
  _$ForgetPasswordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForgetPasswordImplCopyWith<$Res>
    implements $ForgetPasswordCopyWith<$Res> {
  factory _$$ForgetPasswordImplCopyWith(_$ForgetPasswordImpl value,
          $Res Function(_$ForgetPasswordImpl) then) =
      __$$ForgetPasswordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$ForgetPasswordImplCopyWithImpl<$Res>
    extends _$ForgetPasswordCopyWithImpl<$Res, _$ForgetPasswordImpl>
    implements _$$ForgetPasswordImplCopyWith<$Res> {
  __$$ForgetPasswordImplCopyWithImpl(
      _$ForgetPasswordImpl _value, $Res Function(_$ForgetPasswordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$ForgetPasswordImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ForgetPasswordImpl implements _ForgetPassword {
  _$ForgetPasswordImpl(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'ForgetPassword(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgetPasswordImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgetPasswordImplCopyWith<_$ForgetPasswordImpl> get copyWith =>
      __$$ForgetPasswordImplCopyWithImpl<_$ForgetPasswordImpl>(
          this, _$identity);
}

abstract class _ForgetPassword implements ForgetPassword {
  factory _ForgetPassword(final String email) = _$ForgetPasswordImpl;

  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$ForgetPasswordImplCopyWith<_$ForgetPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegesterObject {
  String get userName => throw _privateConstructorUsedError;
  String get countryMobileCode => throw _privateConstructorUsedError;
  String get mobilNumber => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get profilePichture => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegesterObjectCopyWith<RegesterObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegesterObjectCopyWith<$Res> {
  factory $RegesterObjectCopyWith(
          RegesterObject value, $Res Function(RegesterObject) then) =
      _$RegesterObjectCopyWithImpl<$Res, RegesterObject>;
  @useResult
  $Res call(
      {String userName,
      String countryMobileCode,
      String mobilNumber,
      String email,
      String password,
      String profilePichture});
}

/// @nodoc
class _$RegesterObjectCopyWithImpl<$Res, $Val extends RegesterObject>
    implements $RegesterObjectCopyWith<$Res> {
  _$RegesterObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? countryMobileCode = null,
    Object? mobilNumber = null,
    Object? email = null,
    Object? password = null,
    Object? profilePichture = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      countryMobileCode: null == countryMobileCode
          ? _value.countryMobileCode
          : countryMobileCode // ignore: cast_nullable_to_non_nullable
              as String,
      mobilNumber: null == mobilNumber
          ? _value.mobilNumber
          : mobilNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      profilePichture: null == profilePichture
          ? _value.profilePichture
          : profilePichture // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegesterObjectImplCopyWith<$Res>
    implements $RegesterObjectCopyWith<$Res> {
  factory _$$RegesterObjectImplCopyWith(_$RegesterObjectImpl value,
          $Res Function(_$RegesterObjectImpl) then) =
      __$$RegesterObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userName,
      String countryMobileCode,
      String mobilNumber,
      String email,
      String password,
      String profilePichture});
}

/// @nodoc
class __$$RegesterObjectImplCopyWithImpl<$Res>
    extends _$RegesterObjectCopyWithImpl<$Res, _$RegesterObjectImpl>
    implements _$$RegesterObjectImplCopyWith<$Res> {
  __$$RegesterObjectImplCopyWithImpl(
      _$RegesterObjectImpl _value, $Res Function(_$RegesterObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? countryMobileCode = null,
    Object? mobilNumber = null,
    Object? email = null,
    Object? password = null,
    Object? profilePichture = null,
  }) {
    return _then(_$RegesterObjectImpl(
      null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      null == countryMobileCode
          ? _value.countryMobileCode
          : countryMobileCode // ignore: cast_nullable_to_non_nullable
              as String,
      null == mobilNumber
          ? _value.mobilNumber
          : mobilNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == profilePichture
          ? _value.profilePichture
          : profilePichture // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegesterObjectImpl implements _RegesterObject {
  _$RegesterObjectImpl(this.userName, this.countryMobileCode, this.mobilNumber,
      this.email, this.password, this.profilePichture);

  @override
  final String userName;
  @override
  final String countryMobileCode;
  @override
  final String mobilNumber;
  @override
  final String email;
  @override
  final String password;
  @override
  final String profilePichture;

  @override
  String toString() {
    return 'RegesterObject(userName: $userName, countryMobileCode: $countryMobileCode, mobilNumber: $mobilNumber, email: $email, password: $password, profilePichture: $profilePichture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegesterObjectImpl &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.countryMobileCode, countryMobileCode) ||
                other.countryMobileCode == countryMobileCode) &&
            (identical(other.mobilNumber, mobilNumber) ||
                other.mobilNumber == mobilNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.profilePichture, profilePichture) ||
                other.profilePichture == profilePichture));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userName, countryMobileCode,
      mobilNumber, email, password, profilePichture);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegesterObjectImplCopyWith<_$RegesterObjectImpl> get copyWith =>
      __$$RegesterObjectImplCopyWithImpl<_$RegesterObjectImpl>(
          this, _$identity);
}

abstract class _RegesterObject implements RegesterObject {
  factory _RegesterObject(
      final String userName,
      final String countryMobileCode,
      final String mobilNumber,
      final String email,
      final String password,
      final String profilePichture) = _$RegesterObjectImpl;

  @override
  String get userName;
  @override
  String get countryMobileCode;
  @override
  String get mobilNumber;
  @override
  String get email;
  @override
  String get password;
  @override
  String get profilePichture;
  @override
  @JsonKey(ignore: true)
  _$$RegesterObjectImplCopyWith<_$RegesterObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
