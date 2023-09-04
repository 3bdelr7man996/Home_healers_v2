import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/doctor/features/home/presentation/widgets/requests_details_widgets.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RequestsDetailsScreen extends StatelessWidget {
  String mainPage;
  RequestsDetailsScreen({super.key, required this.mainPage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationForDetails(),
      appBar: customAppBar(context, backButton: true, title: "order_details"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            RequestsDetailsHeader(mainPage: mainPage),
            SessionInfo(mainPage: mainPage),
            const descriptionPatientCondition(),
            const Reports(),
            mainPage == "Review" ? const ButtonsForReview() : const Text(""),
            mainPage == "The payment was made"
                ? const ButtonsForPayment()
                : const Text(""),
            30.ph,
          ]),
        ),
      ),
    );
  }
}
