import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit/my_order_cubit.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/my_requests_widgets_for_patient/list_of_order_widget.dart';
import 'package:dr/Patient/features/store/presentation/pages/store_orders_screen.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/doctor/features/home/presentation/widgets/my_requests_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    context.read<MyOrdersCubit>().GetOrders(context);
  }

  void updateActiveIndex(int newIndex) {
    setState(() {
      activeIndex = newIndex;
    });
  }

  String shoWidget = "doctors requests";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, backButton: true, title: "my_requests"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 0.4 * context.width,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            shoWidget = "doctors requests";
                          });
                        },
                        child: Text(
                          "الحجوزات",
                          style: TextStyle(
                              color: shoWidget == "doctors requests"
                                  ? AppColors.primaryColor
                                  : Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: shoWidget == "doctors requests"
                              ? Colors.white
                              : AppColors.primaryColor,
                          side: BorderSide(
                              color: AppColors.primaryColor,
                              width:
                                  shoWidget == "doctors requests" ? 0.0 : 2.0),
                        ),
                      )),
                  Container(
                      width: 0.4 * context.width,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            shoWidget = "store requests";
                          });
                        },
                        child: Text(
                          "المتجر",
                          style: TextStyle(
                              color: shoWidget == "doctors requests"
                                  ? Colors.white
                                  : AppColors.primaryColor),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: shoWidget == "doctors requests"
                              ? AppColors.primaryColor
                              : Colors.white,
                          side: BorderSide(
                              color: AppColors.primaryColor,
                              width:
                                  shoWidget == "doctors requests" ? 0.0 : 2.0),
                        ),
                      )),
                ],
              ),
            ),
            shoWidget == "doctors requests"
                ? Column(
                    children: [
                      20.ph,
                      Categories(
                        categories: const [
                          "قيد المعالجة",
                          "المقبولة",
                          "المؤكدة",
                          "المكتملة",
                          "الملغية",
                          // "قيد الانتظار",
                        ],
                        activeIndex: activeIndex,
                        onIndexChanged: (index) {
                          updateActiveIndex(index);
                        },
                      ),
                      ListOfOrder(TabIndexClicked: activeIndex)
                    ],
                  )
                : StoreOrdersScreen()
          ],
        ),
      ),
    );
  }
}
