import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/home/presentation/cubit/resevations_cubit/reservations_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    super.key,
    required this.tabValue,
    required this.title,
    required this.statusId,
  });

  final ResevationStep tabValue;
  final String title;
  final int statusId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationsCubit, ReservationsState>(
        builder: (context, state) {
      return GestureDetector(
        onTap: () {
          context.read<ReservationsCubit>().onSelectedTab(tabValue);
          context.read<ReservationsCubit>().filterReservation(
                tabValue: tabValue,
                statusId: statusId,
              );
        },
        child: Container(
          margin: const EdgeInsets.all(8.0),
          width: context.width * 0.2,
          height: context.height * 0.02,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 4.0,
                color: state.selectedTap == tabValue
                    ? AppColors.primaryColor
                    : AppColors.hintColor,
              ),
            ),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: state.selectedTap == tabValue
                  ? AppColors.primaryColor
                  : AppColors.hintColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    });
  }
}
