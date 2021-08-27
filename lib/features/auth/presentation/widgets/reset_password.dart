import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_field_validator/form_field_validator.dart';

///
typedef ConfirmSignInCallback = Future<dynamic>? Function(
    String, String, String);

///
class ResetPasswordWidget extends HookWidget {
  ///
  const ResetPasswordWidget({
    Key? key,
    required this.onConfirm,
  }) : super(key: key);

  ///
  final ConfirmSignInCallback onConfirm;
  // Future<bool> _submit(
  Future<void> _submit({
    required GlobalKey<FormState> formKey,
    required String password,
    required String passwordConfirmation,
    required String confirmationCode,
  }) async {
    final bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      // raise and error (snack bar way)
      // return false;
    } else {
      // TODO: Split this in two steps: onConfirm, onSubmit.
      // TODO: Handling errors(as flutter_login).
      onConfirm(password, passwordConfirmation, confirmationCode);
      // return true;
    }
  }

  /* TODO: Improve the style:
  * - Cover/Uncover password fields (with icons).
  * - Circular animation after pressing confirm button.
  * - Making fields rounder or bordered(?).
  * */

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey =
        useMemoized(() => GlobalKey<FormState>());
    final TextEditingController _newPasswordController =
        useTextEditingController();
    final TextEditingController _confirmNewPasswordController =
        useTextEditingController();
    final TextEditingController _confirmationCodePasswordController =
        useTextEditingController();

    /*
    final ThemeData theme = Theme.of(context);
    final Size deviceSize = MediaQuery.of(context).size;
    */

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 350),
              decoration: const BoxDecoration(
                  color: Colors.transparent,
                  boxShadow: <BoxShadow>[
                    BoxShadow(blurRadius: 4, offset: Offset(4, 8))
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      const Text(
                          "Please, provide a new password and confirm it:"),
                      TextFormField(
                        controller: _newPasswordController,
                        obscureText: true,
                        validator: MultiValidator(
                          <TextFieldValidator>[
                            RequiredValidator(
                                errorText: "Password is required"),
                            MinLengthValidator(
                              8,
                              errorText:
                                  "Password must be at least 8 digits long.",
                            ),
                            PatternValidator(
                              r'(?=.*?[_#?!@$%^&*-])',
                              errorText:
                                  "Password must have at least one special character.",
                            )
                          ],
                        ),
                        decoration: const InputDecoration(
                          icon: Icon(Icons.lock),
                          labelText: "New Password",
                        ),
                      ),
                      TextFormField(
                        controller: _confirmNewPasswordController,
                        obscureText: true,
                        validator: (String? value) => MatchValidator(
                          errorText: "Password did not match.",
                        ).validateMatch(
                          _newPasswordController.text,
                          _confirmNewPasswordController.text,
                        ),
                        decoration: const InputDecoration(
                          icon: Icon(Icons.lock),
                          labelText: "Password did not match.",
                        ),
                      ),
                      TextFormField(
                        controller: _confirmationCodePasswordController,
                        obscureText: true,
                        validator: MultiValidator(
                          <TextFieldValidator>[
                            RequiredValidator(
                              errorText: "Confirmation code is required",
                            ),
                            PatternValidator(
                              r'^[a-z0-9_]*$',
                              errorText: "Just alphanumeric characters.",
                            )
                          ],
                        ),
                        decoration: const InputDecoration(
                          icon: Icon(Icons.confirmation_number),
                          labelText: "Confirmation code",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: ElevatedButton(
                          onPressed: () => _submit(
                            formKey: _formKey,
                            password: _newPasswordController.text,
                            passwordConfirmation:
                                _confirmNewPasswordController.text,
                            confirmationCode:
                                _confirmationCodePasswordController.text,
                          ),
                          child: const Text("Confirm"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
