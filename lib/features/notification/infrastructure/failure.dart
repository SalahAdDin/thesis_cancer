import 'package:thesis_cancer/core/infrastructure/failure.dart';

///
enum ActivityFeedFailureReason {
  unknown,
  unauthorized,
  notFound,

  ///
  unexpectedResult,
}

///
class ActivityFeedFailure extends Failure {
  ///
  ActivityFeedFailure({required this.reason});

  @override
  final ActivityFeedFailureReason reason;
}
