import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/diagnose_report/presentation/pages/add_report_screen.dart';
import 'package:dr/doctor/features/home/presentation/cubit/resevations_cubit/reservations_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddReportAndFinishButton extends StatelessWidget {
  const AddReportAndFinishButton({super.key, required this.state});
  final ReservationsState state;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: context.width * 0.4,
          child: ElevatedButton(
            onPressed: () {
              AppConstants.customNavigation(context,
                  AddReportScreen(reservation: state.reservation!), 1, 0);
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.secondryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'add_report'.tr(),
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                5.pw,
                SvgPicture.asset(
                  'assets/icons/report_icon.svg',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: context.width * 0.4,
          child: ElevatedButton(
            onPressed: () {
              context.read<ReservationsCubit>().updateReservation(
                  state.reservation!.copyWith(status: 'completed'));
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
              'end_the_first_session'.tr(),
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}
