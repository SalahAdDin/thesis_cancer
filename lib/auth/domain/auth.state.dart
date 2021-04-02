import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thesis_cancer/user/domain/user.entity.dart';

part 'auth.state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.loading() = _Loading;

  const factory AuthState.signedUp(User signedUpUser) = _SignedUp;

  const factory AuthState.requestedResetPassword() = _RequestedResetPassword;

  const factory AuthState.loggedIn(User loggedInUser) = _LoggedIn;

  const factory AuthState.error(String error) = _Error;
}
