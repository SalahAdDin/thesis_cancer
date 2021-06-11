import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/features/content/application/post.notifier.dart';
import 'package:thesis_cancer/features/content/application/post.state.dart';
import 'package:thesis_cancer/features/content/domain/post/post.entity.dart';
import 'package:thesis_cancer/features/content/domain/post/post.repository.dart';
import 'package:thesis_cancer/features/content/infrastructure/post.repository.dart';

final StateProvider<Post> postEntityProvider = StateProvider<Post>(
  (ProviderReference ref) => Post.empty,
  name: "Post Entity Provider",
);

final StateProviderFamily<List<Post>, PostType> postListProvider =
    StateProvider.family<List<Post>, PostType>(
  (ProviderReference ref, PostType contentType) => <Post>[],
  name: "Post List by Content Type Provider",
);

final Provider<PostRepository> postRepositoryProvider =
    Provider<PostRepository>(
  (ProviderReference ref) => GraphQLPostRepository(reader: ref.read),
  name: "Post Repository Provider",
);

final StateNotifierProviderFamily<PostNotifier, PostsState, PostType>
    postsNotifierProvider =
    StateNotifierProvider.family<PostNotifier, PostsState, PostType>(
  (ProviderReference ref, PostType type) => PostNotifier(
    reader: ref.read,
    type: type,
  )..init(),
  name: "Posts List Notifier Provider",
);
