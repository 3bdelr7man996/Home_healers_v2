import 'package:dr/Patient/features/auth/presentation/widgets/injury_area_widgets.dart';
import 'package:dr/Patient/features/home/presentation/pages/home_screen_for_patient.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class InjuryAreaScreen extends StatefulWidget {
  const InjuryAreaScreen({super.key});

  @override
  State<InjuryAreaScreen> createState() => _InjuryAreaScreenState();
}

class _InjuryAreaScreenState extends State<InjuryAreaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: "injury_area", backButton: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/body.png"),
                  ],
                ),
                20.ph,
                RowForCheckbox(title1: "القدم", title2: "الكاحل"),
                10.ph,
                RowForCheckbox(title1: "القدم", title2: "الكاحل"),
                10.ph,
                RowForCheckbox(title1: "الرسخ", title2: "أخرى"),
                30.ph,
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: context.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      primary: AppColors.primaryColor,
                    ),
                    onPressed: () {
                      AppConstants.customNavigation(context,
                          HomeScreenForPatient(selectedIndex: 2), 1, 0);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: const Text(
                        'متابعة',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                10.ph,
                SizedBox(
                  width: context.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.transparent,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'تخطي',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
