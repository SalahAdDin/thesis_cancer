enum NextStep {
  CONFIRM_SIGN_IN_WITH_NEW_PASSWORD,
  CONFIRM_SIGN_UP_STEP,
  CONFIRMED,
  UNCONFIRMED,
}

class AmplifyResult {
  bool isSuccess;
  String nextStep;

  AmplifyResult({required this.isSuccess, required this.nextStep});
}
