import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/doctor/features/home/presentation/cubit/resevations_cubit/reservations_cubit.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'accept_refuse_buttons.dart';
import 'finish_session_add_report_buttons.dart';

class SessionButton extends StatelessWidget {
  const SessionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationsCubit, ReservationsState>(
      builder: (context, state) {
        if (state.updateReservationState == RequestState.loading) {
          return const CustomLoader(
            padding: 0,
          );
        } else if (state.reservation?.status == "reviewing" &&
            state.reservation?.parentId == 0) {
          return AcceptRefuseButtons(
            state: state,
          );
        } else if (state.reservation?.status == "confirmed") {
          return AddReportAndFinishButton(
            state: state,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
