import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/features/notification/application/activityfeed.notifier.dart';
import 'package:thesis_cancer/features/notification/application/activityfeed.state.dart';

///
final Provider<FirebaseMessaging> firebaseMessagingInstanceProvider =
    Provider<FirebaseMessaging>(
  (_) => FirebaseMessaging.instance,
  name: "Firebase Messaging Instance Provider",
);

///
final StateNotifierProvider<ActivityFeedNotifier, ActivityFeedState>
    notificationsProvider =
    StateNotifierProvider<ActivityFeedNotifier, ActivityFeedState>(
  (StateNotifierProviderRef<ActivityFeedNotifier, ActivityFeedState> ref) =>
      ActivityFeedNotifier(reader: ref.read),
  name: "Activity Feed Notifier Provider",
);
