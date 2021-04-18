enum NextStep {
  CONFIRM_SIGN_IN_WITH_NEW_PASSWORD,
  CONFIRMED,
  UNCONFIRMED,
}

class AmplifyResult {
  bool isSuccess;
  String nextStep;

  AmplifyResult({required this.isSuccess, required this.nextStep});
}
