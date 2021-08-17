// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'auth.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  _Loading loading() {
    return const _Loading();
  }

  _SignedUp signedUp() {
    return const _SignedUp();
  }

  _LoggedIn loggedIn() {
    return const _LoggedIn();
  }

  _Error error([Failure? error]) {
    return _Error(
      error,
    );
  }

  _ResetPassword resetPassword() {
    return const _ResetPassword();
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() signedUp,
    required TResult Function() loggedIn,
    required TResult Function(Failure? error) error,
    required TResult Function() resetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? signedUp,
    TResult Function()? loggedIn,
    TResult Function(Failure? error)? error,
    TResult Function()? resetPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_SignedUp value) signedUp,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_Error value) error,
    required TResult Function(_ResetPassword value) resetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_SignedUp value)? signedUp,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_Error value)? error,
    TResult Function(_ResetPassword value)? resetPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() signedUp,
    required TResult Function() loggedIn,
    required TResult Function(Failure? error) error,
    required TResult Function() resetPassword,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? signedUp,
    TResult Function()? loggedIn,
    TResult Function(Failure? error)? error,
    TResult Function()? resetPassword,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_SignedUp value) signedUp,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_Error value) error,
    required TResult Function(_ResetPassword value) resetPassword,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_SignedUp value)? signedUp,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_Error value)? error,
    TResult Function(_ResetPassword value)? resetPassword,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AuthState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$SignedUpCopyWith<$Res> {
  factory _$SignedUpCopyWith(_SignedUp value, $Res Function(_SignedUp) then) =
      __$SignedUpCopyWithImpl<$Res>;
}

/// @nodoc
class __$SignedUpCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$SignedUpCopyWith<$Res> {
  __$SignedUpCopyWithImpl(_SignedUp _value, $Res Function(_SignedUp) _then)
      : super(_value, (v) => _then(v as _SignedUp));

  @override
  _SignedUp get _value => super._value as _SignedUp;
}

/// @nodoc

class _$_SignedUp implements _SignedUp {
  const _$_SignedUp();

  @override
  String toString() {
    return 'AuthState.signedUp()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SignedUp);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() signedUp,
    required TResult Function() loggedIn,
    required TResult Function(Failure? error) error,
    required TResult Function() resetPassword,
  }) {
    return signedUp();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? signedUp,
    TResult Function()? loggedIn,
    TResult Function(Failure? error)? error,
    TResult Function()? resetPassword,
    required TResult orElse(),
  }) {
    if (signedUp != null) {
      return signedUp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_SignedUp value) signedUp,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_Error value) error,
    required TResult Function(_ResetPassword value) resetPassword,
  }) {
    return signedUp(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_SignedUp value)? signedUp,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_Error value)? error,
    TResult Function(_ResetPassword value)? resetPassword,
    required TResult orElse(),
  }) {
    if (signedUp != null) {
      return signedUp(this);
    }
    return orElse();
  }
}

abstract class _SignedUp implements AuthState {
  const factory _SignedUp() = _$_SignedUp;
}

/// @nodoc
abstract class _$LoggedInCopyWith<$Res> {
  factory _$LoggedInCopyWith(_LoggedIn value, $Res Function(_LoggedIn) then) =
      __$LoggedInCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoggedInCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$LoggedInCopyWith<$Res> {
  __$LoggedInCopyWithImpl(_LoggedIn _value, $Res Function(_LoggedIn) _then)
      : super(_value, (v) => _then(v as _LoggedIn));

  @override
  _LoggedIn get _value => super._value as _LoggedIn;
}

/// @nodoc

class _$_LoggedIn implements _LoggedIn {
  const _$_LoggedIn();

  @override
  String toString() {
    return 'AuthState.loggedIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LoggedIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() signedUp,
    required TResult Function() loggedIn,
    required TResult Function(Failure? error) error,
    required TResult Function() resetPassword,
  }) {
    return loggedIn();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? signedUp,
    TResult Function()? loggedIn,
    TResult Function(Failure? error)? error,
    TResult Function()? resetPassword,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_SignedUp value) signedUp,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_Error value) error,
    required TResult Function(_ResetPassword value) resetPassword,
  }) {
    return loggedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_SignedUp value)? signedUp,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_Error value)? error,
    TResult Function(_ResetPassword value)? resetPassword,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(this);
    }
    return orElse();
  }
}

abstract class _LoggedIn implements AuthState {
  const factory _LoggedIn() = _$_LoggedIn;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  $Res call({Failure? error});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_Error(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error([this.error]);

  @override
  final Failure? error;

  @override
  String toString() {
    return 'AuthState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Error &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() signedUp,
    required TResult Function() loggedIn,
    required TResult Function(Failure? error) error,
    required TResult Function() resetPassword,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? signedUp,
    TResult Function()? loggedIn,
    TResult Function(Failure? error)? error,
    TResult Function()? resetPassword,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_SignedUp value) signedUp,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_Error value) error,
    required TResult Function(_ResetPassword value) resetPassword,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_SignedUp value)? signedUp,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_Error value)? error,
    TResult Function(_ResetPassword value)? resetPassword,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AuthState {
  const factory _Error([Failure? error]) = _$_Error;

  Failure? get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ResetPasswordCopyWith<$Res> {
  factory _$ResetPasswordCopyWith(
          _ResetPassword value, $Res Function(_ResetPassword) then) =
      __$ResetPasswordCopyWithImpl<$Res>;
}

/// @nodoc
class __$ResetPasswordCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$ResetPasswordCopyWith<$Res> {
  __$ResetPasswordCopyWithImpl(
      _ResetPassword _value, $Res Function(_ResetPassword) _then)
      : super(_value, (v) => _then(v as _ResetPassword));

  @override
  _ResetPassword get _value => super._value as _ResetPassword;
}

/// @nodoc

class _$_ResetPassword implements _ResetPassword {
  const _$_ResetPassword();

  @override
  String toString() {
    return 'AuthState.resetPassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ResetPassword);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() signedUp,
    required TResult Function() loggedIn,
    required TResult Function(Failure? error) error,
    required TResult Function() resetPassword,
  }) {
    return resetPassword();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? signedUp,
    TResult Function()? loggedIn,
    TResult Function(Failure? error)? error,
    TResult Function()? resetPassword,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_SignedUp value) signedUp,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_Error value) error,
    required TResult Function(_ResetPassword value) resetPassword,
  }) {
    return resetPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_SignedUp value)? signedUp,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_Error value)? error,
    TResult Function(_ResetPassword value)? resetPassword,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(this);
    }
    return orElse();
  }
}

abstract class _ResetPassword implements AuthState {
  const factory _ResetPassword() = _$_ResetPassword;
}
