import 'dart:developer';

import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/core/utils/reservastion_status_helper.dart';
import 'package:dr/doctor/features/chats/presentation/pages/one_chat_screen.dart';
import 'package:dr/doctor/features/home/presentation/cubit/resevations_cubit/reservations_cubit.dart';
import 'package:dr/features/auth/data/models/user_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:map_launcher/map_launcher.dart';

class RequestsDetailsHeader extends StatelessWidget {
  const RequestsDetailsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DateSection(),
        const Divider(
          thickness: 1,
        ),
        20.ph,
        const PatientDetailsSection(),
        20.ph,
        Text(
          "نوع الإصابة : ${context.read<ReservationsCubit>().state.reservation?.painPlace ?? ''}", //todo
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        10.ph,
        const SessionsCount(),
        10.ph,
        const SessionsPrice(),
        30.ph,
      ],
    );
  }
}

class DateSection extends StatelessWidget {
  const DateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationsCubit, ReservationsState>(
      buildWhen: (previous, current) =>
          previous.reservation?.status != current.reservation?.status,
      builder: (context, state) {
        return SizedBox(
          width: context.width,
          height: context.height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "رقم الطلب : ${state.reservation?.id}",
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "تاريخ الطلب : ${state.reservation?.startAt?.replaceAll(RegExp(r'(\d{2}:\d{2}:\d{2})'), "") ?? ""}",
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Container(
                height: 40,
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color:
                        statusText(status: state.reservation!.status!).colors,
                  ),
                ),
                child: Text(
                  statusText(status: state.reservation!.status!).text,
                  style: TextStyle(
                      color:
                          statusText(status: state.reservation!.status!).colors,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class PatientDetailsSection extends StatelessWidget {
  const PatientDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationsCubit, ReservationsState>(
      buildWhen: (previous, current) =>
          previous.reservation != current.reservation,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              //width: 115,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: AppConstants.customNetworkImage(
                    imageError: AppImages.patientImg,
                    fit: BoxFit.contain,
                    imagePath: "${state.reservation?.user?.image ?? ""}"),
              ),
            ),
            10.pw,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${state.reservation?.user?.name}",
                  style: const TextStyle(
                      fontSize: 20.0,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                10.ph,
                if (state.reservation?.lat != null &&
                    state.reservation?.lang != null)
                  GestureDetector(
                    onTap: () async {
                      log("tapeed");
                      final availableMaps = await MapLauncher.installedMaps;
                      await availableMaps.firstWhere(
                        (element) {
                          return element.mapType == MapType.google;
                        },
                        orElse: (() {
                          AppConstants.launchURL(
                              'https://www.google.com/maps/search/?api=1&query=${state.reservation?.lat},${state.reservation?.lang}');
                          return availableMaps.first;
                        }),
                      ).showDirections(
                          destination: Coords(
                              double.parse(state.reservation!.lat!),
                              double.parse(state.reservation!.lang!)),
                          destinationTitle: "عنوان المريض");
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.location_on, //todo
                          color: AppColors.primaryColor,
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Text(
                            'موقع المريض',
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              ],
            ),
            if (state.reservation?.status == "confirmed")
              Expanded(
                //todo msg & call
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        AppConstants.customNavigation(
                            context,
                            OneChatScreen(
                                recieverInfo: UserData().copyWith(
                              id: state.reservation?.user?.id,
                              name: state.reservation?.user?.name,
                              image: state.reservation?.user?.image,
                              fcmToken: state.reservation?.user?.fcmToken,
                            )),
                            0,
                            1);
                      },
                      child: SvgPicture.asset(
                        'assets/icons/message_icon.svg',
                        width: 30,
                        height: 30,
                      ),
                    ),
                    10.pw,
                    GestureDetector(
                      onTap: () => AppConstants.launchURL(
                          'tel:${state.reservation?.user?.mobile}'),
                      child: SvgPicture.asset(
                        'assets/icons/call_icon.svg',
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}

class SessionsCount extends StatelessWidget {
  const SessionsCount({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationsCubit, ReservationsState>(
      buildWhen: (previous, current) =>
          previous.reservation?.sessionsCount !=
          current.reservation?.sessionsCount,
      builder: (context, state) {
        return Row(
          children: [
            const Text(
              " عدد الجلسات :",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            5.pw,
            Text(
              "${state.reservation?.sessionsCount}",
              style: const TextStyle(
                  color: AppColors.secondryColor, fontWeight: FontWeight.bold),
            ),
          ],
        );
      },
    );
  }
}

class SessionsPrice extends StatelessWidget {
  const SessionsPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationsCubit, ReservationsState>(
        buildWhen: (previous, current) =>
            previous.reservation != current.reservation,
        builder: (context, state) {
          return Row(
            children: [
              const Text(
                " حساب الجلسات  :",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              5.pw,
              Text(
                state.reservation!.parentId == 0
                    ? "${state.reservation?.amount ?? 0} ${"sar".tr()}"
                    : "${state.reservation!.advertiser!.sessionPrice! * state.reservation!.sessionsCount!} ${"sar".tr()}",
                style: const TextStyle(
                    color: AppColors.secondryColor,
                    fontWeight: FontWeight.bold),
              ),
            ],
          );
        });
  }
}
