import 'dart:io';

import "package:http/http.dart";
import 'package:thesis_cancer/features/media/domain/file_description.entity.dart';
import 'package:thesis_cancer/features/media/domain/uploadfile.entity.dart';

/// [UploadFile] Repository Interface
abstract class UploadFileRepository {
  ///
  Future<List<UploadFile>> findAll();

  ///
  Future<List<UploadFile>> findByUserId(String id);

  ///
  Future<List<UploadFile>> findByPostId(String id);

  ///
  Future<UploadFile> findById(String id);

  ///
  Future<UploadFile> uploadFile({
    required FileDescription fileInfo,
    required MultipartFile file,
  });

  ///
  Future<List<UploadFile>> multiUploadFile(List<File> files);

  ///
  Future<void> removeFile(String fileId);

  ///
  Future<UploadFile> updateFile(UploadFile file);
}
