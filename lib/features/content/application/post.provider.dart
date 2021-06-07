import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/features/content/application/post.notifier.dart';
import 'package:thesis_cancer/features/content/application/post.state.dart';
import 'package:thesis_cancer/features/content/domain/post/post.entity.dart';
import 'package:thesis_cancer/features/content/domain/post/post.repository.dart';
import 'package:thesis_cancer/features/content/infrastructure/post.repository.dart';

final StateProvider<Post> postEntityProvider = StateProvider<Post>(
  (ref) => Post.empty,
  name: "Post Entity Provider",
);

final postListProvider = StateProvider.family<List<Post>, ContentType>(
  (ref, contentType) => [],
  name: "Post List by Content Type Provider",
);

final postRepositoryProvider = Provider<PostRepository>(
  (ref) => GraphQLPostRepository(reader: ref.read),
  name: "Post Repository Provider",
);

final postsNotifierProvider =
    StateNotifierProvider.family<PostNotifier, PostsState, ContentType>(
  (ref, type) => PostNotifier(
    reader: ref.read,
    type: type,
  )..init(),
  name: "Posts List Notifier Provider",
);
