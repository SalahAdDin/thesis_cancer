import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:thesis_cancer/core/presentation/widgets/cached_network_video.dart';

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
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        showDoneButton: _isVideoFinished.value,
        isProgress: false,
        onDone: onDone,
        showNextButton: false,
      ),
    );
  }
}
