import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/doctor/features/home/presentation/cubit/resevations_cubit/reservations_cubit.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_reservation_card.dart';

class MyReservationBody extends StatelessWidget {
  const MyReservationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationsCubit, ReservationsState>(
      builder: (context, state) {
        if (state.filterState == RequestState.loading) {
          return Expanded(
            child: const CustomLoader(
              padding: 0,
            ),
          );
        } else if (state.filterState == RequestState.success &&
            state.filteredReservList!.isNotEmpty) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.filteredReservList?.length ?? 0,
              itemBuilder: (context, index) {
                return MyReservationCard(
                  reservation: state.filteredReservList?[index],
                );
              },
            ),
          );
        } else {
          return Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppConstants.customAssetImage(
                imagePath: AppImages.task_icon,
                width: 100,
                height: 150,
                fit: BoxFit.contain,
                //color: Color.fromARGB(255, 235, 236, 236)
              ),
              10.ph,
              Text(
                "لا يوجد طلبات في الوقت الراهن",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 179, 181, 181),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ));
        }
      },
    );
  }
}
