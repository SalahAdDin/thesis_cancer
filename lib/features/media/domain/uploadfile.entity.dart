import 'package:freezed_annotation/freezed_annotation.dart';

part 'uploadfile.entity.freezed.dart';
part 'uploadfile.entity.g.dart';

/// [UploadFile] Entity for media content (files, videos, images, etc.).
@freezed
class UploadFile with _$UploadFile {
  ///
  const factory UploadFile({
    required String alternativeText,
    required String caption,
    required String url,
    int? width,
    int? height,
    String? mime,
  }) = _UploadFile;

  /// Builds a [UploadFile] from a given json [String].
  factory UploadFile.fromJson(Map<String, dynamic> json) =>
      _$UploadFileFromJson(json);

  /// Builds a empty(dummy) [UploadFile].
  static const UploadFile empty = UploadFile(
      alternativeText: 'Dummy alternative text.',
      caption: 'Dummy caption.',
      url: '',
      width: 150,
      height: 150);
}
