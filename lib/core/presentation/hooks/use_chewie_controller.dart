import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

/// Creates a [ChewieController], initializes it and disposes it when the widget is dispose.
/// Basically emulates a [StatefulWidget] behavior on [Chewie] regard.
ChewieController useChewieController({
  required VideoPlayerController videoPlayerController,
  bool looping = false,
  bool autoPlay = false,
  bool showControls = false,
  Widget Function(BuildContext context, String errorMessage)? errorBuilder,
}) {
  final ChewieController controller = ChewieController(
    videoPlayerController: videoPlayerController,
    aspectRatio: 5 / 8,
    autoInitialize: true,
    autoPlay: autoPlay,
    looping: looping,
    showControls: showControls,
    errorBuilder: errorBuilder,
  );
  useEffect(() {
    return controller.dispose;
  }, <ChewieController>[controller]);

  return controller;
}