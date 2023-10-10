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
          return const CustomLoader(
            padding: 0.35,
          );
        } else if (state.filterState == RequestState.success &&
            state.filteredReservList != []) {
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
          return const SizedBox.shrink();
        }
      },
    );
  }
}
