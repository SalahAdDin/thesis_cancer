import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';

part 'post.state.freezed.dart';

@freezed
class PostsState with _$PostsState {
  const factory PostsState.loading() = _Loading;

  const factory PostsState.error([Failure? error]) = _Error;

  const factory PostsState.data() = _Data;
}
