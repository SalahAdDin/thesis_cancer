import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/presentation/widgets/button.dart';

///
class CompletedSurveyScreen extends HookWidget {
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
    final FirebaseAnalytics _analytics = useProvider(firebaseAnalyticsProvider);

    Future<void> _setScreenAnalytics() async {
      await _analytics.setCurrentScreen(
        screenName: "Completed Survey Screen",
      );
    }

    useEffect(
      () {
        _setScreenAnalytics();
      },
      const <Object>[],
    );

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
                    AppLocalizations.of(context)!.completedSurveyTitle,
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                      AppLocalizations.of(context)!.completedSurveyParagraph,
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
