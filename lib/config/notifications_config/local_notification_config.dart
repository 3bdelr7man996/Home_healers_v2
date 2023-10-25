import 'dart:async';
import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationsService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
//  final StreamController<ReceivedNotification> didReceiveLocalNotificationStream =
//     StreamController<ReceivedNotification>.broadcast();

// final StreamController<String?> selectNotificationStream =
//     StreamController<String?>.broadcast();
  LocalNotificationsService() {
    _initializeLocalNotifications();
  }

  void _initializeLocalNotifications() async {
    _requestPermissions();
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('launch_background');

    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification:
          (int id, String? title, String? body, String? payload) async {
        dev.log("ios foreground notification payload $payload");
      },
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse: _selectNotification,
      onDidReceiveNotificationResponse: _selectNotification,
    );
  }

  static void _selectNotification(NotificationResponse notificationResponse) {
    // Handle when a user taps the local notification
    // Customize this method for your app's needs
    dev.log(
        "Select Notification method payload ${notificationResponse.payload}");
    dev.log(
        "Select Notification method ${notificationResponse.notificationResponseType} ");
  }

  Future<void> showLocalNotification(
      {required String title,
      required String body,
      String payload = ''}) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'homeHealers_channel_id',
      'HomeHealers_channel',
      importance: Importance.high,
      // sound: RawResourceAndroidNotificationSound(
      //     'custom_sound'),
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await _flutterLocalNotificationsPlugin.show(
      Random().nextInt(10), // Unique ID for the notification
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  Future<void> _requestPermissions() async {
    if (Platform.isIOS || Platform.isMacOS) {
      await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          _flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>();

      await androidImplementation?.requestNotificationsPermission();
    }
  }
}

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}
