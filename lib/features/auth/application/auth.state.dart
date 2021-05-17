import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';

part 'auth.state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loading() = _Loading;

  const factory AuthState.signedUp(User signedUpUser) = _SignedUp;

  const factory AuthState.requestedResetPassword() = _RequestedResetPassword;

  const factory AuthState.loggedIn(User loggedInUser) = _LoggedIn;

  const factory AuthState.loggedOut() = _LoggedOut;

  const factory AuthState.error(String error) = _Error;

  const factory AuthState.requiresConfirmSignIn() = _RequiresConfirmSignIn;
}
