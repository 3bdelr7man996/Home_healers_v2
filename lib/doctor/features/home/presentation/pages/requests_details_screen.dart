import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/doctor/features/home/presentation/widgets/request_details_widgets/advertise_reports_section.dart';
import 'package:dr/doctor/features/home/presentation/widgets/request_details_widgets/pain_description_section.dart';
import 'package:dr/doctor/features/home/presentation/widgets/request_details_widgets/patient_reports_section.dart';
import 'package:dr/doctor/features/home/presentation/widgets/request_details_widgets/request_details_header.dart';
import 'package:dr/doctor/features/home/presentation/widgets/request_details_widgets/session_buttons.dart';
import 'package:dr/doctor/features/home/presentation/widgets/request_details_widgets/session_info_section.dart';
import 'package:flutter/material.dart';

class RequestsDetailsScreen extends StatelessWidget {
  const RequestsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: CustomBottomNavigation(selectedIndex: 0),
      appBar: customAppBar(context, backButton: true, title: "order_details"),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const RequestsDetailsHeader(),
            const SessionInfo(),
            const PainDescription(),
            const PatientReportsImages(),
            const AdvertiserReports(),
            const SessionButton(),
            30.ph,
          ]),
        ),
      ),
    );
  }
}
