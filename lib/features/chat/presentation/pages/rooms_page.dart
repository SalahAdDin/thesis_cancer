import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as fc_types;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/navigator.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/core/presentation/pages/error_screen.dart';
import 'package:thesis_cancer/core/presentation/widgets/header.dart';
import 'package:thesis_cancer/core/presentation/widgets/user_avatar.dart';
import 'package:thesis_cancer/features/chat/application/chat.provider.dart';
import 'package:thesis_cancer/features/chat/presentation/pages/chat_page.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';

// TODO: Solve this https://github.com/flyerhq/flutter_chat_ui/issues/59

///
class RoomsPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<fc_types.Room>> rooms =
        useProvider(roomsListProvider);
    final UserRole? sessionUser =
        useProvider(userEntityProvider).state.profile?.role;

    return Scaffold(
      appBar: Header(
        pageTitle: sessionUser == UserRole.ADMIN ? "Hastalar" : "Uzmanlar",
        // leading: const BackButton(),
        // additionalActions: <Widget>[Container()],
      ),
      /*
      endDrawer: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 275),
        child: SideMenu(),
      ),
      */
      body: rooms.when(
        data: (List<fc_types.Room> rooms) {
          if (rooms.isEmpty) {
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                bottom: 200,
              ),
              child: const Text('No rooms'),
            );
          }

          return ListView.builder(
            itemCount: rooms.length,
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
              final fc_types.Room room = rooms[index];

              return GestureDetector(
                onTap: () => pushToPage(
                  context,
                  ChatPage(
                    room: room,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: UserAvatar(
                          userAvatarUrl: room.imageUrl,
                        ),
                      ),
                      Text(room.name ?? 'Room'),
                    ],
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (Object error, StackTrace? stack) => ErrorScreen(
          message: error.toString(),
          actionLabel: 'Home',
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
