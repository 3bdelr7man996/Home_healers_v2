import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/home/presentation/cubit/resevations_cubit/reservations_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AcceptRefuseButtons extends StatelessWidget {
  const AcceptRefuseButtons({super.key, required this.state});
  final ReservationsState state;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: context.width * 0.25,
          child: ElevatedButton(
            onPressed: () {
              context.read<ReservationsCubit>().updateReservation(
                  state.reservation!.copyWith(status: 'canceled'),
                  subReservation: true);
            },
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: const BorderSide(color: Colors.red),
                ),
              ),
            ),
            child: Text(
              'rejecting_the_request'.tr(),
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
        ),
        SizedBox(
          width: context.width * 0.55,
          child: ElevatedButton(
            onPressed: () {
              context.read<ReservationsCubit>().updateReservation(
                  state.reservation!.copyWith(status: 'wait_confirm'),
                  subReservation: true);
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.primaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            child: Text(
              'accept_the_order_send_the_payment_request'.tr(),
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}
