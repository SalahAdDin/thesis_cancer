import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.state.freezed.dart';

///
@freezed
class ProfileState with _$ProfileState {
  ///
  const factory ProfileState.loading() = _Loading;

  ///
  const factory ProfileState.error([String? error]) = _Error;

  ///
  const factory ProfileState.editing() = _Editing;

  ///
  const factory ProfileState.data() = _Data;
}
