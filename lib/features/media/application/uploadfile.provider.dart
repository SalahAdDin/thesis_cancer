import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

///
final Provider<CacheManager> cacheManagerProvider = Provider<CacheManager>(
  (_) => DefaultCacheManager(),
  name: "Default Cache Manager Provider",
);
