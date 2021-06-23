import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

///
final Provider<CacheManager> cacheManagerProvider = Provider<CacheManager>(
  (_) => DefaultCacheManager(),
  name: "Default Cache Manager Provider",
);

///
final FutureProviderFamily<VideoPlayerController, String>
    videoControllerProvider =
    FutureProvider.family<VideoPlayerController, String>(
        (ProviderReference ref, String url) async {
  final CacheManager _cacheManager = ref.read(cacheManagerProvider);

  final FileInfo? fileInfo = await _cacheManager.getFileFromCache(url);

  if (fileInfo == null) {
    print('[VideoControllerService]: No video in cache.');

    print('[VideoControllerService]: Saving video to cache.');
    _cacheManager.downloadFile(url);
    return VideoPlayerController.network(url);
  } else {
    print('[VideoControllerService]: Loading video from cache.');
    return VideoPlayerController.file(fileInfo.file);
  }
}, name: "Video Controller Provider");
