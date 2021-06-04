import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.state.freezed.dart';

@freezed
class PostsState with _$PostsState {
  const factory PostsState.loading() = _Loading;

  const factory PostsState.error([String? message]) = _Error;

  const factory PostsState.data() = _Data;
}
