import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/domain/datastore.repository.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';
import 'package:thesis_cancer/features/content/application/post.provider.dart';
import 'package:thesis_cancer/features/content/application/post.state.dart';
import 'package:thesis_cancer/features/content/domain/post/post.entity.dart';
import 'package:thesis_cancer/features/content/domain/post/post.repository.dart';

/* Post Notifier
* It handles a list of Posts filtered by content type(one per screen)
* and all its posts' related functions.
* */
class PostNotifier extends StateNotifier<PostsState> {
  PostNotifier({
    required this.reader,
    required this.type,
  }) : super(const PostsState.loading());

  final Reader reader;
  final PostType type;

  PostRepository get postRepository => reader(postRepositoryProvider);

  DataStoreRepository get dataStore => reader(dataStoreRepositoryProvider);

  StateController<List<Post>> get postListController =>
      reader(postListProvider(type).notifier);

  Future<void> fetchPosts() async {
    try {
      final List<Post> result = await postRepository.findByContentType(type);
      postListController.state = result;
      state = const PostsState.data();
    } on GraphQLFailure catch (error) {
      state = PostsState.error(error.toString());
    }
  }

  Future<void> init() async {
    await fetchPosts();
  }
}
