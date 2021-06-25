import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/presentation/hooks/use_chewie_controller.dart';
import 'package:thesis_cancer/features/media/application/uploadfile.provider.dart';
import 'package:video_player/video_player.dart';

/// Video Item
class VideoItem extends HookWidget {
  ///
  const VideoItem({
    Key? key,
    required this.videoPlayerController,
    this.autoPlay = false,
    this.looping = false,
    this.showControls = false,
  }) : super(key: key);

  ///
  final VideoPlayerController videoPlayerController;

  ///
  final bool looping;

  ///
  final bool autoPlay;

  ///
  final bool showControls;

  @override
  Widget build(BuildContext context) {
    final ChewieController _chewieController = useChewieController(
      videoPlayerController: videoPlayerController,
      looping: looping,
      autoPlay: autoPlay,
      showControls: showControls,
      errorBuilder: (BuildContext context, String errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );

    return Chewie(controller: _chewieController);
  }
}

///
class CachedNetworkVideo extends HookWidget {
  ///
  const CachedNetworkVideo({
    Key? key,
    required this.dataSource,
    this.autoPlay = false,
    this.looping = false,
    this.showControls = false,
    this.onFinished,
  }) : super(key: key);

  ///
  final String dataSource;

  ///
  final bool looping;

  ///
  final bool autoPlay;

  ///
  final bool showControls;

  ///
  final Function? onFinished;

  @override
  Widget build(BuildContext context) {
    final AsyncValue<VideoPlayerController> videoPlayerController =
        useProvider(videoControllerProvider(dataSource));

    return videoPlayerController.when(
      data: (VideoPlayerController videoPlayerController) {
        useEffect(() {
          void checkIsFinished() {
            if (videoPlayerController.value.isInitialized &&
                videoPlayerController.value.position ==
                    videoPlayerController.value.duration) {
              onFinished!();
            }
          }

          videoPlayerController.addListener(checkIsFinished);
          return () {
            videoPlayerController.removeListener(checkIsFinished);
          };
        }, <VideoPlayerController>[videoPlayerController]);
        return VideoItem(
          videoPlayerController: videoPlayerController,
          autoPlay: autoPlay,
          looping: looping,
          showControls: showControls,
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (Object err, StackTrace? stack) => const Icon(Icons.error),
    );
  }
}
