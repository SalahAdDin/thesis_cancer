// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'answer.entity.dart';

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
      required String userSurveyResultId,
      required String questionId,
      required String answer}) {
    return _UserSurveyAnswer(
      id: id,
      userSurveyResultId: userSurveyResultId,
      questionId: questionId,
      answer: answer,
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
  String get userSurveyResultId => throw _privateConstructorUsedError;
  String get questionId => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;

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
      {String id, String userSurveyResultId, String questionId, String answer});
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
    Object? userSurveyResultId = freezed,
    Object? questionId = freezed,
    Object? answer = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userSurveyResultId: userSurveyResultId == freezed
          ? _value.userSurveyResultId
          : userSurveyResultId // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: questionId == freezed
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
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
      {String id, String userSurveyResultId, String questionId, String answer});
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
    Object? userSurveyResultId = freezed,
    Object? questionId = freezed,
    Object? answer = freezed,
  }) {
    return _then(_UserSurveyAnswer(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userSurveyResultId: userSurveyResultId == freezed
          ? _value.userSurveyResultId
          : userSurveyResultId // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: questionId == freezed
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserSurveyAnswer implements _UserSurveyAnswer {
  const _$_UserSurveyAnswer(
      {required this.id,
      required this.userSurveyResultId,
      required this.questionId,
      required this.answer});

  factory _$_UserSurveyAnswer.fromJson(Map<String, dynamic> json) =>
      _$_$_UserSurveyAnswerFromJson(json);

  @override
  final String id;
  @override
  final String userSurveyResultId;
  @override
  final String questionId;
  @override
  final String answer;

  @override
  String toString() {
    return 'UserSurveyAnswer(id: $id, userSurveyResultId: $userSurveyResultId, questionId: $questionId, answer: $answer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserSurveyAnswer &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.userSurveyResultId, userSurveyResultId) ||
                const DeepCollectionEquality()
                    .equals(other.userSurveyResultId, userSurveyResultId)) &&
            (identical(other.questionId, questionId) ||
                const DeepCollectionEquality()
                    .equals(other.questionId, questionId)) &&
            (identical(other.answer, answer) ||
                const DeepCollectionEquality().equals(other.answer, answer)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(userSurveyResultId) ^
      const DeepCollectionEquality().hash(questionId) ^
      const DeepCollectionEquality().hash(answer);

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
      required String userSurveyResultId,
      required String questionId,
      required String answer}) = _$_UserSurveyAnswer;

  factory _UserSurveyAnswer.fromJson(Map<String, dynamic> json) =
      _$_UserSurveyAnswer.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get userSurveyResultId => throw _privateConstructorUsedError;
  @override
  String get questionId => throw _privateConstructorUsedError;
  @override
  String get answer => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserSurveyAnswerCopyWith<_UserSurveyAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}
