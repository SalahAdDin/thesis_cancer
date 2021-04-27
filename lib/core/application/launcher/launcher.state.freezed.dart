// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'launcher.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LauncherStateTearOff {
  const _$LauncherStateTearOff();

  _Loading loading() {
    return const _Loading();
  }

  _NeedsProfile needsProfile() {
    return const _NeedsProfile();
  }

  _ProfileLoaded profileLoaded(User user) {
    return _ProfileLoaded(
      user,
    );
  }
}

/// @nodoc
const $LauncherState = _$LauncherStateTearOff();

/// @nodoc
mixin _$LauncherState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() needsProfile,
    required TResult Function(User user) profileLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? needsProfile,
    TResult Function(User user)? profileLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_NeedsProfile value) needsProfile,
    required TResult Function(_ProfileLoaded value) profileLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_NeedsProfile value)? needsProfile,
    TResult Function(_ProfileLoaded value)? profileLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LauncherStateCopyWith<$Res> {
  factory $LauncherStateCopyWith(
          LauncherState value, $Res Function(LauncherState) then) =
      _$LauncherStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LauncherStateCopyWithImpl<$Res>
    implements $LauncherStateCopyWith<$Res> {
  _$LauncherStateCopyWithImpl(this._value, this._then);

  final LauncherState _value;
  // ignore: unused_field
  final $Res Function(LauncherState) _then;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$LauncherStateCopyWithImpl<$Res>
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
    return 'LauncherState.loading()';
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
    required TResult Function() needsProfile,
    required TResult Function(User user) profileLoaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? needsProfile,
    TResult Function(User user)? profileLoaded,
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
    required TResult Function(_NeedsProfile value) needsProfile,
    required TResult Function(_ProfileLoaded value) profileLoaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_NeedsProfile value)? needsProfile,
    TResult Function(_ProfileLoaded value)? profileLoaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements LauncherState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$NeedsProfileCopyWith<$Res> {
  factory _$NeedsProfileCopyWith(
          _NeedsProfile value, $Res Function(_NeedsProfile) then) =
      __$NeedsProfileCopyWithImpl<$Res>;
}

/// @nodoc
class __$NeedsProfileCopyWithImpl<$Res>
    extends _$LauncherStateCopyWithImpl<$Res>
    implements _$NeedsProfileCopyWith<$Res> {
  __$NeedsProfileCopyWithImpl(
      _NeedsProfile _value, $Res Function(_NeedsProfile) _then)
      : super(_value, (v) => _then(v as _NeedsProfile));

  @override
  _NeedsProfile get _value => super._value as _NeedsProfile;
}

/// @nodoc

class _$_NeedsProfile implements _NeedsProfile {
  const _$_NeedsProfile();

  @override
  String toString() {
    return 'LauncherState.needsProfile()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _NeedsProfile);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() needsProfile,
    required TResult Function(User user) profileLoaded,
  }) {
    return needsProfile();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? needsProfile,
    TResult Function(User user)? profileLoaded,
    required TResult orElse(),
  }) {
    if (needsProfile != null) {
      return needsProfile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_NeedsProfile value) needsProfile,
    required TResult Function(_ProfileLoaded value) profileLoaded,
  }) {
    return needsProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_NeedsProfile value)? needsProfile,
    TResult Function(_ProfileLoaded value)? profileLoaded,
    required TResult orElse(),
  }) {
    if (needsProfile != null) {
      return needsProfile(this);
    }
    return orElse();
  }
}

abstract class _NeedsProfile implements LauncherState {
  const factory _NeedsProfile() = _$_NeedsProfile;
}

/// @nodoc
abstract class _$ProfileLoadedCopyWith<$Res> {
  factory _$ProfileLoadedCopyWith(
          _ProfileLoaded value, $Res Function(_ProfileLoaded) then) =
      __$ProfileLoadedCopyWithImpl<$Res>;
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$ProfileLoadedCopyWithImpl<$Res>
    extends _$LauncherStateCopyWithImpl<$Res>
    implements _$ProfileLoadedCopyWith<$Res> {
  __$ProfileLoadedCopyWithImpl(
      _ProfileLoaded _value, $Res Function(_ProfileLoaded) _then)
      : super(_value, (v) => _then(v as _ProfileLoaded));

  @override
  _ProfileLoaded get _value => super._value as _ProfileLoaded;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_ProfileLoaded(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$_ProfileLoaded implements _ProfileLoaded {
  const _$_ProfileLoaded(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'LauncherState.profileLoaded(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProfileLoaded &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  _$ProfileLoadedCopyWith<_ProfileLoaded> get copyWith =>
      __$ProfileLoadedCopyWithImpl<_ProfileLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() needsProfile,
    required TResult Function(User user) profileLoaded,
  }) {
    return profileLoaded(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? needsProfile,
    TResult Function(User user)? profileLoaded,
    required TResult orElse(),
  }) {
    if (profileLoaded != null) {
      return profileLoaded(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_NeedsProfile value) needsProfile,
    required TResult Function(_ProfileLoaded value) profileLoaded,
  }) {
    return profileLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_NeedsProfile value)? needsProfile,
    TResult Function(_ProfileLoaded value)? profileLoaded,
    required TResult orElse(),
  }) {
    if (profileLoaded != null) {
      return profileLoaded(this);
    }
    return orElse();
  }
}

abstract class _ProfileLoaded implements LauncherState {
  const factory _ProfileLoaded(User user) = _$_ProfileLoaded;

  User get user => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ProfileLoadedCopyWith<_ProfileLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
