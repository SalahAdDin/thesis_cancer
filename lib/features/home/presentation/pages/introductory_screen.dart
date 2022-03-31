import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/presentation/widgets/cached_network_video.dart';
import 'package:thesis_cancer/l10n/l10n.dart';

/// Introductory Screen
class IntroductoryScreen extends HookWidget {
  ///
  const IntroductoryScreen({
    Key? key,
    required this.onDone,
    required this.dataSource,
  }) : super(key: key);

  ///
  final String dataSource;

  ///
  final VoidCallback onDone;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> _isVideoFinished = useState(false);
    final FirebaseAnalytics _analytics = useProvider(firebaseAnalyticsProvider);

    Future<void> _setScreenAnalytics() async {
      await _analytics.setCurrentScreen(
        screenName: "Introductory Screen",
      );
    }

    useEffect(
      () {
        _setScreenAnalytics();

        return null;
      },
      const <Object>[],
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IntroductionScreen(
        pages: <PageViewModel>[
          PageViewModel(
            title: "",
            image: Center(
              child: CachedNetworkVideo(
                dataSource: dataSource,
                autoPlay: true,
                onFinished: () => _isVideoFinished.value = true,
              ),
            ),
            body: "",
            decoration: const PageDecoration(fullScreen: true),
          ),
        ],
        done: Text(
          context.l10n!.done,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        showDoneButton: _isVideoFinished.value,
        isProgress: false,
        onDone: onDone,
        showNextButton: false,
      ),
    );
  }
}
