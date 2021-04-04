// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserStateTearOff {
  const _$UserStateTearOff();

  _Loading loading() {
    return const _Loading();
  }

  _IsAdmin isAdmin() {
    return const _IsAdmin();
  }

  _UnConfirmed unConfirmed() {
    return const _UnConfirmed();
  }

  _MustSeeIntroduction mustSeeIntroduction() {
    return const _MustSeeIntroduction();
  }

  _MustSeeTutorial mustSeeTutorial() {
    return const _MustSeeTutorial();
  }

  _Completed completed() {
    return const _Completed();
  }

  _Error error(String error) {
    return _Error(
      error,
    );
  }
}

/// @nodoc
const $UserState = _$UserStateTearOff();

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() isAdmin,
    required TResult Function() unConfirmed,
    required TResult Function() mustSeeIntroduction,
    required TResult Function() mustSeeTutorial,
    required TResult Function() completed,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? isAdmin,
    TResult Function()? unConfirmed,
    TResult Function()? mustSeeIntroduction,
    TResult Function()? mustSeeTutorial,
    TResult Function()? completed,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_IsAdmin value) isAdmin,
    required TResult Function(_UnConfirmed value) unConfirmed,
    required TResult Function(_MustSeeIntroduction value) mustSeeIntroduction,
    required TResult Function(_MustSeeTutorial value) mustSeeTutorial,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_IsAdmin value)? isAdmin,
    TResult Function(_UnConfirmed value)? unConfirmed,
    TResult Function(_MustSeeIntroduction value)? mustSeeIntroduction,
    TResult Function(_MustSeeTutorial value)? mustSeeTutorial,
    TResult Function(_Completed value)? completed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res> implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  final UserState _value;
  // ignore: unused_field
  final $Res Function(UserState) _then;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
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
    return 'UserState.loading()';
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
    required TResult Function() isAdmin,
    required TResult Function() unConfirmed,
    required TResult Function() mustSeeIntroduction,
    required TResult Function() mustSeeTutorial,
    required TResult Function() completed,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? isAdmin,
    TResult Function()? unConfirmed,
    TResult Function()? mustSeeIntroduction,
    TResult Function()? mustSeeTutorial,
    TResult Function()? completed,
    TResult Function(String error)? error,
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
    required TResult Function(_IsAdmin value) isAdmin,
    required TResult Function(_UnConfirmed value) unConfirmed,
    required TResult Function(_MustSeeIntroduction value) mustSeeIntroduction,
    required TResult Function(_MustSeeTutorial value) mustSeeTutorial,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_IsAdmin value)? isAdmin,
    TResult Function(_UnConfirmed value)? unConfirmed,
    TResult Function(_MustSeeIntroduction value)? mustSeeIntroduction,
    TResult Function(_MustSeeTutorial value)? mustSeeTutorial,
    TResult Function(_Completed value)? completed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements UserState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$IsAdminCopyWith<$Res> {
  factory _$IsAdminCopyWith(_IsAdmin value, $Res Function(_IsAdmin) then) =
      __$IsAdminCopyWithImpl<$Res>;
}

/// @nodoc
class __$IsAdminCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$IsAdminCopyWith<$Res> {
  __$IsAdminCopyWithImpl(_IsAdmin _value, $Res Function(_IsAdmin) _then)
      : super(_value, (v) => _then(v as _IsAdmin));

  @override
  _IsAdmin get _value => super._value as _IsAdmin;
}

/// @nodoc
class _$_IsAdmin implements _IsAdmin {
  const _$_IsAdmin();

  @override
  String toString() {
    return 'UserState.isAdmin()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _IsAdmin);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() isAdmin,
    required TResult Function() unConfirmed,
    required TResult Function() mustSeeIntroduction,
    required TResult Function() mustSeeTutorial,
    required TResult Function() completed,
    required TResult Function(String error) error,
  }) {
    return isAdmin();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? isAdmin,
    TResult Function()? unConfirmed,
    TResult Function()? mustSeeIntroduction,
    TResult Function()? mustSeeTutorial,
    TResult Function()? completed,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (isAdmin != null) {
      return isAdmin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_IsAdmin value) isAdmin,
    required TResult Function(_UnConfirmed value) unConfirmed,
    required TResult Function(_MustSeeIntroduction value) mustSeeIntroduction,
    required TResult Function(_MustSeeTutorial value) mustSeeTutorial,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Error value) error,
  }) {
    return isAdmin(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_IsAdmin value)? isAdmin,
    TResult Function(_UnConfirmed value)? unConfirmed,
    TResult Function(_MustSeeIntroduction value)? mustSeeIntroduction,
    TResult Function(_MustSeeTutorial value)? mustSeeTutorial,
    TResult Function(_Completed value)? completed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (isAdmin != null) {
      return isAdmin(this);
    }
    return orElse();
  }
}

abstract class _IsAdmin implements UserState {
  const factory _IsAdmin() = _$_IsAdmin;
}

/// @nodoc
abstract class _$UnConfirmedCopyWith<$Res> {
  factory _$UnConfirmedCopyWith(
          _UnConfirmed value, $Res Function(_UnConfirmed) then) =
      __$UnConfirmedCopyWithImpl<$Res>;
}

/// @nodoc
class __$UnConfirmedCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$UnConfirmedCopyWith<$Res> {
  __$UnConfirmedCopyWithImpl(
      _UnConfirmed _value, $Res Function(_UnConfirmed) _then)
      : super(_value, (v) => _then(v as _UnConfirmed));

  @override
  _UnConfirmed get _value => super._value as _UnConfirmed;
}

/// @nodoc
class _$_UnConfirmed implements _UnConfirmed {
  const _$_UnConfirmed();

  @override
  String toString() {
    return 'UserState.unConfirmed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _UnConfirmed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() isAdmin,
    required TResult Function() unConfirmed,
    required TResult Function() mustSeeIntroduction,
    required TResult Function() mustSeeTutorial,
    required TResult Function() completed,
    required TResult Function(String error) error,
  }) {
    return unConfirmed();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? isAdmin,
    TResult Function()? unConfirmed,
    TResult Function()? mustSeeIntroduction,
    TResult Function()? mustSeeTutorial,
    TResult Function()? completed,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (unConfirmed != null) {
      return unConfirmed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_IsAdmin value) isAdmin,
    required TResult Function(_UnConfirmed value) unConfirmed,
    required TResult Function(_MustSeeIntroduction value) mustSeeIntroduction,
    required TResult Function(_MustSeeTutorial value) mustSeeTutorial,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Error value) error,
  }) {
    return unConfirmed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_IsAdmin value)? isAdmin,
    TResult Function(_UnConfirmed value)? unConfirmed,
    TResult Function(_MustSeeIntroduction value)? mustSeeIntroduction,
    TResult Function(_MustSeeTutorial value)? mustSeeTutorial,
    TResult Function(_Completed value)? completed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (unConfirmed != null) {
      return unConfirmed(this);
    }
    return orElse();
  }
}

abstract class _UnConfirmed implements UserState {
  const factory _UnConfirmed() = _$_UnConfirmed;
}

/// @nodoc
abstract class _$MustSeeIntroductionCopyWith<$Res> {
  factory _$MustSeeIntroductionCopyWith(_MustSeeIntroduction value,
          $Res Function(_MustSeeIntroduction) then) =
      __$MustSeeIntroductionCopyWithImpl<$Res>;
}

/// @nodoc
class __$MustSeeIntroductionCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res>
    implements _$MustSeeIntroductionCopyWith<$Res> {
  __$MustSeeIntroductionCopyWithImpl(
      _MustSeeIntroduction _value, $Res Function(_MustSeeIntroduction) _then)
      : super(_value, (v) => _then(v as _MustSeeIntroduction));

  @override
  _MustSeeIntroduction get _value => super._value as _MustSeeIntroduction;
}

/// @nodoc
class _$_MustSeeIntroduction implements _MustSeeIntroduction {
  const _$_MustSeeIntroduction();

  @override
  String toString() {
    return 'UserState.mustSeeIntroduction()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _MustSeeIntroduction);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() isAdmin,
    required TResult Function() unConfirmed,
    required TResult Function() mustSeeIntroduction,
    required TResult Function() mustSeeTutorial,
    required TResult Function() completed,
    required TResult Function(String error) error,
  }) {
    return mustSeeIntroduction();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? isAdmin,
    TResult Function()? unConfirmed,
    TResult Function()? mustSeeIntroduction,
    TResult Function()? mustSeeTutorial,
    TResult Function()? completed,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (mustSeeIntroduction != null) {
      return mustSeeIntroduction();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_IsAdmin value) isAdmin,
    required TResult Function(_UnConfirmed value) unConfirmed,
    required TResult Function(_MustSeeIntroduction value) mustSeeIntroduction,
    required TResult Function(_MustSeeTutorial value) mustSeeTutorial,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Error value) error,
  }) {
    return mustSeeIntroduction(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_IsAdmin value)? isAdmin,
    TResult Function(_UnConfirmed value)? unConfirmed,
    TResult Function(_MustSeeIntroduction value)? mustSeeIntroduction,
    TResult Function(_MustSeeTutorial value)? mustSeeTutorial,
    TResult Function(_Completed value)? completed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (mustSeeIntroduction != null) {
      return mustSeeIntroduction(this);
    }
    return orElse();
  }
}

abstract class _MustSeeIntroduction implements UserState {
  const factory _MustSeeIntroduction() = _$_MustSeeIntroduction;
}

/// @nodoc
abstract class _$MustSeeTutorialCopyWith<$Res> {
  factory _$MustSeeTutorialCopyWith(
          _MustSeeTutorial value, $Res Function(_MustSeeTutorial) then) =
      __$MustSeeTutorialCopyWithImpl<$Res>;
}

/// @nodoc
class __$MustSeeTutorialCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$MustSeeTutorialCopyWith<$Res> {
  __$MustSeeTutorialCopyWithImpl(
      _MustSeeTutorial _value, $Res Function(_MustSeeTutorial) _then)
      : super(_value, (v) => _then(v as _MustSeeTutorial));

  @override
  _MustSeeTutorial get _value => super._value as _MustSeeTutorial;
}

/// @nodoc
class _$_MustSeeTutorial implements _MustSeeTutorial {
  const _$_MustSeeTutorial();

  @override
  String toString() {
    return 'UserState.mustSeeTutorial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _MustSeeTutorial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() isAdmin,
    required TResult Function() unConfirmed,
    required TResult Function() mustSeeIntroduction,
    required TResult Function() mustSeeTutorial,
    required TResult Function() completed,
    required TResult Function(String error) error,
  }) {
    return mustSeeTutorial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? isAdmin,
    TResult Function()? unConfirmed,
    TResult Function()? mustSeeIntroduction,
    TResult Function()? mustSeeTutorial,
    TResult Function()? completed,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (mustSeeTutorial != null) {
      return mustSeeTutorial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_IsAdmin value) isAdmin,
    required TResult Function(_UnConfirmed value) unConfirmed,
    required TResult Function(_MustSeeIntroduction value) mustSeeIntroduction,
    required TResult Function(_MustSeeTutorial value) mustSeeTutorial,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Error value) error,
  }) {
    return mustSeeTutorial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_IsAdmin value)? isAdmin,
    TResult Function(_UnConfirmed value)? unConfirmed,
    TResult Function(_MustSeeIntroduction value)? mustSeeIntroduction,
    TResult Function(_MustSeeTutorial value)? mustSeeTutorial,
    TResult Function(_Completed value)? completed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (mustSeeTutorial != null) {
      return mustSeeTutorial(this);
    }
    return orElse();
  }
}

abstract class _MustSeeTutorial implements UserState {
  const factory _MustSeeTutorial() = _$_MustSeeTutorial;
}

/// @nodoc
abstract class _$CompletedCopyWith<$Res> {
  factory _$CompletedCopyWith(
          _Completed value, $Res Function(_Completed) then) =
      __$CompletedCopyWithImpl<$Res>;
}

/// @nodoc
class __$CompletedCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$CompletedCopyWith<$Res> {
  __$CompletedCopyWithImpl(_Completed _value, $Res Function(_Completed) _then)
      : super(_value, (v) => _then(v as _Completed));

  @override
  _Completed get _value => super._value as _Completed;
}

/// @nodoc
class _$_Completed implements _Completed {
  const _$_Completed();

  @override
  String toString() {
    return 'UserState.completed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Completed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() isAdmin,
    required TResult Function() unConfirmed,
    required TResult Function() mustSeeIntroduction,
    required TResult Function() mustSeeTutorial,
    required TResult Function() completed,
    required TResult Function(String error) error,
  }) {
    return completed();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? isAdmin,
    TResult Function()? unConfirmed,
    TResult Function()? mustSeeIntroduction,
    TResult Function()? mustSeeTutorial,
    TResult Function()? completed,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_IsAdmin value) isAdmin,
    required TResult Function(_UnConfirmed value) unConfirmed,
    required TResult Function(_MustSeeIntroduction value) mustSeeIntroduction,
    required TResult Function(_MustSeeTutorial value) mustSeeTutorial,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Error value) error,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_IsAdmin value)? isAdmin,
    TResult Function(_UnConfirmed value)? unConfirmed,
    TResult Function(_MustSeeIntroduction value)? mustSeeIntroduction,
    TResult Function(_MustSeeTutorial value)? mustSeeTutorial,
    TResult Function(_Completed value)? completed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class _Completed implements UserState {
  const factory _Completed() = _$_Completed;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
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
    return 'UserState.error(error: $error)';
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
    required TResult Function() isAdmin,
    required TResult Function() unConfirmed,
    required TResult Function() mustSeeIntroduction,
    required TResult Function() mustSeeTutorial,
    required TResult Function() completed,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? isAdmin,
    TResult Function()? unConfirmed,
    TResult Function()? mustSeeIntroduction,
    TResult Function()? mustSeeTutorial,
    TResult Function()? completed,
    TResult Function(String error)? error,
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
    required TResult Function(_IsAdmin value) isAdmin,
    required TResult Function(_UnConfirmed value) unConfirmed,
    required TResult Function(_MustSeeIntroduction value) mustSeeIntroduction,
    required TResult Function(_MustSeeTutorial value) mustSeeTutorial,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_IsAdmin value)? isAdmin,
    TResult Function(_UnConfirmed value)? unConfirmed,
    TResult Function(_MustSeeIntroduction value)? mustSeeIntroduction,
    TResult Function(_MustSeeTutorial value)? mustSeeTutorial,
    TResult Function(_Completed value)? completed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements UserState {
  const factory _Error(String error) = _$_Error;

  String get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}
