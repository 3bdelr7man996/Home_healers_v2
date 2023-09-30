import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/doctor/features/home/presentation/cubit/resevations_cubit/reservations_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PainDescription extends StatelessWidget {
  const PainDescription({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationsCubit, ReservationsState>(
      buildWhen: (previous, current) =>
          previous.reservation != current.reservation,
      builder: (context, state) {
        if (state.reservation?.notes != null &&
            state.reservation!.notes!.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "description_of_the_patient's_condition".tr(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              10.ph,
              Container(
                height: null,
                width: context.width * 0.9,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  "${state.reservation?.notes}",
                  style: const TextStyle(fontSize: 16.0, height: 1.5),
                  textAlign: TextAlign.start,
                ),
              ),
              30.ph
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
