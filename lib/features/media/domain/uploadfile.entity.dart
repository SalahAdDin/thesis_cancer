import 'package:freezed_annotation/freezed_annotation.dart';

part 'uploadfile.entity.freezed.dart';
part 'uploadfile.entity.g.dart';

@freezed
class UploadFile with _$UploadFile {
  const factory UploadFile(
      {required String alternativeText,
      required String caption,
      required String url,
      int? width,
      int? height}) = _UploadFile;

  factory UploadFile.fromJson(Map<String, dynamic> json) =>
      _$UploadFileFromJson(json);

  static const empty = UploadFile(
      alternativeText: 'Dummy alternative text.',
      caption: 'Dummy caption.',
      url: '',
      width: 150,
      height: 150);
}
