part of app_services;

class PushNotificationsService {
  const PushNotificationsService._();

  static const instance = PushNotificationsService._();

  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static late NotificationSettings _settings;

  static NotificationSettings get settings => _settings;

  static Future<void> initialize() async {
    await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    _settings = await messaging.getNotificationSettings();

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  debugPrint("Handling a background message: ${message.messageId}");
}
