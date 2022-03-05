import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as fc_types;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/application/navigator.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';
import 'package:thesis_cancer/core/presentation/pages/error_screen.dart';
import 'package:thesis_cancer/core/presentation/widgets/header.dart';
import 'package:thesis_cancer/core/presentation/widgets/user_avatar.dart';
import 'package:thesis_cancer/features/chat/application/chat.provider.dart';
import 'package:thesis_cancer/features/chat/presentation/pages/chat_page.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';

///
class RoomsPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<fc_types.Room>> rooms =
        useProvider(roomsListProvider);
    final User _sessionUser = useProvider(userEntityProvider).state;
    final UserRole? _sessionUserRole = _sessionUser.profile?.role;

    final FirebaseAnalytics _analytics = useProvider(firebaseAnalyticsProvider);

    Future<void> _setScreenAnalytics() async {
      await _analytics.setCurrentScreen(
        screenName: "${_sessionUser.username} Room Screen",
      );
    }

    useEffect(
      () {
        _setScreenAnalytics();
        return null;
      },
      const <Object>[],
    );

    return Scaffold(
      appBar: Header(
        pageTitle: _sessionUserRole == UserRole.ADMIN
            ? AppLocalizations.of(context)!.patientsLabel
            : AppLocalizations.of(context)!.specialistsLabel,
        // leading: const BackButton(),
        // additionalActions: <Widget>[Container()],
      ),
      body: rooms.when(
        data: (List<fc_types.Room> rooms) {
          if (rooms.isEmpty) {
            return Container(
              alignment: Alignment.center,
              child: Text(AppLocalizations.of(context)!.noRoomsLabel),
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

              return ListTile(
                title: Text(room.name ?? 'Room'),
                onTap: () => pushToPage(
                  Navigator.of(context),
                  ChatPage(
                    room: room,
                  ),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: UserAvatar(
                    userAvatarUrl: room.imageUrl,
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
          // TODO: implements reasons for Firebase
          reason: FailureReason.unknown,
          actionLabel: AppLocalizations.of(context)!.homeLabel,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
