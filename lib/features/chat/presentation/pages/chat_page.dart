import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as fc_types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/application/navigator.dart';
import 'package:thesis_cancer/core/presentation/widgets/header.dart';
import 'package:thesis_cancer/core/presentation/widgets/user_avatar.dart';
import 'package:thesis_cancer/features/chat/application/chat.notifier.dart';
import 'package:thesis_cancer/features/chat/application/chat.provider.dart';
import 'package:thesis_cancer/features/chat/domain/chat.repository.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';
import 'package:thesis_cancer/features/user/domain/user.repository.dart';
import 'package:thesis_cancer/features/user/presentation/pages/profile_screen.dart';

/// Chat Page
class ChatPage extends HookWidget {
  ///
  const ChatPage({
    Key? key,
    required this.room,
  }) : super(key: key);

  ///
  final fc_types.Room room;

  @override
  Widget build(BuildContext context) {
    final DefaultChatTheme chatTheme = DefaultChatTheme(
      primaryColor: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
    final ChatRepository _chatRepository = useProvider(chatRepositoryProvider);
    final AsyncValue<fc_types.Room> currentRoom =
        useProvider(roomProvider(room.id));
    final fc_types.User interlocutor =
        _chatRepository.getInterlocutor(room: room);
    final UserRepository _userRepository = useProvider(userRepositoryProvider);

    final FirebaseAnalytics _analytics = useProvider(firebaseAnalyticsProvider);

    Future<void> _setScreenAnalytics() async {
      await _analytics.setCurrentScreen(
        screenName:
            "Chat Screen: ${room.users.first.id} - ${room.users.last.id}",
      );
    }

    useEffect(
      () {
        _setScreenAnalytics();
        return null;
      },
      const <Object>[],
    );

    Future<User> interlocutorUser() async {
      try {
        final List<User>? fetchedUsers =
            await _userRepository.findUserWithQuery(
          query: <String, dynamic>{
            "profile": <String, dynamic>{"uid": interlocutor.id}
          },
        );
        if (fetchedUsers != null && fetchedUsers.isNotEmpty) {
          return fetchedUsers[0];
        } else {
          return User.empty;
        }
      } on Exception catch (_) {
        throw Exception();
      }
    }

    return Scaffold(
      appBar: Header(
        title: GestureDetector(
          onTap: () async {
            final NavigatorState navigator = Navigator.of(context);
            final User user = await interlocutorUser();
            pushToPage(navigator, ProfileScreen(user: user));
          },
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            horizontalTitleGap: 0,
            leading: UserAvatar(userAvatarUrl: interlocutor.imageUrl),
            title: Text(
              "${interlocutor.firstName} ${interlocutor.lastName}",
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ),
        ),
      ),
      body: currentRoom.when(
        data: (fc_types.Room room) {
          final AsyncValue<List<fc_types.Message>> messages =
              useProvider(messagesByRoomProvider(room));
          final bool _isAttachmentUploading =
              useProvider(chatNotifierProvider(room));
          final ChatNotifier chatNotifier =
              useProvider(chatNotifierProvider(room).notifier);

          void _handleAttachmentPressed() {
            showModalBottomSheet<void>(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          Icons.expand_more_outlined,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          chatNotifier.showFilePicker();
                        },
                        icon: const Icon(
                          Icons.attach_file_outlined,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          chatNotifier.showImagePicker();
                        },
                        icon: const Icon(
                          Icons.insert_photo_outlined,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }

          return messages.when(
            data: (List<fc_types.Message> messages) => Chat(
              isAttachmentUploading: _isAttachmentUploading,
              messages: messages,
              showUserAvatars: true,
              onAttachmentPressed: _handleAttachmentPressed,
              onMessageTap: chatNotifier.handleMessageTap,
              onPreviewDataFetched: chatNotifier.handlePreviewDataFetched,
              onSendPressed: chatNotifier.handleSendPressed,
              user: fc_types.User(
                id: chatNotifier.currentUser?.uid ?? '',
              ),
              theme: chatTheme,
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            // TODO: Error screen with refresh as callback
            error: (Object error, StackTrace? stack) => Center(
              child: Text(error.toString()),
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        // TODO: Error screen with refresh as callback
        error: (Object error, StackTrace? stack) => Center(
          child: Text(error.toString()),
        ),
      ),
    );
  }
}
