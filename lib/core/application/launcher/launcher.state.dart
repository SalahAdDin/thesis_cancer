import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';

part 'launcher.state.freezed.dart';

@freezed
abstract class LauncherState with _$LauncherState {
  const factory LauncherState.loading() = _Loading;

  const factory LauncherState.needsProfile() = _NeedsProfile;

  const factory LauncherState.profileLoaded(User user) = _ProfileLoaded;
}
