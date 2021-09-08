import 'package:flutter_chat_types/flutter_chat_types.dart' as fc_types;
import 'package:thesis_cancer/features/user/domain/profile.entity.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';

/// Interface for ChatRepository
abstract class ChatRepository {
  ///
  dynamic get currentUser => null;

  /// Transpile a [User] to a compatible Chat Service's user and registers it.
  Future<void> registerUser(Profile targetUser);

  ///
  Future<fc_types.Room> createRoom({required Profile profile});

  /// Returns the chat [Room] associated to a [User].
  /// It finds the [Room] by its id, if the [Room] does not exist,
  /// it is created and returned.
  Future<fc_types.Room> getRoomByUser({
    required fc_types.User otherUser,
  });

  ///
  Stream<fc_types.Room> findRoomById({
    required String roomId,
  });

  ///
  fc_types.User getInterlocutor({required fc_types.Room room});

  ///
  void sendMessage({
    required fc_types.PartialText message,
    required String roomId,
  });

  ///
  void previewDataFetched({
    required fc_types.TextMessage message,
    required fc_types.PreviewData previewData,
    required String roomId,
  });
}
