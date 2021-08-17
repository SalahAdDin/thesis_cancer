import 'package:thesis_cancer/core/infrastructure/failure.dart';

enum ProfileFailureReason {
  unknown,
  unauthorized,
  notFound,
  notValidProfile,
}

enum UserFailureReason {
  unknown,
  unauthorized,
  notFound,
}

class ProfileFailure extends Failure {
  ProfileFailure({required this.reason});

  @override
  final ProfileFailureReason reason;
}

class UserFailure extends Failure {
  UserFailure({required this.reason});

  @override
  final UserFailureReason reason;
}
