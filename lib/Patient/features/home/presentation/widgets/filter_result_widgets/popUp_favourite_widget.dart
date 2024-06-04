import 'package:dr/Patient/features/home/presentation/pages/home_screen_for_patient.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PopUpForAddToFavourite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
          ),
          15.ph,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/correct_icon.svg',
                  width: 25,
                  height: 25,
                ),
                10.pw,
                Expanded(child: const Text("تمت الإضافة إلى المفضلة")),
                10.pw,
                InkWell(
                  onTap: () {
                    AppConstants.customNavigation(
                        context, HomeScreenForPatient(selectedIndex: 3), -1, 0);
                  },
                  child: const Text(
                    "المفضلة",
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
