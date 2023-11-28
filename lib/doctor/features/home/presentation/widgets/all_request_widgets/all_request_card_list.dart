import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/doctor/features/home/presentation/cubit/resevations_cubit/reservations_cubit.dart';
import 'package:dr/doctor/features/home/presentation/pages/my_reservations_screen.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'all_request_card.dart';

class RequestsCardList extends StatelessWidget {
  const RequestsCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationsCubit, ReservationsState>(
        buildWhen: (previous, current) =>
            previous.resrvationStatusList != current.resrvationStatusList ||
            previous.reservStatusState != current.reservStatusState,
        builder: (context, state) {
          if (state.reservStatusState == RequestState.loading) {
            return const CustomLoader(
              padding: 0.34,
            );
          } else if (state.reservStatusState == RequestState.success &&
              state.resrvationStatusList != null) {
            return Expanded(
              // height: context.height - 0.25 - 145,
              child: ListView.builder(
                itemCount: state.resrvationStatusList?.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      context
                          .read<ReservationsCubit>()
                          .onSelectedTab(ResevationStep.reviewing);
                      context.read<ReservationsCubit>().onPainStatusIdChange(
                          state.resrvationStatusList![index].status!.id!);
                      AppConstants.customNavigation(
                          context,
                          MyReservationScreen(
                              statusId: state
                                  .resrvationStatusList![index].status!.id!),
                          0,
                          1);
                    },
                    child: state.resrvationStatusList![index].status != null
                        ? RequestCard(
                            title: context.locale.languageCode == "ar"
                                ? state.resrvationStatusList![index].status!
                                        .nameAr ??
                                    ""
                                : state.resrvationStatusList![index].status!
                                        .nameEn ??
                                    "",
                            pathImage: state.resrvationStatusList![index].status
                                    ?.image ??
                                '', //todo
                            requestsCount:
                                state.resrvationStatusList![index].count ?? 0,
                          )
                        : const SizedBox.shrink(),
                  );
                },
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
