import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_description.entity.freezed.dart';
part 'file_description.entity.g.dart';

/// [FileDescription] Entity for adding descriptors to media files.
@freezed
class FileDescription with _$FileDescription {
  ///
  const factory FileDescription({
    required String name,
    required String alternativeText,
    required String caption,
  }) = _FileDescription;

  /// Builds a [FileDescription] from a given json [String].
  factory FileDescription.fromJson(Map<String, Object?> json) =>
      _$FileDescriptionFromJson(json);

  /// Builds a empty(dummy) [FileDescription].
  static const FileDescription empty = FileDescription(
    name: "Dummy File Info",
    alternativeText: "Don't try this in home.",
    caption: "Dummy caption.",
  );
}
