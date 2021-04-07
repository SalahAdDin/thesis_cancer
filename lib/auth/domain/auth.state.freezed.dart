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

  _SignedUp signedUp(User signedUpUser) {
    return _SignedUp(
      signedUpUser,
    );
  }

  _RequestedResetPassword requestedResetPassword() {
    return const _RequestedResetPassword();
  }

  _LoggedIn loggedIn(User loggedInUser) {
    return _LoggedIn(
      loggedInUser,
    );
  }

  _LoggedOut loggedOut() {
    return const _LoggedOut();
  }

  _Error error(String error) {
    return _Error(
      error,
    );
  }

  _RequiresConfirmSignIn requiresConfirmSignIn() {
    return const _RequiresConfirmSignIn();
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(User signedUpUser) signedUp,
    required TResult Function() requestedResetPassword,
    required TResult Function(User loggedInUser) loggedIn,
    required TResult Function() loggedOut,
    required TResult Function(String error) error,
    required TResult Function() requiresConfirmSignIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User signedUpUser)? signedUp,
    TResult Function()? requestedResetPassword,
    TResult Function(User loggedInUser)? loggedIn,
    TResult Function()? loggedOut,
    TResult Function(String error)? error,
    TResult Function()? requiresConfirmSignIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_SignedUp value) signedUp,
    required TResult Function(_RequestedResetPassword value)
        requestedResetPassword,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Error value) error,
    required TResult Function(_RequiresConfirmSignIn value)
        requiresConfirmSignIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_SignedUp value)? signedUp,
    TResult Function(_RequestedResetPassword value)? requestedResetPassword,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Error value)? error,
    TResult Function(_RequiresConfirmSignIn value)? requiresConfirmSignIn,
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
    required TResult Function(User signedUpUser) signedUp,
    required TResult Function() requestedResetPassword,
    required TResult Function(User loggedInUser) loggedIn,
    required TResult Function() loggedOut,
    required TResult Function(String error) error,
    required TResult Function() requiresConfirmSignIn,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User signedUpUser)? signedUp,
    TResult Function()? requestedResetPassword,
    TResult Function(User loggedInUser)? loggedIn,
    TResult Function()? loggedOut,
    TResult Function(String error)? error,
    TResult Function()? requiresConfirmSignIn,
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
    required TResult Function(_RequestedResetPassword value)
        requestedResetPassword,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Error value) error,
    required TResult Function(_RequiresConfirmSignIn value)
        requiresConfirmSignIn,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_SignedUp value)? signedUp,
    TResult Function(_RequestedResetPassword value)? requestedResetPassword,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Error value)? error,
    TResult Function(_RequiresConfirmSignIn value)? requiresConfirmSignIn,
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
  $Res call({User signedUpUser});

  $UserCopyWith<$Res> get signedUpUser;
}

/// @nodoc
class __$SignedUpCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$SignedUpCopyWith<$Res> {
  __$SignedUpCopyWithImpl(_SignedUp _value, $Res Function(_SignedUp) _then)
      : super(_value, (v) => _then(v as _SignedUp));

  @override
  _SignedUp get _value => super._value as _SignedUp;

  @override
  $Res call({
    Object? signedUpUser = freezed,
  }) {
    return _then(_SignedUp(
      signedUpUser == freezed
          ? _value.signedUpUser
          : signedUpUser // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  $UserCopyWith<$Res> get signedUpUser {
    return $UserCopyWith<$Res>(_value.signedUpUser, (value) {
      return _then(_value.copyWith(signedUpUser: value));
    });
  }
}

/// @nodoc
class _$_SignedUp implements _SignedUp {
  const _$_SignedUp(this.signedUpUser);

  @override
  final User signedUpUser;

  @override
  String toString() {
    return 'AuthState.signedUp(signedUpUser: $signedUpUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignedUp &&
            (identical(other.signedUpUser, signedUpUser) ||
                const DeepCollectionEquality()
                    .equals(other.signedUpUser, signedUpUser)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(signedUpUser);

  @JsonKey(ignore: true)
  @override
  _$SignedUpCopyWith<_SignedUp> get copyWith =>
      __$SignedUpCopyWithImpl<_SignedUp>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(User signedUpUser) signedUp,
    required TResult Function() requestedResetPassword,
    required TResult Function(User loggedInUser) loggedIn,
    required TResult Function() loggedOut,
    required TResult Function(String error) error,
    required TResult Function() requiresConfirmSignIn,
  }) {
    return signedUp(signedUpUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User signedUpUser)? signedUp,
    TResult Function()? requestedResetPassword,
    TResult Function(User loggedInUser)? loggedIn,
    TResult Function()? loggedOut,
    TResult Function(String error)? error,
    TResult Function()? requiresConfirmSignIn,
    required TResult orElse(),
  }) {
    if (signedUp != null) {
      return signedUp(signedUpUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_SignedUp value) signedUp,
    required TResult Function(_RequestedResetPassword value)
        requestedResetPassword,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Error value) error,
    required TResult Function(_RequiresConfirmSignIn value)
        requiresConfirmSignIn,
  }) {
    return signedUp(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_SignedUp value)? signedUp,
    TResult Function(_RequestedResetPassword value)? requestedResetPassword,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Error value)? error,
    TResult Function(_RequiresConfirmSignIn value)? requiresConfirmSignIn,
    required TResult orElse(),
  }) {
    if (signedUp != null) {
      return signedUp(this);
    }
    return orElse();
  }
}

abstract class _SignedUp implements AuthState {
  const factory _SignedUp(User signedUpUser) = _$_SignedUp;

  User get signedUpUser => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SignedUpCopyWith<_SignedUp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RequestedResetPasswordCopyWith<$Res> {
  factory _$RequestedResetPasswordCopyWith(_RequestedResetPassword value,
          $Res Function(_RequestedResetPassword) then) =
      __$RequestedResetPasswordCopyWithImpl<$Res>;
}

/// @nodoc
class __$RequestedResetPasswordCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$RequestedResetPasswordCopyWith<$Res> {
  __$RequestedResetPasswordCopyWithImpl(_RequestedResetPassword _value,
      $Res Function(_RequestedResetPassword) _then)
      : super(_value, (v) => _then(v as _RequestedResetPassword));

  @override
  _RequestedResetPassword get _value => super._value as _RequestedResetPassword;
}

/// @nodoc
class _$_RequestedResetPassword implements _RequestedResetPassword {
  const _$_RequestedResetPassword();

  @override
  String toString() {
    return 'AuthState.requestedResetPassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _RequestedResetPassword);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(User signedUpUser) signedUp,
    required TResult Function() requestedResetPassword,
    required TResult Function(User loggedInUser) loggedIn,
    required TResult Function() loggedOut,
    required TResult Function(String error) error,
    required TResult Function() requiresConfirmSignIn,
  }) {
    return requestedResetPassword();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User signedUpUser)? signedUp,
    TResult Function()? requestedResetPassword,
    TResult Function(User loggedInUser)? loggedIn,
    TResult Function()? loggedOut,
    TResult Function(String error)? error,
    TResult Function()? requiresConfirmSignIn,
    required TResult orElse(),
  }) {
    if (requestedResetPassword != null) {
      return requestedResetPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_SignedUp value) signedUp,
    required TResult Function(_RequestedResetPassword value)
        requestedResetPassword,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Error value) error,
    required TResult Function(_RequiresConfirmSignIn value)
        requiresConfirmSignIn,
  }) {
    return requestedResetPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_SignedUp value)? signedUp,
    TResult Function(_RequestedResetPassword value)? requestedResetPassword,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Error value)? error,
    TResult Function(_RequiresConfirmSignIn value)? requiresConfirmSignIn,
    required TResult orElse(),
  }) {
    if (requestedResetPassword != null) {
      return requestedResetPassword(this);
    }
    return orElse();
  }
}

abstract class _RequestedResetPassword implements AuthState {
  const factory _RequestedResetPassword() = _$_RequestedResetPassword;
}

/// @nodoc
abstract class _$LoggedInCopyWith<$Res> {
  factory _$LoggedInCopyWith(_LoggedIn value, $Res Function(_LoggedIn) then) =
      __$LoggedInCopyWithImpl<$Res>;
  $Res call({User loggedInUser});

  $UserCopyWith<$Res> get loggedInUser;
}

/// @nodoc
class __$LoggedInCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$LoggedInCopyWith<$Res> {
  __$LoggedInCopyWithImpl(_LoggedIn _value, $Res Function(_LoggedIn) _then)
      : super(_value, (v) => _then(v as _LoggedIn));

  @override
  _LoggedIn get _value => super._value as _LoggedIn;

  @override
  $Res call({
    Object? loggedInUser = freezed,
  }) {
    return _then(_LoggedIn(
      loggedInUser == freezed
          ? _value.loggedInUser
          : loggedInUser // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  $UserCopyWith<$Res> get loggedInUser {
    return $UserCopyWith<$Res>(_value.loggedInUser, (value) {
      return _then(_value.copyWith(loggedInUser: value));
    });
  }
}

/// @nodoc
class _$_LoggedIn implements _LoggedIn {
  const _$_LoggedIn(this.loggedInUser);

  @override
  final User loggedInUser;

  @override
  String toString() {
    return 'AuthState.loggedIn(loggedInUser: $loggedInUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoggedIn &&
            (identical(other.loggedInUser, loggedInUser) ||
                const DeepCollectionEquality()
                    .equals(other.loggedInUser, loggedInUser)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(loggedInUser);

  @JsonKey(ignore: true)
  @override
  _$LoggedInCopyWith<_LoggedIn> get copyWith =>
      __$LoggedInCopyWithImpl<_LoggedIn>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(User signedUpUser) signedUp,
    required TResult Function() requestedResetPassword,
    required TResult Function(User loggedInUser) loggedIn,
    required TResult Function() loggedOut,
    required TResult Function(String error) error,
    required TResult Function() requiresConfirmSignIn,
  }) {
    return loggedIn(loggedInUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User signedUpUser)? signedUp,
    TResult Function()? requestedResetPassword,
    TResult Function(User loggedInUser)? loggedIn,
    TResult Function()? loggedOut,
    TResult Function(String error)? error,
    TResult Function()? requiresConfirmSignIn,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(loggedInUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_SignedUp value) signedUp,
    required TResult Function(_RequestedResetPassword value)
        requestedResetPassword,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Error value) error,
    required TResult Function(_RequiresConfirmSignIn value)
        requiresConfirmSignIn,
  }) {
    return loggedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_SignedUp value)? signedUp,
    TResult Function(_RequestedResetPassword value)? requestedResetPassword,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Error value)? error,
    TResult Function(_RequiresConfirmSignIn value)? requiresConfirmSignIn,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(this);
    }
    return orElse();
  }
}

abstract class _LoggedIn implements AuthState {
  const factory _LoggedIn(User loggedInUser) = _$_LoggedIn;

  User get loggedInUser => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoggedInCopyWith<_LoggedIn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoggedOutCopyWith<$Res> {
  factory _$LoggedOutCopyWith(
          _LoggedOut value, $Res Function(_LoggedOut) then) =
      __$LoggedOutCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoggedOutCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$LoggedOutCopyWith<$Res> {
  __$LoggedOutCopyWithImpl(_LoggedOut _value, $Res Function(_LoggedOut) _then)
      : super(_value, (v) => _then(v as _LoggedOut));

  @override
  _LoggedOut get _value => super._value as _LoggedOut;
}

/// @nodoc
class _$_LoggedOut implements _LoggedOut {
  const _$_LoggedOut();

  @override
  String toString() {
    return 'AuthState.loggedOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LoggedOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(User signedUpUser) signedUp,
    required TResult Function() requestedResetPassword,
    required TResult Function(User loggedInUser) loggedIn,
    required TResult Function() loggedOut,
    required TResult Function(String error) error,
    required TResult Function() requiresConfirmSignIn,
  }) {
    return loggedOut();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User signedUpUser)? signedUp,
    TResult Function()? requestedResetPassword,
    TResult Function(User loggedInUser)? loggedIn,
    TResult Function()? loggedOut,
    TResult Function(String error)? error,
    TResult Function()? requiresConfirmSignIn,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_SignedUp value) signedUp,
    required TResult Function(_RequestedResetPassword value)
        requestedResetPassword,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Error value) error,
    required TResult Function(_RequiresConfirmSignIn value)
        requiresConfirmSignIn,
  }) {
    return loggedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_SignedUp value)? signedUp,
    TResult Function(_RequestedResetPassword value)? requestedResetPassword,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Error value)? error,
    TResult Function(_RequiresConfirmSignIn value)? requiresConfirmSignIn,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut(this);
    }
    return orElse();
  }
}

abstract class _LoggedOut implements AuthState {
  const factory _LoggedOut() = _$_LoggedOut;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  $Res call({String error});
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
              as String,
    ));
  }
}

/// @nodoc
class _$_Error implements _Error {
  const _$_Error(this.error);

  @override
  final String error;

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
    required TResult Function(User signedUpUser) signedUp,
    required TResult Function() requestedResetPassword,
    required TResult Function(User loggedInUser) loggedIn,
    required TResult Function() loggedOut,
    required TResult Function(String error) error,
    required TResult Function() requiresConfirmSignIn,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User signedUpUser)? signedUp,
    TResult Function()? requestedResetPassword,
    TResult Function(User loggedInUser)? loggedIn,
    TResult Function()? loggedOut,
    TResult Function(String error)? error,
    TResult Function()? requiresConfirmSignIn,
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
    required TResult Function(_RequestedResetPassword value)
        requestedResetPassword,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Error value) error,
    required TResult Function(_RequiresConfirmSignIn value)
        requiresConfirmSignIn,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_SignedUp value)? signedUp,
    TResult Function(_RequestedResetPassword value)? requestedResetPassword,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Error value)? error,
    TResult Function(_RequiresConfirmSignIn value)? requiresConfirmSignIn,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AuthState {
  const factory _Error(String error) = _$_Error;

  String get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RequiresConfirmSignInCopyWith<$Res> {
  factory _$RequiresConfirmSignInCopyWith(_RequiresConfirmSignIn value,
          $Res Function(_RequiresConfirmSignIn) then) =
      __$RequiresConfirmSignInCopyWithImpl<$Res>;
}

/// @nodoc
class __$RequiresConfirmSignInCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$RequiresConfirmSignInCopyWith<$Res> {
  __$RequiresConfirmSignInCopyWithImpl(_RequiresConfirmSignIn _value,
      $Res Function(_RequiresConfirmSignIn) _then)
      : super(_value, (v) => _then(v as _RequiresConfirmSignIn));

  @override
  _RequiresConfirmSignIn get _value => super._value as _RequiresConfirmSignIn;
}

/// @nodoc
class _$_RequiresConfirmSignIn implements _RequiresConfirmSignIn {
  const _$_RequiresConfirmSignIn();

  @override
  String toString() {
    return 'AuthState.requiresConfirmSignIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _RequiresConfirmSignIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(User signedUpUser) signedUp,
    required TResult Function() requestedResetPassword,
    required TResult Function(User loggedInUser) loggedIn,
    required TResult Function() loggedOut,
    required TResult Function(String error) error,
    required TResult Function() requiresConfirmSignIn,
  }) {
    return requiresConfirmSignIn();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User signedUpUser)? signedUp,
    TResult Function()? requestedResetPassword,
    TResult Function(User loggedInUser)? loggedIn,
    TResult Function()? loggedOut,
    TResult Function(String error)? error,
    TResult Function()? requiresConfirmSignIn,
    required TResult orElse(),
  }) {
    if (requiresConfirmSignIn != null) {
      return requiresConfirmSignIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_SignedUp value) signedUp,
    required TResult Function(_RequestedResetPassword value)
        requestedResetPassword,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Error value) error,
    required TResult Function(_RequiresConfirmSignIn value)
        requiresConfirmSignIn,
  }) {
    return requiresConfirmSignIn(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_SignedUp value)? signedUp,
    TResult Function(_RequestedResetPassword value)? requestedResetPassword,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Error value)? error,
    TResult Function(_RequiresConfirmSignIn value)? requiresConfirmSignIn,
    required TResult orElse(),
  }) {
    if (requiresConfirmSignIn != null) {
      return requiresConfirmSignIn(this);
    }
    return orElse();
  }
}

abstract class _RequiresConfirmSignIn implements AuthState {
  const factory _RequiresConfirmSignIn() = _$_RequiresConfirmSignIn;
}
