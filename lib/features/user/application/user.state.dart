import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';

part 'user.state.freezed.dart';

/// User's state.
@freezed
class UserState with _$UserState {
  ///
  const factory UserState.loading() = _Loading;

  /// [User] is admin, so it can user the application in administration mode.
  const factory UserState.isAdmin() = _IsAdmin;

  /// [User] is not confirmed by the admin yet.
  const factory UserState.unConfirmed() = _UnConfirmed;

  /// [User] didn't see the introductory video yet.
  const factory UserState.mustSeeIntroduction() = _MustSeeIntroduction;

  /// [User] didn't see the tutorial yet.
  const factory UserState.mustSeeTutorial() = _MustSeeTutorial;

  /// [User] is confirmed, has seen introductory video and tutorial.
  const factory UserState.completed() = _Completed;

  ///
  const factory UserState.error([Failure? error]) = _Error;
}
