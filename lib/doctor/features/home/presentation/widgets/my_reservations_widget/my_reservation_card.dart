import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/reservastion_status_helper.dart';
import 'package:dr/doctor/features/home/data/models/reservations_model.dart';
import 'package:dr/doctor/features/home/presentation/cubit/resevations_cubit/reservations_cubit.dart';
import 'package:dr/doctor/features/home/presentation/pages/requests_details_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyReservationCard extends StatelessWidget {
  const MyReservationCard({super.key, required this.reservation});
  final ReservationData? reservation;
  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardHeader(reservation: reservation),
          const Divider(thickness: 1),
          PatientInfo(reservation: reservation),
          Text("نوع الإصابة : ${reservation?.painPlace ?? ''}", //todo
              style: TextStyle(fontWeight: FontWeight.w500)),
          10.ph,
          SessionsCount(reservation: reservation),
          10.ph,
          ShowDetailsButton(reservation: reservation),
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: context.width * 0.8,
        height: context.height * 0.4,
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: child);
  }
}

class CardHeader extends StatelessWidget {
  const CardHeader({super.key, required this.reservation});
  final ReservationData? reservation;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "رقم الطلب : ${reservation?.id}",
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  "تاريخ الطلب : ${reservation?.startAt}",
                  style: const TextStyle(fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          Container(
            height: 40,
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: statusText(status: reservation!.status!).colors,
              ),
            ),
            child: Text(
              statusText(status: reservation!.status!).text,
              style: TextStyle(
                  color: statusText(status: reservation!.status!).colors,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

class PatientInfo extends StatelessWidget {
  const PatientInfo({super.key, required this.reservation});
  final ReservationData? reservation;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 115,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage('assets/images/person.png'), //todo
                fit: BoxFit.cover,
              ),
            ),
          ),
          10.pw,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                reservation?.user?.name ?? "",
                style: const TextStyle(
                    color: AppColors.primaryColor, fontWeight: FontWeight.w500),
              ),
              10.ph,
              Row(
                children: [
                  const Icon(
                    //todo
                    Icons.location_on,
                    color: AppColors.primaryColor,
                  ),
                  5.pw,
                  const DecoratedBox(
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
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class SessionsCount extends StatelessWidget {
  const SessionsCount({super.key, required this.reservation});
  final ReservationData? reservation;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          " عدد الجلسات :",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        5.pw,
        Text(
          "${reservation?.sessionsCount}",
          style: const TextStyle(
              color: AppColors.secondryColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class ShowDetailsButton extends StatelessWidget {
  const ShowDetailsButton({super.key, required this.reservation});
  final ReservationData? reservation;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.8,
      height: context.height * 0.05,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.primaryColor,
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: AppColors.primaryColor),
          ),
        ),
        onPressed: () {
          context.read<ReservationsCubit>().onReservationChange(reservation!);
          AppConstants.customNavigation(context,
              const RequestsDetailsScreen(fromNotification: false), 1, 0);
        },
        child: Text('order_details'.tr()),
      ),
    );
  }
}
