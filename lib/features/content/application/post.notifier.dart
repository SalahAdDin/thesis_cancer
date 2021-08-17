import 'package:hooks_riverpod/hooks_riverpod.dart';

// import 'package:thesis_cancer/core/application/global.provider.dart';
// import 'package:thesis_cancer/core/domain/datastore.repository.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';
import 'package:thesis_cancer/features/content/application/post.provider.dart';
import 'package:thesis_cancer/features/content/application/post.state.dart';
import 'package:thesis_cancer/features/content/domain/post/post.entity.dart';
import 'package:thesis_cancer/features/content/domain/post/post.repository.dart';
import 'package:thesis_cancer/features/content/infrastructure/failure.dart';

/// Post Notifier
/// It handles a list of Posts filtered by content type(one per screen)
/// and all its posts' related functions.
///
class PostNotifier extends StateNotifier<PostsState> {
  /// Default
  PostNotifier({
    required this.reader,
    required this.type,
  }) : super(const PostsState.loading());

  /// [Reader] provider reader.
  final Reader reader;

  /// [PostType] type the post will fetched by.
  final PostType type;

  PostRepository get _postRepository => reader(postRepositoryProvider);

  /// TODO: cache fetched posts.
  /// DataStoreRepository get _dataStore => reader(dataStoreRepositoryProvider);

  StateController<List<Post>> get _postListController =>
      reader(postListProvider(type).notifier);

  ///
  Future<void> fetchPostsByType() async {
    try {
      final List<Post> result = await _postRepository.findByContentType(type);
      _postListController.state = result;
      state = const PostsState.data();
    } on PostFailure catch (error) {
      state = PostsState.error(error);
    } on GraphQLFailure catch (error) {
      state = PostsState.error(error);
    }
  }

  /// Function to initialize post at calling the provider
  Future<void> init() async {
    await fetchPostsByType();
  }
}
