enum NextStep {
  CONFIRM_SIGN_IN_WITH_NEW_PASSWORD,
}

class AmplifyResult {
  bool isSuccess;
  String nextStep;

  AmplifyResult({required this.isSuccess, required this.nextStep});
}
