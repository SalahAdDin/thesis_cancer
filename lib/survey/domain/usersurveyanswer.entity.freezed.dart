// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'usersurveyanswer.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserSurveyAnswer _$UserSurveyAnswerFromJson(Map<String, dynamic> json) {
  return _UserSurveyAnswer.fromJson(json);
}

/// @nodoc
class _$UserSurveyAnswerTearOff {
  const _$UserSurveyAnswerTearOff();

  _UserSurveyAnswer call(
      {required String id,
      required String userId,
      required String surveyId,
      required Map<String, dynamic> answers,
      required int iteration}) {
    return _UserSurveyAnswer(
      id: id,
      userId: userId,
      surveyId: surveyId,
      answers: answers,
      iteration: iteration,
    );
  }

  UserSurveyAnswer fromJson(Map<String, Object> json) {
    return UserSurveyAnswer.fromJson(json);
  }
}

/// @nodoc
const $UserSurveyAnswer = _$UserSurveyAnswerTearOff();

/// @nodoc
mixin _$UserSurveyAnswer {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get surveyId => throw _privateConstructorUsedError;
  Map<String, dynamic> get answers => throw _privateConstructorUsedError;
  int get iteration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSurveyAnswerCopyWith<UserSurveyAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSurveyAnswerCopyWith<$Res> {
  factory $UserSurveyAnswerCopyWith(
          UserSurveyAnswer value, $Res Function(UserSurveyAnswer) then) =
      _$UserSurveyAnswerCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String userId,
      String surveyId,
      Map<String, dynamic> answers,
      int iteration});
}

/// @nodoc
class _$UserSurveyAnswerCopyWithImpl<$Res>
    implements $UserSurveyAnswerCopyWith<$Res> {
  _$UserSurveyAnswerCopyWithImpl(this._value, this._then);

  final UserSurveyAnswer _value;
  // ignore: unused_field
  final $Res Function(UserSurveyAnswer) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? surveyId = freezed,
    Object? answers = freezed,
    Object? iteration = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      surveyId: surveyId == freezed
          ? _value.surveyId
          : surveyId // ignore: cast_nullable_to_non_nullable
              as String,
      answers: answers == freezed
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      iteration: iteration == freezed
          ? _value.iteration
          : iteration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$UserSurveyAnswerCopyWith<$Res>
    implements $UserSurveyAnswerCopyWith<$Res> {
  factory _$UserSurveyAnswerCopyWith(
          _UserSurveyAnswer value, $Res Function(_UserSurveyAnswer) then) =
      __$UserSurveyAnswerCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String userId,
      String surveyId,
      Map<String, dynamic> answers,
      int iteration});
}

/// @nodoc
class __$UserSurveyAnswerCopyWithImpl<$Res>
    extends _$UserSurveyAnswerCopyWithImpl<$Res>
    implements _$UserSurveyAnswerCopyWith<$Res> {
  __$UserSurveyAnswerCopyWithImpl(
      _UserSurveyAnswer _value, $Res Function(_UserSurveyAnswer) _then)
      : super(_value, (v) => _then(v as _UserSurveyAnswer));

  @override
  _UserSurveyAnswer get _value => super._value as _UserSurveyAnswer;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? surveyId = freezed,
    Object? answers = freezed,
    Object? iteration = freezed,
  }) {
    return _then(_UserSurveyAnswer(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      surveyId: surveyId == freezed
          ? _value.surveyId
          : surveyId // ignore: cast_nullable_to_non_nullable
              as String,
      answers: answers == freezed
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      iteration: iteration == freezed
          ? _value.iteration
          : iteration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_UserSurveyAnswer implements _UserSurveyAnswer {
  const _$_UserSurveyAnswer(
      {required this.id,
      required this.userId,
      required this.surveyId,
      required this.answers,
      required this.iteration});

  factory _$_UserSurveyAnswer.fromJson(Map<String, dynamic> json) =>
      _$_$_UserSurveyAnswerFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String surveyId;
  @override
  final Map<String, dynamic> answers;
  @override
  final int iteration;

  @override
  String toString() {
    return 'UserSurveyAnswer(id: $id, userId: $userId, surveyId: $surveyId, answers: $answers, iteration: $iteration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserSurveyAnswer &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.surveyId, surveyId) ||
                const DeepCollectionEquality()
                    .equals(other.surveyId, surveyId)) &&
            (identical(other.answers, answers) ||
                const DeepCollectionEquality()
                    .equals(other.answers, answers)) &&
            (identical(other.iteration, iteration) ||
                const DeepCollectionEquality()
                    .equals(other.iteration, iteration)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(surveyId) ^
      const DeepCollectionEquality().hash(answers) ^
      const DeepCollectionEquality().hash(iteration);

  @JsonKey(ignore: true)
  @override
  _$UserSurveyAnswerCopyWith<_UserSurveyAnswer> get copyWith =>
      __$UserSurveyAnswerCopyWithImpl<_UserSurveyAnswer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserSurveyAnswerToJson(this);
  }
}

abstract class _UserSurveyAnswer implements UserSurveyAnswer {
  const factory _UserSurveyAnswer(
      {required String id,
      required String userId,
      required String surveyId,
      required Map<String, dynamic> answers,
      required int iteration}) = _$_UserSurveyAnswer;

  factory _UserSurveyAnswer.fromJson(Map<String, dynamic> json) =
      _$_UserSurveyAnswer.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get userId => throw _privateConstructorUsedError;
  @override
  String get surveyId => throw _privateConstructorUsedError;
  @override
  Map<String, dynamic> get answers => throw _privateConstructorUsedError;
  @override
  int get iteration => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserSurveyAnswerCopyWith<_UserSurveyAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}
