import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:thesis_cancer/core/presentation/hooks/use_chewie_controller.dart';
import 'package:video_player/video_player.dart';

/// Video Item
class VideoItem extends HookWidget {
  ///
  const VideoItem({
    Key? key,
    required this.videoPlayerController,
    this.autoPlay = false,
    this.looping = false,
  }) : super(key: key);

  ///
  final VideoPlayerController videoPlayerController;

  ///
  final bool looping;

  ///
  final bool autoPlay;

  @override
  Widget build(BuildContext context) {
    final ChewieController _chewieController = useChewieController(
        videoPlayerController: videoPlayerController,
        looping: looping,
        autoPlay: autoPlay);

    return Chewie(controller: _chewieController);
  }
}
