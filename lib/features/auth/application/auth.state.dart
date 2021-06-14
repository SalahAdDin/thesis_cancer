import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loading() = _Loading;

  const factory AuthState.signedUp() = _SignedUp;

  const factory AuthState.loggedIn() = _LoggedIn;

  const factory AuthState.error(String error) = _Error;

  const factory AuthState.resetPassword() = _ResetPassword;
}
