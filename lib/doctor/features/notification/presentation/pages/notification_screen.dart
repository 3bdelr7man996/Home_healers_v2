import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/doctor/features/notification/presentation/cubit/notification_cubit.dart';
import 'package:dr/doctor/features/notification/presentation/widgets/notification_widgets.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationScreen extends StatefulWidget {
  var fromPatient;
  NotificationScreen({super.key, this.fromPatient = false});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late bool IsUserGuest;

  IsGuest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      IsUserGuest = prefs.containsKey('guest');
      print(prefs.containsKey('guest'));
    });
    if (IsUserGuest == false)
      context.read<NotificationCubit>().getAllNotifications();
  }

  @override
  void initState() {
    IsUserGuest = false;
    IsGuest();
    print(IsUserGuest);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: widget.fromPatient
            ? IsUserGuest
                ? Center(
                    child: Text("قم بتسجيل الدخول للوصول لهذه الخدمة"),
                  )
                : NotificationBody()
            : NotificationBody());
  }
}

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customAppBar(context, backButton: false, title: "notification"),
        BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            if (state.notifState == RequestState.loading) {
              return const CustomLoader();
            } else if (state.notifState == RequestState.success &&
                state.notifList!.isNotEmpty) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 30.0),
                  child: ListView.builder(
                    itemCount: state.notifList?.length,
                    itemBuilder: (context, index) {
                      return OneNotification(
                          title: state.notifList?[index].data?.title ?? "",
                          imagePath:
                              "${state.notifList?[index].data?.icon ?? 'notif_purple'}.svg",
                          date: state.notifList?[index].createdAt ?? "",
                          description:
                              state.notifList?[index].data?.body ?? "");
                    },
                  ),
                ),
              );
            } else {
              return Expanded(
                child: Center(
                  child: Column(
                    children: [
                      Image.asset("asset/images/notificationsEmpty.png"),
                      Text("لا توجد إشعارات في الوقت الحالي")
                    ],
                  ),
                ),
              );
            }
          },
        )
      ],
    );
  }
}
