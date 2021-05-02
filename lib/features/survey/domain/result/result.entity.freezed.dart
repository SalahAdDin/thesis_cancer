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
      {required String id,
      required String userID,
      required String surveyID,
      required List<UserSurveyAnswer>? answers,
      required int iteration}) {
    return _UserSurveyResult(
      id: id,
      userID: userID,
      surveyID: surveyID,
      answers: answers,
      iteration: iteration,
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
  String get id => throw _privateConstructorUsedError;
  String get userID => throw _privateConstructorUsedError;
  String get surveyID => throw _privateConstructorUsedError;
  List<UserSurveyAnswer>? get answers => throw _privateConstructorUsedError;
  int get iteration => throw _privateConstructorUsedError;

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
      {String id,
      String userID,
      String surveyID,
      List<UserSurveyAnswer>? answers,
      int iteration});
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
    Object? id = freezed,
    Object? userID = freezed,
    Object? surveyID = freezed,
    Object? answers = freezed,
    Object? iteration = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      surveyID: surveyID == freezed
          ? _value.surveyID
          : surveyID // ignore: cast_nullable_to_non_nullable
              as String,
      answers: answers == freezed
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<UserSurveyAnswer>?,
      iteration: iteration == freezed
          ? _value.iteration
          : iteration // ignore: cast_nullable_to_non_nullable
              as int,
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
      {String id,
      String userID,
      String surveyID,
      List<UserSurveyAnswer>? answers,
      int iteration});
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
    Object? id = freezed,
    Object? userID = freezed,
    Object? surveyID = freezed,
    Object? answers = freezed,
    Object? iteration = freezed,
  }) {
    return _then(_UserSurveyResult(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      surveyID: surveyID == freezed
          ? _value.surveyID
          : surveyID // ignore: cast_nullable_to_non_nullable
              as String,
      answers: answers == freezed
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<UserSurveyAnswer>?,
      iteration: iteration == freezed
          ? _value.iteration
          : iteration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserSurveyResult implements _UserSurveyResult {
  const _$_UserSurveyResult(
      {required this.id,
      required this.userID,
      required this.surveyID,
      required this.answers,
      required this.iteration});

  factory _$_UserSurveyResult.fromJson(Map<String, dynamic> json) =>
      _$_$_UserSurveyResultFromJson(json);

  @override
  final String id;
  @override
  final String userID;
  @override
  final String surveyID;
  @override
  final List<UserSurveyAnswer>? answers;
  @override
  final int iteration;

  @override
  String toString() {
    return 'UserSurveyResult(id: $id, userID: $userID, surveyID: $surveyID, answers: $answers, iteration: $iteration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserSurveyResult &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.userID, userID) ||
                const DeepCollectionEquality().equals(other.userID, userID)) &&
            (identical(other.surveyID, surveyID) ||
                const DeepCollectionEquality()
                    .equals(other.surveyID, surveyID)) &&
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
      const DeepCollectionEquality().hash(userID) ^
      const DeepCollectionEquality().hash(surveyID) ^
      const DeepCollectionEquality().hash(answers) ^
      const DeepCollectionEquality().hash(iteration);

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
      {required String id,
      required String userID,
      required String surveyID,
      required List<UserSurveyAnswer>? answers,
      required int iteration}) = _$_UserSurveyResult;

  factory _UserSurveyResult.fromJson(Map<String, dynamic> json) =
      _$_UserSurveyResult.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get userID => throw _privateConstructorUsedError;
  @override
  String get surveyID => throw _privateConstructorUsedError;
  @override
  List<UserSurveyAnswer>? get answers => throw _privateConstructorUsedError;
  @override
  int get iteration => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserSurveyResultCopyWith<_UserSurveyResult> get copyWith =>
      throw _privateConstructorUsedError;
}
