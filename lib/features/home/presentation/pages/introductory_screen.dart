import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/core/presentation/widgets/video_item.dart';
import 'package:video_player/video_player.dart';

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
  final OnPressedButton onDone;

  @override
  Widget build(BuildContext context) {
    final VideoPlayerController _videoPlayerController =
        VideoPlayerController.network(dataSource);
    final ValueNotifier<bool> _isVideoFinished = useState(false);

    useEffect(() {
      void checkIsFinished() {
        _isVideoFinished.value = _videoPlayerController.value.isInitialized &&
            _videoPlayerController.value.position ==
                _videoPlayerController.value.duration;
      }

      _videoPlayerController.addListener(checkIsFinished);
      return () {
        _videoPlayerController.removeListener(checkIsFinished);
      };
    }, <VideoPlayerController>[_videoPlayerController]);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IntroductionScreen(
        pages: <PageViewModel>[
          PageViewModel(
            title: "",
            image: VideoItem(
              videoPlayerController: _videoPlayerController,
              autoPlay: true,
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
