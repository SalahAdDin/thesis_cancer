import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

typedef ConfirmSignInCallback = Future<dynamic?>? Function(String);

class ConfirmPasswordWidget extends StatefulWidget {
  ConfirmPasswordWidget({Key? key, required this.onConfirm}) : super(key: key);

  final ConfirmSignInCallback onConfirm;

  @override
  _ConfirmPasswordWidgetState createState() => _ConfirmPasswordWidgetState();
}

class _ConfirmPasswordWidgetState extends State<ConfirmPasswordWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final String confirmationCode;

  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Password is required'),
    MinLengthValidator(8, errorText: 'Password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[_#?!@$%^&*-])',
        errorText: 'Passwords must have at least one special character')
  ]);

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  Future<bool> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return false;
    } else {
      setState(() {
        this.confirmationCode = _newPasswordController.text;
      });
      // TODO: Split this in two steps: onConfirm, onSubmit.
      // TODO: Handling errors(as flutter_login).
      widget.onConfirm(this.confirmationCode);
      return true;
    }
  }

  // TODO: Make this responsive to fit on dashboard.
  /* TODO: Improve the style:
  * - Cover/Uncover password fields (with icons).
  * - Circular animation after pressing confirm button.
  * - Making fields rounder or bordered(?).
  * */

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: (Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
              alignment: Alignment.center,
              child: Container(
                  constraints: BoxConstraints(maxWidth: 350),
                  decoration: const BoxDecoration(
                      color: Colors.transparent,
                      boxShadow: [
                        BoxShadow(blurRadius: 4, offset: Offset(4, 8))
                      ],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                              "Please, provide a new password and confirm it:"),
                          TextFormField(
                            controller: _newPasswordController,
                            obscureText: true,
                            validator: passwordValidator,
                            decoration: const InputDecoration(
                                icon: Icon(Icons.lock),
                                labelText: 'New Password'),
                          ),
                          TextFormField(
                            controller: _confirmNewPasswordController,
                            obscureText: true,
                            validator: (value) => MatchValidator(
                                    errorText: "Your password does not match\.")
                                .validateMatch(_newPasswordController.text,
                                    _confirmNewPasswordController.text),
                            decoration: const InputDecoration(
                                icon: Icon(Icons.lock),
                                labelText: 'Confirm New Password'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: ElevatedButton(
                              child: Text("Confirm"),
                              onPressed: _submit,
                            ),
                          )
                        ],
                      ),
                    ),
                  )))
        ],
      )),
    );
  }
}
