import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/core/presentation/widgets/button.dart';
import 'package:thesis_cancer/l10n/l10n.dart';

///
class LobbyScreen extends HookWidget {
  ///
  const LobbyScreen({this.mode = LobbyMode.NEW});

  ///
  final LobbyMode mode;

  // TODO: Improve style
  @override
  Widget build(BuildContext context) {
    final FirebaseAnalytics _analytics = useProvider(firebaseAnalyticsProvider);

    Future<void> _setScreenAnalytics() async {
      await _analytics.setCurrentScreen(
        screenName: "Lobby Screen",
      );
    }

    useEffect(
      () {
        _setScreenAnalytics();
        return null;
      },
      const <Object>[],
    );

    List<String> _getParagraphsText() {
      switch (mode) {
        case LobbyMode.NEW:
          return <String>[
            context.l10n!.lobbyParagraphOne,
            context.l10n!.lobbyParagraphTwo,
            context.l10n!.lobbyParagraphThree
          ];
        case LobbyMode.CONTROL:
          return <String>[
            context.l10n!.lobbyParagraphControlOne,
            context.l10n!.lobbyParagraphControlTwo,
            context.l10n!.lobbyParagraphControlThree
          ];
      }
    }

    final List<String> literals = _getParagraphsText();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // TODO: Add the logo here.
            Align(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 70, horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      context.l10n!.lobbyTitle,
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                        literals[0],
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // TODO: TextButton(link) to Why do I have to wait?
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                        literals[1],
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                        literals[2],
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // TODO: Workaround, this should be done by a socket event.
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Button.primary(
                        buttonLabel: context.l10n!.back,
                        // TODO: It does not work at the user's registering
                        onPressed: () {
                          context.read(launcherProvider.notifier).signOut();
                          Navigator.of(context).maybePop();
                        },
                      ),
                    ),
                    // TODO: TextButton(link) to cancel my application as footer.
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
