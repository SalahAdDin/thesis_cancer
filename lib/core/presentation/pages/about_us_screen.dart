import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/l10n/l10n.dart';

///
class AboutUsScreen extends HookConsumerWidget {
  ///
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FirebaseAnalytics _analytics = ref.watch(firebaseAnalyticsProvider);

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
            context.l10n!.aboutUsParagraphOne,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              context.l10n!.aboutUsParagraphTwo,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Text(
                context.l10n!.aboutUsAuthor,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          MarkdownBody(
            data: context.l10n!.aboutUsParagraphThree,
          ),
        ],
      ),
    );
  }
}
