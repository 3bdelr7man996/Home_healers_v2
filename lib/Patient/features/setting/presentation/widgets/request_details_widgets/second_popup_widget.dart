import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit/my_order_cubit.dart';
import 'package:dr/Patient/features/setting/presentation/pages/my_requests_screen_for_patient.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPopUp extends StatelessWidget {
  const SecondPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () async {
              await context.read<MyOrdersCubit>().GetOrders(context);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const MyRequestsForPatient(activeIndex: 0)));
            },
            child: const Icon(
              Icons.close,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 50,
        width: 50,
        child: AppConstants.customAssetSvg(
          imagePath: AppImages.correctIcon,
          fit: BoxFit.none,
        ),
      ),
      15.ph,
      const Text(
        "تم حذف الطلب بنجاح",
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      10.ph,
    ]);
  }
}
