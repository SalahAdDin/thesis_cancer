import 'package:flutter/material.dart';
import 'package:better_player/better_player.dart';

///
class CachedNetworkVideo extends StatefulWidget {
  ///
  const CachedNetworkVideo({
    Key? key,
    required this.dataSource,
    this.autoPlay = false,
    this.looping = false,
    this.enableControls = false,
    this.onFinished,
  }) : super(key: key);

  ///
  final String dataSource;

  ///
  final bool looping;

  ///
  final bool autoPlay;

  /// Set controls always visible (controls won't fade out, will be always over video).
  final bool enableControls;

  /// A [Function] to call once the video is finished.
  final Function? onFinished;

  @override
  _CachedNetworkVideoState createState() => _CachedNetworkVideoState();
}

class _CachedNetworkVideoState extends State<CachedNetworkVideo> {
  late BetterPlayerController _betterPlayerController;
  late BetterPlayerDataSource _betterPlayerDataSource;

  @override
  void initState() {
    const BetterPlayerControlsConfiguration betterPlayerControlsConfiguration =
        BetterPlayerControlsConfiguration(
      enableOverflowMenu: false,
      showControlsOnInitialize: false,
      backgroundColor: Colors.transparent,
    );
    final BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
      autoPlay: widget.autoPlay,
      looping: widget.looping,
      controlsConfiguration: betterPlayerControlsConfiguration,
      errorBuilder: (BuildContext context, String? errorMessage) {
        return Center(
          child: Text(
            errorMessage ?? "Oops!",
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );

    _betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.dataSource,
      cacheConfiguration: const BetterPlayerCacheConfiguration(
        useCache: true,
        preCacheSize: 10 * 1024 * 1024,

        ///Android only option to use cached video between app sessions
        key: "testCacheKey",
      ),
    );

    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration)
      ..setControlsEnabled(widget.enableControls);
    _betterPlayerController.setupDataSource(_betterPlayerDataSource);
    // ignore: cascade_invocations
    _betterPlayerController.addEventsListener((BetterPlayerEvent event) {
      if (event.betterPlayerEventType == BetterPlayerEventType.finished &&
          widget.onFinished != null) {
        widget.onFinished?.call();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: BetterPlayer(controller: _betterPlayerController),
    );
  }
}
