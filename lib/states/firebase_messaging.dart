import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icheckit_final/model/lite_notification.model.dart';
import 'package:icheckit_final/services/app_services.dart';

final firebaseMessagingProvider =
    Provider<FirebaseMessaging>((ref) => PushNotificationsService.messaging);

final tokenChangesProvider =
    StreamProvider<String?>((ref) => ref.watch(firebaseMessagingProvider).onTokenRefresh);

final fcmOnmessageProvider = StreamProvider<RemoteMessage?>((ref) => FirebaseMessaging.onMessage);

final lastNotificationProvider = StateProvider<LiteNotification?>((ref) => null);
