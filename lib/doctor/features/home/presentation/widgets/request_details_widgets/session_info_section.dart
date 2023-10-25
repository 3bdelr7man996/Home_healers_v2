import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/text_counter_helper.dart';
import 'package:dr/doctor/features/home/presentation/cubit/resevations_cubit/reservations_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SessionInfo extends StatelessWidget {
  const SessionInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationsCubit, ReservationsState>(
      buildWhen: (previous, current) =>
          previous.reservation != current.reservation,
      builder: (context, state) {
        if (state.reservation?.days != null &&
            state.reservation!.days!.isNotEmpty) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Session_details".tr(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              10.ph,
              SizedBox(
                height: context.height * 0.13,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.reservation?.days?.length,
                  itemBuilder: (context, index) {
                    return OneSessionInfo(
                      title: convertIntToText(context, index + 1),
                      date: state.reservation!.days![index],
                      status: state
                              .reservationsList![state.reservationsList!
                                      .indexWhere((e) =>
                                          e.id == state.reservation?.id) +
                                  index]
                              .status ??
                          "", //todo back end edit
                    );
                  },
                ),
              ),
              20.ph,
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class OneSessionInfo extends StatelessWidget {
  final String title, date, status;
  const OneSessionInfo({
    super.key,
    required this.title,
    required this.date,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
      ),
      child: Column(
        children: [
          Opacity(
            opacity: status == "completed" ? 0.5 : 1,
            child: Container(
              width: context.width * 0.25,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.transparent, width: 1),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          5.ph,
                          Text(
                            "${"session".tr()} $title",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          5.ph,
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        date.replaceAll(RegExp(r'(\d{2}:\d{2}:\d{2})'), ""),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          10.ph,
          if (status == "completed")
            SvgPicture.asset(
              'assets/icons/correct_icon.svg',
              width: 25,
              height: 25,
            ),
        ],
      ),
    );
  }
}
