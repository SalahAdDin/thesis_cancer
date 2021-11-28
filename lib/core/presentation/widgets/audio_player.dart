import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart' as ja;
import 'package:rxdart/rxdart.dart';
import 'package:thesis_cancer/core/presentation/widgets/seek_bar.dart';

class AudioPlayer extends StatefulWidget {
  const AudioPlayer({Key? key, required this.dataSource}) : super(key: key);

  final String dataSource;

  @override
  _AudioPlayerState createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayer> with WidgetsBindingObserver {
  final ja.AudioPlayer _audioPlayer = ja.AudioPlayer();

  late ja.LockCachingAudioSource _audioSource;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
      ),
    );
    _init();
  }

  Future<void> _init() async {
    _audioSource = ja.LockCachingAudioSource(Uri.parse(widget.dataSource));
    final AudioSession session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    _audioPlayer.playbackEventStream.listen(
      (ja.PlaybackEvent event) {},
      onError: (Object e, StackTrace stackTrace) {
        print('A stream error occurred: $e');
      },
    );
    try {
      //await _audioSource.clearCache();
      await _audioPlayer.setAudioSource(_audioSource);
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    // Release decoders and buffers back to the operating system making them
    // available for other apps to use.
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Release the player's resources when not in use. We use "stop" so that
      // if the app resumes later, it will still remember what position to
      // resume from.
      _audioPlayer.stop();
    }
  }

  /// Collects the data useful for displaying in a seek bar, using a handy
  /// feature of rx_dart to combine the 3 streams of interest into one.
  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, double, Duration?, PositionData>(
          _audioPlayer.positionStream,
          _audioSource.downloadProgressStream,
          _audioPlayer.durationStream, (
        Duration position,
        double downloadProgress,
        Duration? reportedDuration,
      ) {
        final Duration duration = reportedDuration ?? Duration.zero;
        final Duration bufferedPosition = duration * downloadProgress;
        return PositionData(position, bufferedPosition, duration);
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Display seek bar. Using StreamBuilder, this widget rebuilds
        // each time the position, buffered position or duration changes.
        StreamBuilder<PositionData>(
          stream: _positionDataStream,
          builder:
              (BuildContext context, AsyncSnapshot<PositionData> snapshot) {
            final PositionData? positionData = snapshot.data;
            return SeekBar(
              duration: positionData?.duration ?? Duration.zero,
              position: positionData?.position ?? Duration.zero,
              bufferedPosition: positionData?.bufferedPosition ?? Duration.zero,
              onChangeEnd: _audioPlayer.seek,
            );
          },
        ),
        // Display play/pause button and volume/speed sliders.
        ControlButtons(
          player: _audioPlayer,
        ),
        /*
        ElevatedButton(
          onPressed: _audioSource.clearCache,
          child: const Text('Clear cache'),
        ),
        */
      ],
    );
  }
}

class ControlButtons extends StatelessWidget {
  ///
  const ControlButtons({required this.player});

  ///
  final ja.AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Opens volume slider dialog
        IconButton(
          icon: const Icon(Icons.volume_up),
          onPressed: () {
            showSliderDialog(
              context: context,
              title: "Adjust volume",
              divisions: 10,
              min: 0.0,
              max: 1.0,
              value: player.volume,
              stream: player.volumeStream,
              onChanged: player.setVolume,
            );
          },
        ),

        /// This StreamBuilder rebuilds whenever the player state changes, which
        /// includes the playing/paused state and also the
        /// loading/buffering/ready state. Depending on the state we show the
        /// appropriate button or loading indicator.
        StreamBuilder<ja.PlayerState>(
          stream: player.playerStateStream,
          builder:
              (BuildContext context, AsyncSnapshot<ja.PlayerState> snapshot) {
            final ja.PlayerState? playerState = snapshot.data;
            final ja.ProcessingState? processingState =
                playerState?.processingState;
            final bool? playing = playerState?.playing;
            if (processingState == ja.ProcessingState.loading ||
                processingState == ja.ProcessingState.buffering) {
              return Container(
                margin: const EdgeInsets.all(8.0),
                width: 64.0,
                height: 64.0,
                child: const CircularProgressIndicator(),
              );
            } else if (playing != true) {
              return IconButton(
                icon: const Icon(Icons.play_arrow),
                iconSize: 64.0,
                onPressed: player.play,
              );
            } else if (processingState != ja.ProcessingState.completed) {
              return IconButton(
                icon: const Icon(Icons.pause),
                iconSize: 64.0,
                onPressed: player.pause,
              );
            } else {
              return IconButton(
                icon: const Icon(Icons.replay),
                iconSize: 64.0,
                onPressed: () => player.seek(Duration.zero),
              );
            }
          },
        ),
        // Opens speed slider dialog
        StreamBuilder<double>(
          stream: player.speedStream,
          builder: (BuildContext context, AsyncSnapshot<double> snapshot) =>
              IconButton(
            icon: Text(
              "${snapshot.data?.toStringAsFixed(1)}x",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              showSliderDialog(
                context: context,
                title: "Adjust speed",
                divisions: 10,
                min: 0.5,
                max: 1.5,
                value: player.speed,
                stream: player.speedStream,
                onChanged: player.setSpeed,
              );
            },
          ),
        ),
      ],
    );
  }
}
