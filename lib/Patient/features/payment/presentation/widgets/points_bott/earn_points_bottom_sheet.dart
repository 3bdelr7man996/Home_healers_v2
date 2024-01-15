import 'package:dr/Patient/features/setting/presentation/pages/my_point_for_patient.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/cache_helper.dart';
import 'package:dr/doctor/features/settings/presentation/pages/my_point_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SheetForEarnMoney extends StatelessWidget {
  const SheetForEarnMoney({
    super.key,
    required this.title,
    required this.body,
  });
  final String? body;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 350,
        width: context.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "$title",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor),
              ),
              10.ph,
              Text(
                body ?? '',
                maxLines: 3,
              ),
              10.ph,
              SvgPicture.asset(
                "assets/icons/congrate_for_points.svg",
                width: context.width,
                height: 120,
              ),
              20.ph,
              Container(
                width: context.width * 0.8,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    AppConstants.customNavigation(
                        context,
                        CacheHelper.getData(key: AppStrings.isAdvertise)
                            ? MyPointScreen()
                            : MyPointScreenForPatient(),
                        0,
                        -1);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text('تابع تقدم نقاطك'),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
