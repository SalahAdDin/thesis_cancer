import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';

///
class AboutUsScreen extends HookWidget {
  ///
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAnalytics _analytics = useProvider(firebaseAnalyticsProvider);

    Future<void> _setScreenAnalytics() async {
      await _analytics.setCurrentScreen(
        screenName: "About Us Screen",
      );
    }

    useEffect(
      () {
        _setScreenAnalytics();
        return null;
      },
      const <Object>[],
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        children: <Widget>[
          Text(
            AppLocalizations.of(context)!.aboutUsParagraphOne,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              AppLocalizations.of(context)!.aboutUsParagraphTwo,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Text(
                AppLocalizations.of(context)!.aboutUsAuthor,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          MarkdownBody(
            data: AppLocalizations.of(context)!.aboutUsParagraphThree,
          ),
        ],
      ),
    );
  }
}
