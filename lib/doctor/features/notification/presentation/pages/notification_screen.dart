import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/doctor/features/notification/presentation/widgets/notification_widgets.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customAppBar(context, backButton: false, title: "notification"),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Column(
                children: [
                  OneNotification(
                      title: "تم بنجاح حجز الموعد",
                      imagePath: "assets/icons/done_notification_icon.svg",
                      date: "15:30",
                      description:
                          "هذا النص هو مثال لنص يمكن استبداله حيث يمكننا اضافة اي نص اخر يعبر عن تلك الحالة بشكل عادي."),
                  OneNotification(
                      title: "تحذير  من نقص المعلومات",
                      imagePath: "assets/icons/warnning_notification_icon.svg",
                      date: "15:30",
                      description:
                          "هذا النص هو مثال لنص يمكن استبداله حيث يمكننا اضافة اي نص اخر يعبر عن تلك الحالة بشكل عادي."),
                  OneNotification(
                      title: "خطأ في الإعدادت",
                      imagePath: "assets/icons/wrong_notification_icon.svg",
                      date: "15:30",
                      description:
                          "هذا النص هو مثال لنص يمكن استبداله حيث يمكننا اضافة اي نص اخر يعبر عن تلك الحالة بشكل عادي."),
                  OneNotification(
                      title: "تحديث في الأبليكيشن",
                      imagePath:
                          "assets/icons/blue_warnning_notification_icon.svg",
                      date: "15:30",
                      description:
                          "هذا النص هو مثال لنص يمكن استبداله حيث يمكننا اضافة اي نص اخر يعبر عن تلك الحالة بشكل عادي."),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
