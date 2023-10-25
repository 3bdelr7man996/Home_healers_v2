import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

import 'local_notification_config.dart';
import 'package:dr/di_container.dart' as di;

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final LocalNotificationsService localNotification;
  FirebaseMessagingService({required this.localNotification}) {
    _initializeFirebase();
  }

  Future<void> _initializeFirebase() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('===Got a message whilst in the foreground!=====');
      }
      if (kDebugMode) {
        print('Message data: ${message.data}');
      }

      if (message.notification != null) {
        if (kDebugMode) {
          print(
              'Message also contained a notification: ${message.notification?.body}/n ${message.notification?.title}');
        }
      }
      di.sl<LocalNotificationsService>().showLocalNotification(
          title: message.notification?.title ?? "",
          body: message.notification?.body ?? "");
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<String?> getFirebaseToken() async {
    return await _firebaseMessaging.getToken();
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  if (kDebugMode) {
    print("Handling a background message:  ${message.data}");
  }
  // localNotification.showLocalNotification(title: message., body: body);
}
