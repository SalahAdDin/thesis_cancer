import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/features/media/domain/uploadfile.entity.dart';

part 'introvideo.entity.freezed.dart';
part 'introvideo.entity.g.dart';

/// Introductory Video Entity
@freezed
class IntroductoryVideo with _$IntroductoryVideo {
  /// Default builder
  const factory IntroductoryVideo({
    required RoleOptions role,
    required UploadFile video,
  }) = _IntroductoryVideo;

  /// Builds a [IntroductoryVideo] from a given json [String].
  factory IntroductoryVideo.fromJson(Map<String, dynamic> json) =>
      _$IntroductoryVideoFromJson(json);
}
