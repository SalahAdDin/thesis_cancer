// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'schedules.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SurveySchedule _$SurveyScheduleFromJson(Map<String, dynamic> json) {
  return _SurveySchedule.fromJson(json);
}

/// @nodoc
class _$SurveyScheduleTearOff {
  const _$SurveyScheduleTearOff();

  _SurveySchedule call(
      {required int iterations,
      required int step,
      required String survey,
      required String label}) {
    return _SurveySchedule(
      iterations: iterations,
      step: step,
      survey: survey,
      label: label,
    );
  }

  SurveySchedule fromJson(Map<String, Object> json) {
    return SurveySchedule.fromJson(json);
  }
}

/// @nodoc
const $SurveySchedule = _$SurveyScheduleTearOff();

/// @nodoc
mixin _$SurveySchedule {
  int get iterations => throw _privateConstructorUsedError;

  /// Amount of weeks between each iteration.
  int get step => throw _privateConstructorUsedError;
  String get survey => throw _privateConstructorUsedError; // Survey ID
  String get label => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurveyScheduleCopyWith<SurveySchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyScheduleCopyWith<$Res> {
  factory $SurveyScheduleCopyWith(
          SurveySchedule value, $Res Function(SurveySchedule) then) =
      _$SurveyScheduleCopyWithImpl<$Res>;
  $Res call({int iterations, int step, String survey, String label});
}

/// @nodoc
class _$SurveyScheduleCopyWithImpl<$Res>
    implements $SurveyScheduleCopyWith<$Res> {
  _$SurveyScheduleCopyWithImpl(this._value, this._then);

  final SurveySchedule _value;
  // ignore: unused_field
  final $Res Function(SurveySchedule) _then;

  @override
  $Res call({
    Object? iterations = freezed,
    Object? step = freezed,
    Object? survey = freezed,
    Object? label = freezed,
  }) {
    return _then(_value.copyWith(
      iterations: iterations == freezed
          ? _value.iterations
          : iterations // ignore: cast_nullable_to_non_nullable
              as int,
      step: step == freezed
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      survey: survey == freezed
          ? _value.survey
          : survey // ignore: cast_nullable_to_non_nullable
              as String,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SurveyScheduleCopyWith<$Res>
    implements $SurveyScheduleCopyWith<$Res> {
  factory _$SurveyScheduleCopyWith(
          _SurveySchedule value, $Res Function(_SurveySchedule) then) =
      __$SurveyScheduleCopyWithImpl<$Res>;
  @override
  $Res call({int iterations, int step, String survey, String label});
}

/// @nodoc
class __$SurveyScheduleCopyWithImpl<$Res>
    extends _$SurveyScheduleCopyWithImpl<$Res>
    implements _$SurveyScheduleCopyWith<$Res> {
  __$SurveyScheduleCopyWithImpl(
      _SurveySchedule _value, $Res Function(_SurveySchedule) _then)
      : super(_value, (v) => _then(v as _SurveySchedule));

  @override
  _SurveySchedule get _value => super._value as _SurveySchedule;

  @override
  $Res call({
    Object? iterations = freezed,
    Object? step = freezed,
    Object? survey = freezed,
    Object? label = freezed,
  }) {
    return _then(_SurveySchedule(
      iterations: iterations == freezed
          ? _value.iterations
          : iterations // ignore: cast_nullable_to_non_nullable
              as int,
      step: step == freezed
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      survey: survey == freezed
          ? _value.survey
          : survey // ignore: cast_nullable_to_non_nullable
              as String,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SurveySchedule implements _SurveySchedule {
  const _$_SurveySchedule(
      {required this.iterations,
      required this.step,
      required this.survey,
      required this.label});

  factory _$_SurveySchedule.fromJson(Map<String, dynamic> json) =>
      _$_$_SurveyScheduleFromJson(json);

  @override
  final int iterations;
  @override

  /// Amount of weeks between each iteration.
  final int step;
  @override
  final String survey;
  @override // Survey ID
  final String label;

  @override
  String toString() {
    return 'SurveySchedule(iterations: $iterations, step: $step, survey: $survey, label: $label)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SurveySchedule &&
            (identical(other.iterations, iterations) ||
                const DeepCollectionEquality()
                    .equals(other.iterations, iterations)) &&
            (identical(other.step, step) ||
                const DeepCollectionEquality().equals(other.step, step)) &&
            (identical(other.survey, survey) ||
                const DeepCollectionEquality().equals(other.survey, survey)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(iterations) ^
      const DeepCollectionEquality().hash(step) ^
      const DeepCollectionEquality().hash(survey) ^
      const DeepCollectionEquality().hash(label);

  @JsonKey(ignore: true)
  @override
  _$SurveyScheduleCopyWith<_SurveySchedule> get copyWith =>
      __$SurveyScheduleCopyWithImpl<_SurveySchedule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SurveyScheduleToJson(this);
  }
}

abstract class _SurveySchedule implements SurveySchedule {
  const factory _SurveySchedule(
      {required int iterations,
      required int step,
      required String survey,
      required String label}) = _$_SurveySchedule;

  factory _SurveySchedule.fromJson(Map<String, dynamic> json) =
      _$_SurveySchedule.fromJson;

  @override
  int get iterations => throw _privateConstructorUsedError;
  @override

  /// Amount of weeks between each iteration.
  int get step => throw _privateConstructorUsedError;
  @override
  String get survey => throw _privateConstructorUsedError;
  @override // Survey ID
  String get label => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SurveyScheduleCopyWith<_SurveySchedule> get copyWith =>
      throw _privateConstructorUsedError;
}
