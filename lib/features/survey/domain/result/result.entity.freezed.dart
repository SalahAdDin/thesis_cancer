// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'result.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserSurveyResult _$UserSurveyResultFromJson(Map<String, dynamic> json) {
  return _UserSurveyResult.fromJson(json);
}

/// @nodoc
class _$UserSurveyResultTearOff {
  const _$UserSurveyResultTearOff();

  _UserSurveyResult call(
      {required String user,
      required String survey,
      required List<UserSurveyAnswer> answers,
      required int iteration,
      DateTime? createdAt}) {
    return _UserSurveyResult(
      user: user,
      survey: survey,
      answers: answers,
      iteration: iteration,
      createdAt: createdAt,
    );
  }

  UserSurveyResult fromJson(Map<String, Object> json) {
    return UserSurveyResult.fromJson(json);
  }
}

/// @nodoc
const $UserSurveyResult = _$UserSurveyResultTearOff();

/// @nodoc
mixin _$UserSurveyResult {
// required String id,
  String get user => throw _privateConstructorUsedError; // User ID
  String get survey => throw _privateConstructorUsedError; // Survey ID
  List<UserSurveyAnswer> get answers => throw _privateConstructorUsedError;
  int get iteration => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSurveyResultCopyWith<UserSurveyResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSurveyResultCopyWith<$Res> {
  factory $UserSurveyResultCopyWith(
          UserSurveyResult value, $Res Function(UserSurveyResult) then) =
      _$UserSurveyResultCopyWithImpl<$Res>;
  $Res call(
      {String user,
      String survey,
      List<UserSurveyAnswer> answers,
      int iteration,
      DateTime? createdAt});
}

/// @nodoc
class _$UserSurveyResultCopyWithImpl<$Res>
    implements $UserSurveyResultCopyWith<$Res> {
  _$UserSurveyResultCopyWithImpl(this._value, this._then);

  final UserSurveyResult _value;
  // ignore: unused_field
  final $Res Function(UserSurveyResult) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? survey = freezed,
    Object? answers = freezed,
    Object? iteration = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      survey: survey == freezed
          ? _value.survey
          : survey // ignore: cast_nullable_to_non_nullable
              as String,
      answers: answers == freezed
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<UserSurveyAnswer>,
      iteration: iteration == freezed
          ? _value.iteration
          : iteration // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$UserSurveyResultCopyWith<$Res>
    implements $UserSurveyResultCopyWith<$Res> {
  factory _$UserSurveyResultCopyWith(
          _UserSurveyResult value, $Res Function(_UserSurveyResult) then) =
      __$UserSurveyResultCopyWithImpl<$Res>;
  @override
  $Res call(
      {String user,
      String survey,
      List<UserSurveyAnswer> answers,
      int iteration,
      DateTime? createdAt});
}

/// @nodoc
class __$UserSurveyResultCopyWithImpl<$Res>
    extends _$UserSurveyResultCopyWithImpl<$Res>
    implements _$UserSurveyResultCopyWith<$Res> {
  __$UserSurveyResultCopyWithImpl(
      _UserSurveyResult _value, $Res Function(_UserSurveyResult) _then)
      : super(_value, (v) => _then(v as _UserSurveyResult));

  @override
  _UserSurveyResult get _value => super._value as _UserSurveyResult;

  @override
  $Res call({
    Object? user = freezed,
    Object? survey = freezed,
    Object? answers = freezed,
    Object? iteration = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_UserSurveyResult(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      survey: survey == freezed
          ? _value.survey
          : survey // ignore: cast_nullable_to_non_nullable
              as String,
      answers: answers == freezed
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<UserSurveyAnswer>,
      iteration: iteration == freezed
          ? _value.iteration
          : iteration // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserSurveyResult implements _UserSurveyResult {
  const _$_UserSurveyResult(
      {required this.user,
      required this.survey,
      required this.answers,
      required this.iteration,
      this.createdAt});

  factory _$_UserSurveyResult.fromJson(Map<String, dynamic> json) =>
      _$_$_UserSurveyResultFromJson(json);

  @override // required String id,
  final String user;
  @override // User ID
  final String survey;
  @override // Survey ID
  final List<UserSurveyAnswer> answers;
  @override
  final int iteration;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'UserSurveyResult(user: $user, survey: $survey, answers: $answers, iteration: $iteration, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserSurveyResult &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.survey, survey) ||
                const DeepCollectionEquality().equals(other.survey, survey)) &&
            (identical(other.answers, answers) ||
                const DeepCollectionEquality()
                    .equals(other.answers, answers)) &&
            (identical(other.iteration, iteration) ||
                const DeepCollectionEquality()
                    .equals(other.iteration, iteration)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(survey) ^
      const DeepCollectionEquality().hash(answers) ^
      const DeepCollectionEquality().hash(iteration) ^
      const DeepCollectionEquality().hash(createdAt);

  @JsonKey(ignore: true)
  @override
  _$UserSurveyResultCopyWith<_UserSurveyResult> get copyWith =>
      __$UserSurveyResultCopyWithImpl<_UserSurveyResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserSurveyResultToJson(this);
  }
}

abstract class _UserSurveyResult implements UserSurveyResult {
  const factory _UserSurveyResult(
      {required String user,
      required String survey,
      required List<UserSurveyAnswer> answers,
      required int iteration,
      DateTime? createdAt}) = _$_UserSurveyResult;

  factory _UserSurveyResult.fromJson(Map<String, dynamic> json) =
      _$_UserSurveyResult.fromJson;

  @override // required String id,
  String get user => throw _privateConstructorUsedError;
  @override // User ID
  String get survey => throw _privateConstructorUsedError;
  @override // Survey ID
  List<UserSurveyAnswer> get answers => throw _privateConstructorUsedError;
  @override
  int get iteration => throw _privateConstructorUsedError;
  @override
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserSurveyResultCopyWith<_UserSurveyResult> get copyWith =>
      throw _privateConstructorUsedError;
}
