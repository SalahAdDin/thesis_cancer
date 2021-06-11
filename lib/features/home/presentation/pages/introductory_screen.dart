import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/core/presentation/widgets/video_item.dart';
import 'package:video_player/video_player.dart';

class IntroductoryScreen extends StatelessWidget {
  const IntroductoryScreen({
    Key? key,
    required this.onDone,
    required this.dataSource,
  }) : super(key: key);

  final String dataSource;
  final OnPressedButton onDone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IntroductionScreen(
        pages: <PageViewModel>[
          PageViewModel(
            title: "",
            image: VideoItem(
              videoPlayerController: VideoPlayerController.network(dataSource),
              autoplay: true,
            ),
            body: "",
            decoration: const PageDecoration(fullScreen: true),
          ),
        ],
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        onDone: onDone,
        showNextButton: false,
      ),
    );
  }
}
