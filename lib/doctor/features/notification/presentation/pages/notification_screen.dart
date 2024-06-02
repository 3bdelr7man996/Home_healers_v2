import 'package:dr/Patient/features/setting/presentation/cubit/settings_cubit/setting_cubit.dart';
import 'package:dr/Patient/features/setting/presentation/pages/my_point_for_patient.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/doctor/features/home/presentation/cubit/resevations_cubit/reservations_cubit.dart';
import 'package:dr/doctor/features/home/presentation/pages/requests_details_screen.dart';
import 'package:dr/doctor/features/notification/presentation/cubit/notification_cubit.dart';
import 'package:dr/doctor/features/notification/presentation/widgets/notification_widgets.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationScreen extends StatefulWidget {
  final bool fromPatient;
  NotificationScreen({super.key, this.fromPatient = false});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late bool IsUserGuest;

  @override
  void initState() {
    IsUserGuest = !context.read<AuthCubit>().hasToken();
    if (IsUserGuest == false) {
      context.read<NotificationCubit>().getAllNotifications();
    }
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
                        description: state.notifList?[index].data?.body ?? "",
                        onTap: () async {
                          print(state.notifList![index].type!);
                          if (state.notifList![index].type!
                                  .contains("OrderStatus2") ||
                              state.notifList![index].type!
                                  .contains("DoctorNewReservation")) {
                            await context
                                .read<ReservationsCubit>()
                                .getReservDetails(
                                    reservId: state.notifList![index].data?.id);
                            AppConstants.customNavigation(
                                context,
                                RequestsDetailsScreen(fromNotification: true),
                                0,
                                1);
                          } else if (state.notifList![index].type!
                              .contains("UserNewReservation")) {
                            await context
                                .read<MyOrdersCubit>()
                                .ShowNotification(
                                    context,
                                    state.notifList![index].data!.id!
                                        .toString());
                          } else if (state.notifList![index].type!
                              .contains("newPoints")) {
                            AppConstants.customNavigation(
                                context, MyPointScreenForPatient(), -1, 0);
                          }
                        },
                      );
                    },
                  ),
                ),
              );
            } else {
              return Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Image.asset("asset/images/notificationsEmpty.png"),
                      AppConstants.customAssetSvg(
                        imagePath: AppImages.emptyNotifications,
                      ),
                      10.ph,
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
