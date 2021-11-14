import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';

part 'auth.state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loading() = _Loading;

  const factory AuthState.signedUp() = _SignedUp;

  const factory AuthState.loggedIn() = _LoggedIn;

  const factory AuthState.error([Failure? error]) = _Error;
}
