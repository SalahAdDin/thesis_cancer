import 'package:thesis_cancer/media/domain/uploadfile.entity.dart';

abstract class UploadFileRepository {
  Future<List<UploadFile>> findAll();
  Future<List<UploadFile>> findByUserId(String id);
  Future<List<UploadFile>> findByPostId(String id);
  Future<UploadFile> findById(String id);
  Future<UploadFile> uploadFile(UploadFile file);
  Future<void> removeFile(UploadFile file);
  Future<UploadFile> updateFile(UploadFile file);
}
