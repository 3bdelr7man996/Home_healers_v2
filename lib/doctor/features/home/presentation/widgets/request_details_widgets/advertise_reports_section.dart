import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/home/data/models/reservation_details_model.dart';
import 'package:dr/doctor/features/home/presentation/cubit/resevations_cubit/reservations_cubit.dart';
import 'package:dr/shared_widgets/photo_viewer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdvertiserReports extends StatelessWidget {
  const AdvertiserReports({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationsCubit, ReservationsState>(
      buildWhen: (previous, current) =>
          current.reservation != previous.reservation,
      builder: (context, state) {
        if (state.reservation?.reports != null &&
            state.reservation!.reports!.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'specialist_reports'.tr(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              12.ph,
              SizedBox(
                width: context.width * 0.9,
                height: context.height * 0.2,
                child: ListView.builder(
                    itemCount: state.reservation?.reports?.length ?? 0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final DoctorReports? report =
                          state.reservation?.reports?[index];

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PhotoViewerRouteWrapper(
                                filePath: '${report?.file}',
                              ),
                            ),
                          );
                        },
                        child: Card(
                          child: AppConstants.customNetworkImage(
                            imagePath: '${report?.file}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }),
              )
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
