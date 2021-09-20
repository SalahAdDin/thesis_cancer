import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/presentation/widgets/button.dart';

class LobbyScreen extends HookWidget {
  // TODO: Improve style
  @override
  Widget build(BuildContext context) {
    final FirebaseAnalytics _analytics = useProvider(firebaseAnalyticsProvider);

    Future<void> _setScreenAnalytics() async {
      await _analytics.setCurrentScreen(
        screenName: "Lobby Screen",
      );
    }

    useEffect(() {
      _setScreenAnalytics();
    }, const <Object>[]);
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
                    const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context)!.lobbyTitle,
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                        AppLocalizations.of(context)!.lobbyParagraphOne,
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
                        AppLocalizations.of(context)!.lobbyParagraphTwo,
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
                        AppLocalizations.of(context)!.lobbyParagraphThree,
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
                        buttonLabel: AppLocalizations.of(context)!.back,
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
