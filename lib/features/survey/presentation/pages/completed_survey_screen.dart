import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thesis_cancer/core/presentation/widgets/button.dart';

///
class CompletedSurveyScreen extends StatelessWidget {
  ///
  const CompletedSurveyScreen({
    Key? key,
    required this.onPressed,
    required this.actionLabel,
  }) : super(key: key);

  /// Function to execute after finishing the survey.
  final VoidCallback onPressed;

  ///
  final String actionLabel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.all(24),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Teşekkür ederiz',
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                      'Anketimize verdiğiniz yanıtları aldık, bu anketi doldururken ayırdığınız zaman için teşekkür ederiz.',
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Button.primary(
                      buttonLabel: actionLabel,
                      onPressed: onPressed,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
