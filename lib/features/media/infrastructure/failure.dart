import 'package:thesis_cancer/core/infrastructure/failure.dart';

enum FileFailureReason {
  unknown,
  unauthorized,
  notFound,
  unexpectedResult,
}

///
class FileFailure extends Failure {
  ///
  FileFailure({required this.reason});

  @override
  final FileFailureReason reason;
}
