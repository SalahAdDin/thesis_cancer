import 'package:thesis_cancer/core/infrastructure/failure.dart';

enum ResultFailureReason {
  unknown,
  unauthorized,
  notFound,

  ///
  unexpectedResult,
}

enum SurveyFailureReason {
  unknown,
  unauthorized,
  notFound,

  ///
  unexpectedResult,
}

class ResultFailure extends Failure {
  ResultFailure({required this.reason});

  @override
  final ResultFailureReason reason;
}

class SurveyFailure extends Failure {
  SurveyFailure({required this.reason});

  @override
  final SurveyFailureReason reason;
}
