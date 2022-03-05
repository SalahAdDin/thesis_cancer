import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/features/media/domain/uploadfile.repository.dart';
import 'package:thesis_cancer/features/media/infrastructure/uploadfile.repository.dart';

///
final Provider<UploadFileRepository> uploadFileRepositoryProvider =
    Provider<UploadFileRepository>(
  (ProviderReference ref) => GraphQLFileRepository(reader: ref.read),
  name: "Upload File Repository Provider",
);

///
final Provider<CacheManager> cacheManagerProvider = Provider<CacheManager>(
  (_) => DefaultCacheManager(),
  name: "Default Cache Manager Provider",
);
