import 'package:freezed_annotation/freezed_annotation.dart';

part 'launcher.state.freezed.dart';

@freezed
class LauncherState with _$LauncherState {
  const factory LauncherState.loading() = _Loading;

  const factory LauncherState.needsProfile() = _NeedsProfile;

  const factory LauncherState.profileLoaded() = _ProfileLoaded;
}
