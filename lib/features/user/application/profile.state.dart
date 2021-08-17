import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';

part 'profile.state.freezed.dart';

///
@freezed
class ProfileState with _$ProfileState {
  ///
  const factory ProfileState.loading() = _Loading;

  ///
  const factory ProfileState.error([Failure? error]) = _Error;

  ///
  const factory ProfileState.editing() = _Editing;

  ///
  const factory ProfileState.data() = _Data;
}
