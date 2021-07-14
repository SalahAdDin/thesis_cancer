import 'dart:io';

import 'package:colorize/colorize.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import "package:http/http.dart";
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/features/media/domain/file_description.entity.dart';
import 'package:thesis_cancer/features/media/domain/uploadfile.entity.dart';
import 'package:thesis_cancer/features/media/domain/uploadfile.repository.dart';
import 'package:thesis_cancer/features/media/infrastructure/failure.dart';
import 'package:thesis_cancer/features/media/infrastructure/upload_file.gql.dart';

/// **GraphQL** implementation for [UploadFileRepository] interface
class GraphQLFileRepository implements UploadFileRepository {
  /// Default constructor, it requires a [Provider] reference [Reader].
  GraphQLFileRepository({required this.reader}) : super();

  /// Provider reference [Reader].
  final Reader reader;

  GraphQLClient get _client => reader(graphQLClientProvider);

  @override
  Future<List<UploadFile>> findAll() {
    // TODO: implement findAll
    throw UnimplementedError();
  }

  @override
  Future<UploadFile> findById(String id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<List<UploadFile>> findByPostId(String id) {
    // TODO: implement findByPostId
    throw UnimplementedError();
  }

  @override
  Future<List<UploadFile>> findByUserId(String id) {
    // TODO: implement findByUserId
    throw UnimplementedError();
  }

  @override
  Future<List<UploadFile>> multiUploadFile(List<File> files) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentMultiUploadFile),
        variables: <String, dynamic>{
          "files": files,
        },
      );
      final QueryResult response = await _client.query(options);
      if (response.hasException) {
        print(Colorize(response.exception.toString()).red());
        throw FileFailure();
      }

      final List<Map<String, dynamic>> data =
          response.data?['multipleUpload'] as List<Map<String, dynamic>>;

      final List<UploadFile> result = data
          .map((Map<String, dynamic> item) => UploadFile.fromJson(item))
          .toList();

      return result;
    } on Exception catch (error) {
      throw FileFailure();
    }
  }

  @override
  Future<void> removeFile(String fileId) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentDeleteFile),
        variables: <String, dynamic>{"fileId": fileId},
      );
      final QueryResult response = await _client.query(options);
      if (response.hasException) {
        print(Colorize(response.exception.toString()).red());
        throw FileFailure();
      }
      final Map<String, dynamic> data =
          response.data?['deleteFile']['file'] as Map<String, dynamic>;
      final UploadFile deletedFile = UploadFile.fromJson(data);
      if (deletedFile.id != fileId) {
        throw FileFailure();
      }
    } on Exception catch (error) {
      throw FileFailure();
    }
  }

  @override
  Future<UploadFile> updateFile(UploadFile file) {
    // TODO: implement updateFile
    throw UnimplementedError();
  }

  @override
  Future<UploadFile> uploadFile({
    required FileDescription fileInfo,
    required MultipartFile file,
  }) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentUploadFile),
        variables: <String, dynamic>{
          "file": file,
          "info": fileInfo,
        },
      );
      final QueryResult response = await _client.query(options);
      if (response.hasException) {
        print(Colorize(response.exception.toString()).red());
        throw FileFailure();
      }

      final Map<String, dynamic> data =
          response.data?['upload'] as Map<String, dynamic>;

      return UploadFile.fromJson(data);
    } on Exception catch (error) {
      throw FileFailure();
    }
  }
}
