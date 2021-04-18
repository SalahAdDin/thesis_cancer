import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';

part 'splash.state.freezed.dart';

@freezed
abstract class SplashScreenState with _$SplashScreenState {
  const factory SplashScreenState.loading() = _Loading;

  const factory SplashScreenState.needsProfile() = _NeedsProfile;

  const factory SplashScreenState.profileLoaded(User user) = _ProfileLoaded;
}
