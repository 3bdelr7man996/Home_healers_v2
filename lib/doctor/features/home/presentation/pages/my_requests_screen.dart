import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/doctor/features/home/presentation/widgets/my_requests_widgets.dart';
import 'package:flutter/material.dart';

class MyRequestsScreen extends StatefulWidget {
  final int activeIndex;

  const MyRequestsScreen({super.key, this.activeIndex = 0});

  @override
  _MyRequestsScreenState createState() => _MyRequestsScreenState();
}

class _MyRequestsScreenState extends State<MyRequestsScreen> {
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
      appBar: customAppBar(context,
          backButton: true, title: "muscle_and_joint_injuries_requests"),
      body: Column(
        children: [
          SizedBox(height: 20),
          Categories(
            categories: const [
              "المراجعة",
              "انتظار الدفع",
              "تم الدفع",
              "المنتهية",
              "الملغية",
            ],
            activeIndex: activeIndex,
            onIndexChanged: (index) {
              updateActiveIndex(index);
            },
          ),
          activeIndex == 0
              ? const Review()
              : activeIndex == 1
                  ? const awaitingPayment()
                  : activeIndex == 2
                      ? const PaymentWasMade()
                      : activeIndex == 3
                          ? const Finished()
                          : const Canceled(),
        ],
      ),
    );
  }
}
