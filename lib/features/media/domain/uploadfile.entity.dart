import 'package:freezed_annotation/freezed_annotation.dart';

part 'uploadfile.entity.freezed.dart';
part 'uploadfile.entity.g.dart';

@freezed
class UploadFile with _$UploadFile {
  const factory UploadFile({
    required String id,
    required String url,
    String? description,
    String? postID,
    String? userID,
  }) = _UploadFile;

  factory UploadFile.fromJson(Map<String, dynamic> json) =>
      _$UploadFileFromJson(json);

  static const empty = UploadFile(id: '', url: '');
}
