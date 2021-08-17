import 'package:thesis_cancer/core/infrastructure/failure.dart';

enum PostFailureReason {
  unknown,
  unauthorized,
  notFound,

  ///
  unexpectedResult,
}

class PostFailure extends Failure {
  PostFailure({required this.reason});

  @override
  final PostFailureReason reason;
}
