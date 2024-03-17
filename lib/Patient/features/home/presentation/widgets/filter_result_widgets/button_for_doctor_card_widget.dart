// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/home/data/models/section-model.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_cubit/reservation_cubit.dart';
import 'package:dr/Patient/features/home/presentation/pages/specialist_page_screen.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonForDoctorCard extends StatelessWidget {
  Data? doctorInfo;
  int? status_id;
  bool fromOffer;
  bool fromPackages;
  var sessionCountForOffer;
  bool? fromFilter;
  var offer;
  ButtonForDoctorCard(
      {super.key,
      this.doctorInfo,
      this.offer,
      this.fromFilter = false,
      this.fromPackages = false,
      this.sessionCountForOffer,
      this.status_id,
      this.fromOffer = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primaryColor,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      width: context.width,
      child: ElevatedButton(
        onPressed: () {
          if (offer != null)
            context.read<ReservationCubit>().OnOfferChange(offer);
          AppConstants.customNavigation(
              context,
              specialistpageScreen(
                  fromPackages: fromPackages,
                  doctorInfo: doctorInfo,
                  status_id: status_id,
                  fromOffer: fromOffer,
                  fromFilter: fromFilter,
                  sessionCountForOffer: sessionCountForOffer),
              -1,
              0);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'الملف الشخصي',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
