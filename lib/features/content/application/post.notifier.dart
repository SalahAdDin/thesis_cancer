import 'dart:io';

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
import 'package:thesis_cancer/features/media/application/uploadfile.provider.dart';
import 'package:thesis_cancer/features/media/domain/uploadfile.entity.dart';
import 'package:thesis_cancer/features/media/domain/uploadfile.repository.dart';
import 'package:thesis_cancer/features/media/infrastructure/failure.dart';

/// Post Notifier
/// It handles a list of Posts filtered by content type(one per screen)
/// and all its posts' related functions.
///
class PostNotifier extends StateNotifier<PostsState> {
  /// Default
  PostNotifier({
    required this.reader,
    required this.container,
    required this.type,
  }) : super(const PostsState.loading());

  /// [Reader] provider reader.
  final Reader reader;

  final ProviderContainer container;

  /// [PostType] type the post will fetched by.
  final PostType type;

  final String _collectionTypeName = "posts";

  final String _filesFieldName = "gallery";

  PostRepository get _postRepository => reader(postRepositoryProvider);

  UploadFileRepository get _uploadFileRepository =>
      reader(uploadFileRepositoryProvider);

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

  Future<void> updatePost({
    required Post post,
    required List<File> files,
  }) async {
    try {
      final Post updatedPost = await _postRepository.updatePost(post);
      // TODO: remove files
      final List<UploadFile> updatedFiles =
          await _uploadFileRepository.multiUploadFile(
        refId: post.id!,
        ref: _collectionTypeName,
        field: _filesFieldName,
        files: files,
      );
      /* TODO: why not replace `postListProvider`
          state by replacing the item there?
          It would avoid un-required API calls.
      */
      container.refresh(postListProvider(type));
    } on PostFailure catch (error) {
      state = PostsState.error(error);
    } on FileFailure catch (error) {
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
