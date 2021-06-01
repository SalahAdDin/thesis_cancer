// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'survey.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Survey _$SurveyFromJson(Map<String, dynamic> json) {
  return _Survey.fromJson(json);
}

/// @nodoc
class _$SurveyTearOff {
  const _$SurveyTearOff();

  _Survey call(
      {required String id,
      required String title,
      DateTime? createdAt,
      String? intro,
      List<Question>? questions}) {
    return _Survey(
      id: id,
      title: title,
      createdAt: createdAt,
      intro: intro,
      questions: questions,
    );
  }

  Survey fromJson(Map<String, Object> json) {
    return Survey.fromJson(json);
  }
}

/// @nodoc
const $Survey = _$SurveyTearOff();

/// @nodoc
mixin _$Survey {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String? get intro => throw _privateConstructorUsedError;
  List<Question>? get questions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurveyCopyWith<Survey> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyCopyWith<$Res> {
  factory $SurveyCopyWith(Survey value, $Res Function(Survey) then) =
      _$SurveyCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String title,
      DateTime? createdAt,
      String? intro,
      List<Question>? questions});
}

/// @nodoc
class _$SurveyCopyWithImpl<$Res> implements $SurveyCopyWith<$Res> {
  _$SurveyCopyWithImpl(this._value, this._then);

  final Survey _value;
  // ignore: unused_field
  final $Res Function(Survey) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? createdAt = freezed,
    Object? intro = freezed,
    Object? questions = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      intro: intro == freezed
          ? _value.intro
          : intro // ignore: cast_nullable_to_non_nullable
              as String?,
      questions: questions == freezed
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>?,
    ));
  }
}

/// @nodoc
abstract class _$SurveyCopyWith<$Res> implements $SurveyCopyWith<$Res> {
  factory _$SurveyCopyWith(_Survey value, $Res Function(_Survey) then) =
      __$SurveyCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      DateTime? createdAt,
      String? intro,
      List<Question>? questions});
}

/// @nodoc
class __$SurveyCopyWithImpl<$Res> extends _$SurveyCopyWithImpl<$Res>
    implements _$SurveyCopyWith<$Res> {
  __$SurveyCopyWithImpl(_Survey _value, $Res Function(_Survey) _then)
      : super(_value, (v) => _then(v as _Survey));

  @override
  _Survey get _value => super._value as _Survey;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? createdAt = freezed,
    Object? intro = freezed,
    Object? questions = freezed,
  }) {
    return _then(_Survey(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      intro: intro == freezed
          ? _value.intro
          : intro // ignore: cast_nullable_to_non_nullable
              as String?,
      questions: questions == freezed
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Survey implements _Survey {
  const _$_Survey(
      {required this.id,
      required this.title,
      this.createdAt,
      this.intro,
      this.questions});

  factory _$_Survey.fromJson(Map<String, dynamic> json) =>
      _$_$_SurveyFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final DateTime? createdAt;
  @override
  final String? intro;
  @override
  final List<Question>? questions;

  @override
  String toString() {
    return 'Survey(id: $id, title: $title, createdAt: $createdAt, intro: $intro, questions: $questions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Survey &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.intro, intro) ||
                const DeepCollectionEquality().equals(other.intro, intro)) &&
            (identical(other.questions, questions) ||
                const DeepCollectionEquality()
                    .equals(other.questions, questions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(intro) ^
      const DeepCollectionEquality().hash(questions);

  @JsonKey(ignore: true)
  @override
  _$SurveyCopyWith<_Survey> get copyWith =>
      __$SurveyCopyWithImpl<_Survey>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SurveyToJson(this);
  }
}

abstract class _Survey implements Survey {
  const factory _Survey(
      {required String id,
      required String title,
      DateTime? createdAt,
      String? intro,
      List<Question>? questions}) = _$_Survey;

  factory _Survey.fromJson(Map<String, dynamic> json) = _$_Survey.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  String? get intro => throw _privateConstructorUsedError;
  @override
  List<Question>? get questions => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SurveyCopyWith<_Survey> get copyWith => throw _privateConstructorUsedError;
}
