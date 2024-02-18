import 'dart:developer';

import 'package:dr/Patient/features/home/presentation/pages/home_screen_for_patient.dart';
import 'package:dr/Patient/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:dr/Patient/features/setting/presentation/pages/my_point_for_patient.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/cache_helper.dart';
import 'package:dr/doctor/features/home/presentation/pages/home_screen.dart';
import 'package:dr/doctor/features/settings/presentation/pages/my_point_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'local_notification_config.dart';
import 'package:dr/di_container.dart' as di;

class FirebaseMessagingService {
   FirebaseMessaging firebaseMessaging;
  final LocalNotificationsService localNotification;
  FirebaseMessagingService(
      {required this.firebaseMessaging, required this.localNotification}) {
    _initializeFirebase();
  }

  Future<void> _initializeFirebase() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
  //REQUEST PERMISSION 
  Future<void> requestNotificPermission()async{
    await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    
  }
  ///HANDLE ON SELECT NOTIFICATION AND SHOW EARN POPUP
  void onRecieveNotification(BuildContext context) {
    log("***********ON RECIEVE NOTIFICATION INTIALIZATION ************");
    log("______________________________________________________________");

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
        Future.delayed(Duration(seconds: 5), () {
          if (context.mounted) {
            context.read<PaymentCubit>().showBottomSheetForEarnPoints(
                  context,
                  title: message.notification?.title,
                  body: message.notification?.body,
                );
          }
        });
      }
      di.sl<LocalNotificationsService>().showLocalNotification(
            title: message.notification?.title ?? "",
            body: message.notification?.body ?? "",
            payload: message.notification?.body ?? "",
          );
    });

    //?========================[ HANDLE ON SELECT NOTIF ]=======================

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      log("Listen Notification onMessageOpenedApp");
      //todo handle chat notification route
      handleRoute(context, message);
    });

    //?=============[ HANDLE ONSELECT NOTIF WHEN APP IS CLOSED]=================

    firebaseMessaging.getInitialMessage().then((message) {
      log("Handle notification getInitialMessage ");
      if (message != null) {
        //todo handle chat notification route
        handleRoute(context, message);
      }
    });
  }

  ///get fiebase token 'fcm'
  Future<String?> getFirebaseToken() async {
    try {
      return await firebaseMessaging.getToken();
    } catch (e) {
      log(e.toString());
      return '';
    }
  }

  void handleRoute(BuildContext context, RemoteMessage message) {
    log("Handle Routeee");
    if (message.notification?.title == 'ربحت نقاط جديدة') {
      AppConstants.pushRemoveNavigator(
        context,
        screen: CacheHelper.getData(key: AppStrings.isAdvertise)
            ? MyPointScreen()
            : MyPointScreenForPatient(),
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
