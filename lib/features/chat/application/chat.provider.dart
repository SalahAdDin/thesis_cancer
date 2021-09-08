import 'package:flutter_chat_types/flutter_chat_types.dart' as fc_types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/features/chat/application/chat.notifier.dart';
import 'package:thesis_cancer/features/chat/domain/chat.repository.dart';
import 'package:thesis_cancer/features/chat/infrastructure/chat.repository.dart';

/// Provides a [FireBaseChatRepository] repository.
final Provider<ChatRepository> chatRepositoryProvider =
    Provider<ChatRepository>(
  (ProviderReference ref) => FireBaseChatRepository(
    reader: ref.read,
  ),
  name: "Firebase Chat Repository Provider",
);

/// Provides a [Stream] with all [fc_types.Room] related to the session [User].
final AutoDisposeStreamProvider<List<fc_types.Room>> roomsListProvider =
    StreamProvider.autoDispose<List<fc_types.Room>>(
  (_) => FirebaseChatCore.instance.rooms(),
  name: "List Rooms Provider",
);

/// Provides a [Stream] with [fc_types.Room] room given a [String] room ID.
final AutoDisposeStreamProviderFamily<fc_types.Room, String> roomProvider =
    StreamProvider.autoDispose.family<fc_types.Room, String>(
  (AutoDisposeProviderReference ref, String roomId) {
    final ChatRepository _chatRepository = ref.read(chatRepositoryProvider);
    return _chatRepository.findRoomById(
      roomId: roomId,
    );
  },
  name: "Room Provider",
);

/// Provides a controller for a [fc_types.Room] given room
/// with a [bool] upload state.
final AutoDisposeStateNotifierProviderFamily<ChatNotifier, bool, fc_types.Room>
    chatNotifierProvider =
    StateNotifierProvider.autoDispose.family<ChatNotifier, bool, fc_types.Room>(
  (AutoDisposeProviderReference ref, fc_types.Room room) => ChatNotifier(
    reader: ref.read,
    currentRoom: room,
  ),
  name: "Chat Notifier Provider",
);

/// Provide a [Stream] with the [fc_types.Message] from a given [fc_types.Room].
final AutoDisposeStreamProviderFamily<List<fc_types.Message>, fc_types.Room>
    messagesByRoomProvider =
    StreamProvider.autoDispose.family<List<fc_types.Message>, fc_types.Room>(
  (_, fc_types.Room room) => FirebaseChatCore.instance.messages(
    room,
  ),
  name: "Messages by Room Provider",
);
