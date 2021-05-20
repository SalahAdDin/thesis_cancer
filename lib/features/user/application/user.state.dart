import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.loading() = _Loading;

  const factory UserState.isAdmin() = _IsAdmin;

  const factory UserState.unConfirmed() = _UnConfirmed;

  const factory UserState.mustSeeIntroduction() = _MustSeeIntroduction;

  const factory UserState.mustSeeTutorial() = _MustSeeTutorial;

  const factory UserState.completed() = _Completed;

  const factory UserState.error(String error) = _Error;
}
