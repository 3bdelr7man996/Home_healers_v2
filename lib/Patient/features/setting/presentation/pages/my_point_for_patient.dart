import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/my_point_for_patient_widgets.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/doctor/features/settings/presentation/widgets/my_point_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyPointScreenForPatient extends StatefulWidget {
  const MyPointScreenForPatient({super.key});

  @override
  State<MyPointScreenForPatient> createState() =>
      _MyPointScreenForPatientState();
}

class _MyPointScreenForPatientState extends State<MyPointScreenForPatient> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, backButton: true, title: "my_point"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyPointsheaderForPatient(),
              20.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  10.pw,
                  Text(
                    "استمتع بالكاش باك",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                ],
              ),
              10.ph,
              Image.asset(
                'assets/images/restaurants.png',
              ),
              Image.asset(
                'assets/images/purchases.png',
                width: context.width,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/clothes.png',
                    width: context.width * 0.4,
                  ),
                  Image.asset(
                    'assets/images/Donations.png',
                    width: context.width * 0.4,
                  ),
                ],
              ),
              20.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  10.pw,
                  const Text(
                    "آخر نشاط",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                ],
              ),
              BlocBuilder<GetPointsCubit, GetPointsState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Divider(
                        thickness: 0.5,
                      ),
                      for (int i = 0;
                          i < state.Data.newPointsNotifications.length;
                          i++)
                        Activity(
                            Notification: state.Data.newPointsNotifications[i]),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
