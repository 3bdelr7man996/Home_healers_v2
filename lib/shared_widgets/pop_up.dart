import 'package:dr/Patient/features/home/presentation/pages/home_screen_for_patient.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/doctor/features/home/presentation/pages/home_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PopUpDialog extends StatelessWidget {
  final bool isAdvertise;
  const PopUpDialog({
    super.key,
    required this.isAdvertise,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) => false,
      child: AlertDialog(
        backgroundColor: Colors.white,
        content: Container(
          height: context.height * 0.3,
          alignment: Alignment.center,
          padding: EdgeInsets.all(15.0),
          // decoration: const BoxDecoration(
          //   color: Colors.white,
          //   borderRadius: BorderRadius.all(Radius.circular(10)),
          // ),
          // height: context.height * 0.3,
          // width: context.width * 0.8,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: AppConstants.customAssetSvg(
                    imagePath: AppImages.correctIcon,
                    fit: BoxFit.none,
                  ),
                ),
                10.ph,
                Text("Congratulations".tr()),
                10.ph,
                Text("account_created".tr()),
                10.ph,
                ElevatedButton(
                  onPressed: () {
                    AppConstants.pushRemoveNavigator(
                      context,
                      screen: isAdvertise
                          ? const HomeScreen(
                              selectedIndex: 0,
                            )
                          : HomeScreenForPatient(selectedIndex: 2),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: AppColors.primaryColor),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.primaryColor),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    fixedSize: MaterialStateProperty.all<Size>(
                        Size(context.width * 0.6, 50)),
                  ),
                  child: Text('go_to_main_screen'.tr()),
                ),
              ]),
        ),
      ),
    );
  }
}
