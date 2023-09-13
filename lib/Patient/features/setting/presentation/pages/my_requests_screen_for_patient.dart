import 'package:dr/Patient/features/setting/presentation/widgets/my_request_widgets_for_patient.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/doctor/features/home/presentation/widgets/my_requests_widgets.dart';
import 'package:flutter/material.dart';

class MyRequestsForPatient extends StatefulWidget {
  final int activeIndex;

  const MyRequestsForPatient({super.key, this.activeIndex = 0});

  @override
  State<MyRequestsForPatient> createState() => _MyRequestsForPatientState();
}

class _MyRequestsForPatientState extends State<MyRequestsForPatient> {
  late int activeIndex;

  @override
  void initState() {
    super.initState();
    activeIndex = widget.activeIndex;
  }

  void updateActiveIndex(int newIndex) {
    setState(() {
      activeIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, backButton: true, title: "my_requests"),
      body: Column(
        children: [
          SizedBox(height: 20),
          Categories(
            categories: const [
              "قيد المعالجة",
              "المقبولة",
              "المؤكدة",
              "المكتملة",
              "الملغية",
            ],
            activeIndex: activeIndex,
            onIndexChanged: (index) {
              updateActiveIndex(index);
            },
          ),
          activeIndex == 0
              ? const underProcessing()
              : activeIndex == 1
                  ? const Accepted()
                  : activeIndex == 2
                      ? const Confirmed()
                      : activeIndex == 3
                          ? const completed()
                          : const canceledRequests()
        ],
      ),
    );
  }
}
