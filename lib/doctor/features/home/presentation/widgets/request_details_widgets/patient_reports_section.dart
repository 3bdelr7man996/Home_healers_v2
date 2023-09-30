import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/doctor/features/home/data/models/user_model.dart';
import 'package:dr/doctor/features/home/presentation/cubit/resevations_cubit/reservations_cubit.dart';
import 'package:dr/shared_widgets/photo_viewer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientReportsImages extends StatelessWidget {
  const PatientReportsImages({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationsCubit, ReservationsState>(
      buildWhen: (previous, current) =>
          current.reservation != previous.reservation,
      builder: (context, state) {
        // if (reservation?.user?.reports != null &&
        //     reservation!.user!.reports!.isNotEmpty) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "patient_reports".tr(),
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            12.ph,
            (state.reservation?.user?.reports != null &&
                    state.reservation!.user!.reports!.isNotEmpty)
                ? SizedBox(
                    width: context.width * 0.9,
                    height: context.height * 0.2,
                    child: ListView.builder(
                        itemCount:
                            state.reservation?.user?.reports?.length ?? 0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final Reports report =
                              state.reservation!.user!.reports![index];

                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PhotoViewerRouteWrapper(
                                    imageProvider: NetworkImage(
                                      '${AppStrings.imageUrl}${report.repImage}',
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              child: AppConstants.customNetworkImage(
                                imagePath:
                                    '${AppStrings.imageUrl}${report.repImage}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                  )
                : Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        'there_are_no_reports'.tr(),
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: AppColors.darkPrimaryColor,
                          // Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
          ],
        );
      },
    );
  }
}
