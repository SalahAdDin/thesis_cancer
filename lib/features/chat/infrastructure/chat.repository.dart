import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter_chat_types/flutter_chat_types.dart' as fc_types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/features/chat/domain/chat.repository.dart';
import 'package:thesis_cancer/features/user/domain/profile.entity.dart';

/// [Firebase] based backend repository  for [ChatRepository].
/// This follows the [related documentation](https://docs.flyer.chat/flutter/firebase/firebase-overview)
/// from [Flyer Chat](https://docs.flyer.chat/flutter/chat-ui/).
class FireBaseChatRepository implements ChatRepository {
  ///
  FireBaseChatRepository({required this.reader});

  /// Provider reference [Reader].
  final Reader reader;

  FirebaseChatCore get _chatCore => FirebaseChatCore.instance;

  ///
  @override
  fb.User? get currentUser => _chatCore.firebaseUser;

  @override
  Future<void> registerUser(Profile targetUser) async =>
      _chatCore.createUserInFirestore(
        fc_types.User(
          id: targetUser.uid!,
          firstName: targetUser.firstName,
          lastName: targetUser.lastName,
          imageUrl: targetUser.profilePhoto?.url,
          role: targetUser.role == UserRole.ADMIN
              ? fc_types.Role.admin
              : fc_types.Role.user,
        ),
      );

  // TODO: Add to flyer documentation:
  //  It checks whether actually there is a room for both users and returns it
  //  or creates a new room in other case.

  @override
  Future<fc_types.Room> getRoomByUser({
    required fc_types.User otherUser,
  }) async =>
      _chatCore.createRoom(otherUser);

  @override
  void sendMessage({
    required fc_types.PartialText message,
    required String roomId,
  }) =>
      _chatCore.sendMessage(message, roomId);

  @override
  void previewDataFetched({
    required fc_types.TextMessage message,
    required fc_types.PreviewData previewData,
    required String roomId,
  }) {
    final fc_types.Message updatedMessage =
        message.copyWith(previewData: previewData);

    _chatCore.updateMessage(updatedMessage, roomId);
  }

  @override
  Stream<fc_types.Room> findRoomById({required String roomId}) =>
      _chatCore.room(roomId);

  @override
  fc_types.User getInterlocutor({required fc_types.Room room}) =>
      room.users.firstWhere(
        (fc_types.User user) => user.id != currentUser?.uid,
      );
}
