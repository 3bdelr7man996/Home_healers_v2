import 'package:dr/Patient/features/home/presentation/pages/home_screen_for_patient.dart';
import 'package:dr/Patient/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/cache_helper.dart';
import 'package:dr/doctor/features/home/presentation/pages/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'local_notification_config.dart';
import 'package:dr/di_container.dart' as di;

class FirebaseMessagingService {
  final FirebaseMessaging firebaseMessaging;
  final LocalNotificationsService localNotification;
  FirebaseMessagingService(
      {required this.firebaseMessaging, required this.localNotification}) {
    _initializeFirebase();
  }

  Future<void> _initializeFirebase() async {
    await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  ///HANDLE ON SELECT NOTIFICATION AND SHOW EARN POPUP
  void onRecieveNotification(BuildContext context) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('===Got a message whilst in the foreground!=====');

        if (message.notification != null) {
          print('''Message also contained a notification: 
              ${message.notification?.body}/n 
              ${message.notification?.title}''');
        }
      }
      if (message.notification?.title == 'ربحت نقاط جديدة') {
        if (context.mounted) {
          context.read<PaymentCubit>().showBottomSheetForEarnPoints(
                context,
                title: message.notification?.title,
                body: message.notification?.body,
              );
        }
      }
      di.sl<LocalNotificationsService>().showLocalNotification(
            title: message.notification?.title ?? "",
            body: message.notification?.body ?? "",
            payload: message.notification?.body ?? "",
          );
    });

    //?========================[ HANDLE ON SELECT NOTIF ]=======================

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      //todo handle mchat notification route
      if (message.notification?.title == 'ربحت نقاط جديدة') {
        AppConstants.pushRemoveNavigator(
          context,
          screen: CacheHelper.getData(key: AppStrings.isAdvertise)
              ? HomeScreen(
                  selectedIndex: 2,
                )
              : HomeScreenForPatient(
                  selectedIndex: 1,
                ),
        );
      } else {
        AppConstants.pushRemoveNavigator(
          context,
          screen: CacheHelper.getData(key: AppStrings.isAdvertise)
              ? HomeScreen(
                  selectedIndex: 2,
                )
              : HomeScreenForPatient(
                  selectedIndex: 1,
                ),
        );
      }
    });

    //?=============[ HANDLE ONSELECT NOTIF WHEN APP IS CLOSED]=================

    firebaseMessaging.getInitialMessage().then((message) {
      if (message != null) {
        //todo handle chat notification route
        AppConstants.pushRemoveNavigator(
          context,
          screen: CacheHelper.getData(key: AppStrings.isAdvertise)
              ? HomeScreen(
                  selectedIndex: 2,
                )
              : HomeScreenForPatient(
                  selectedIndex: 1,
                ),
        );
      }
    });
  }

  Future<String?> getFirebaseToken() async {
    return await firebaseMessaging.getToken();
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  if (kDebugMode) {
    print("Handling a background message:  ${message.notification}");
    print("==================================");
    print(" ${message.notification?.body}");
    print(" ${message.notification?.title}");
    print("${message.notification?.toMap()}");
    print("===========================");
    print("${message.toMap()}");
  }
}

// void _handleMessage(BuildContext context, RemoteMessage message) {
//   log("onMessageOpenedApp =================");
//   print("event data onMessageOpenedApp ${message.data}");
//   print(
//       "event data onMessageOpenedApp notification body${message.notification?.body}");
// }

// localNotification.showLocalNotification(title: message., body: body);
