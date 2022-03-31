enum FailureReason {
  unknown,
  unauthorized,
  notFound,
  unableToConnect,
  unableToParse,
}

enum SettingsFailureReason {
  unknown,
  unauthorized,
  notFound,
}

class Failure implements Exception {
  Failure({this.reason});

  final dynamic reason;

  @override
  String toString() {
    final Object? reason = this.reason;
    if (reason == null) return "Unexpected reason";

    return "$reason";
  }
}

class GraphQLFailure extends Failure {
  GraphQLFailure({required this.reason});

  @override
  final FailureReason reason;
}

class SettingsFailure extends Failure {
  SettingsFailure({required this.reason});

  @override
  final SettingsFailureReason reason;
}
