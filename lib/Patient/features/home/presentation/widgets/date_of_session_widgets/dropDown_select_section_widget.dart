// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/home/presentation/cubit/home_cubit/reservation_cubit.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_state/reservation_state.dart';
import 'package:dr/doctor/features/auth/data/model/advertiser_model.dart';
import 'package:dr/doctor/features/auth/data/model/status_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownForSelectSection extends StatelessWidget {
  Advertiser? doctorInfo;

  DropDownForSelectSection({
    super.key,
    required this.doctorInfo,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationCubit, ReservationState>(
        builder: (context, state) {
      return DropdownButton<StatusData>(
        underline: Container(), // Hide the underline
        // icon: const SizedBox(), // Hide the arrow icon
        value: (state.status_id != null && state.status_id != -1)
            ? doctorInfo?.statusAdvisor
                ?.firstWhere((status) => status.id == state.status_id)
            : doctorInfo?.statusAdvisor?.first,
        onChanged: (StatusData? newValue) async {
          await context
              .read<ReservationCubit>()
              .onChangestatus_id(newValue?.id);
        },
        items: doctorInfo?.statusAdvisor
            ?.map<DropdownMenuItem<StatusData>>((StatusData value) {
          return DropdownMenuItem<StatusData>(
            value: value,
            child: Text("${value.nameAr}"),
          );
        }).toList(),
      );
    });
  }
}
