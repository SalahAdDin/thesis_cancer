import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as fc_types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:open_file/open_file.dart';
import 'package:thesis_cancer/features/chat/application/chat.provider.dart';
import 'package:thesis_cancer/features/chat/domain/chat.repository.dart';
import 'package:thesis_cancer/features/media/application/uploadfile.provider.dart';

/// Chat Notifier
class ChatNotifier extends StateNotifier<bool> {
  ///
  ChatNotifier({
    required this.reader,
    required this.currentRoom,
  }) : super(false);

  ///
  final Reader reader;

  ///
  final fc_types.Room currentRoom;

  FirebaseChatCore get _chatCore => FirebaseChatCore.instance;

  FirebaseStorage get _storage => FirebaseStorage.instance;

  ChatRepository get _chatRepository => reader(chatRepositoryProvider);

  CacheManager get _cacheManager => reader(cacheManagerProvider);

  ///
  fb.User? get currentUser => _chatCore.firebaseUser;

  ///
  Stream<fc_types.Room> getRoomInstance({
    required String roomId,
  }) async* {
    final Stream<fc_types.Room> room = _chatRepository.findRoomById(
      roomId: roomId,
    ) as Stream<fc_types.Room>;
    await for (final fc_types.Room value in room) {
      yield value;
    }
  }

  ///
  Future<void> handleMessageTap(fc_types.Message message) async {
    if (message is fc_types.FileMessage) {
      String localPath = message.uri;
      if (message.uri.startsWith('http')) {
        final FileInfo? fileInfo = await _cacheManager.getFileFromCache(
          message.uri,
        );

        if (fileInfo == null) {
          final FileInfo downloadedFile = await _cacheManager.downloadFile(
            message.uri,
          );
          localPath = downloadedFile.file.path;
        } else {
          localPath = fileInfo.file.path;
        }
      }
      await OpenFile.open(localPath);
    }
  }

  ///
  void handlePreviewDataFetched(
    fc_types.TextMessage message,
    fc_types.PreviewData previewData,
  ) {
    final fc_types.Message updateMessage = message.copyWith(
      previewData: previewData,
    );
    _chatCore.updateMessage(updateMessage, currentRoom.id);
  }

  ///
  void handleSendPressed(fc_types.PartialText message) => _chatCore.sendMessage(
        message,
        currentRoom.id,
      );

  ///
  Future<void> showFilePicker() async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        state = true;
        final String name = result.files.single.name;
        final String? filePath = result.files.single.path;
        final File file = File(filePath ?? '');

        try {
          final Reference reference = _storage.ref(name);
          await reference.putFile(file);
          final String uri = await reference.getDownloadURL();

          final fc_types.PartialFile message = fc_types.PartialFile(
            mimeType: lookupMimeType(filePath ?? ''),
            name: name,
            size: result.files.single.size,
            uri: uri,
          );

          _chatCore.sendMessage(message, currentRoom.id);
          state = false;
        } on FirebaseException catch (error) {
          state = false;
          print("[File Picker] Error: $error");
        }
      } else {
        // User canceled the picker
      }
    } on Error catch (error) {}
  }

  ///
  Future<void> showImagePicker() async {
    final PickedFile? result = await ImagePicker().getImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      state = false;
      final File file = File(result.path);
      final int size = file.lengthSync();
      final Uint8List bytes = await result.readAsBytes();
      final Image image = await decodeImageFromList(bytes);
      final String name = result.path.split('/').last;

      try {
        final Reference reference = _storage.ref(name);
        await reference.putFile(file);
        final String uri = await reference.getDownloadURL();

        final fc_types.PartialImage message = fc_types.PartialImage(
          height: image.height.toDouble(),
          name: name,
          size: size,
          uri: uri,
          width: image.width.toDouble(),
        );

        _chatCore.sendMessage(
          message,
          currentRoom.id,
        );
        state = false;
      } on FirebaseException catch (error) {
        state = false;
        print("[Image Picker] Error: $error");
      }
    } else {
      // User canceled the picker
    }
  }

  ///
  fc_types.User getInterlocutor() {
    final fc_types.User interlocutor = currentRoom.users.firstWhere(
      (fc_types.User user) => user.id != currentUser?.uid,
    );
    return interlocutor;
  }
}
