import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/doctor/features/home/presentation/cubit/resevations_cubit/reservations_cubit.dart';
import 'package:dr/doctor/features/home/presentation/widgets/request_details_widgets/advertise_reports_section.dart';
import 'package:dr/doctor/features/home/presentation/widgets/request_details_widgets/pain_description_section.dart';
import 'package:dr/doctor/features/home/presentation/widgets/request_details_widgets/patient_reports_section.dart';
import 'package:dr/doctor/features/home/presentation/widgets/request_details_widgets/request_details_header.dart';
import 'package:dr/doctor/features/home/presentation/widgets/request_details_widgets/session_buttons.dart';
import 'package:dr/doctor/features/home/presentation/widgets/request_details_widgets/session_info_section.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestsDetailsScreen extends StatelessWidget {
  const RequestsDetailsScreen({super.key, required this.fromNotification});
  final bool fromNotification;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: CustomBottomNavigation(selectedIndex: 0),
      appBar: customAppBar(context, backButton: true, title: "order_details"),
      body: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: BlocBuilder<ReservationsCubit, ReservationsState>(
              builder: (context, state) {
                if (state.reservDetailsState == RequestState.loading) {
                  return CustomLoader();
                } else if (state.reservDetailsState == RequestState.failed) {
                  return Center(
                    child: Text(
                      "لا يوجد بيانات ",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  );
                } else {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const RequestsDetailsHeader(),
                        SessionInfo(fromNotification: fromNotification),
                        const PainDescription(),
                        const PatientReportsImages(),
                        const AdvertiserReports(),
                        const SessionButton(),
                        30.ph,
                      ]);
                }
              },
            )),
      ),
    );
  }
}
