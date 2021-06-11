import 'package:freezed_annotation/freezed_annotation.dart';

part 'launcher.state.freezed.dart';

/// LauncherState
/// Holds the application's launcher state.
@freezed
class LauncherState with _$LauncherState {
  /// Application is loading.
  const factory LauncherState.loading() = _Loading;

  /// Application does not have a saved user, it needs log in.
  const factory LauncherState.needsProfile() = _NeedsProfile;

  /// Application does have a saved user, auto log in.
  const factory LauncherState.profileLoaded() = _ProfileLoaded;
}
