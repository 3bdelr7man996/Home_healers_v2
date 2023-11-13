// ignore_for_file: must_be_immutable

import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:flutter/material.dart';

class CardWay extends StatelessWidget {
  String iconPath, title;
  final bool selected;
  final void Function()? onTap;
  CardWay({
    super.key,
    required this.iconPath,
    required this.title,
    this.selected = false,
    this.onTap,
  });
  // void _showBottomSheet(BuildContext context, String IconPath) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return SizedBox(
  //         height: 350,
  //         child: Padding(
  //           padding: const EdgeInsets.all(20.0),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               const Text(
  //                 "اكتب البيانات",
  //                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
  //               ),
  //               10.ph,
  //               TextField(
  //                 decoration: InputDecoration(
  //                   hintText: 'اسم البطاقة',
  //                   suffixIcon: Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: SvgPicture.asset(
  //                       IconPath,
  //                       width: 5,
  //                       height: 5,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               20.ph,
  //               const TextField(
  //                 decoration: InputDecoration(
  //                   hintText: 'رقم البطاقة',
  //                 ),
  //               ),
  //               20.ph,
  //               Row(
  //                 children: [
  //                   const Expanded(
  //                     child: TextField(
  //                       decoration: InputDecoration(
  //                         hintText: 'تاريخ الانتهاء',
  //                       ),
  //                     ),
  //                   ),
  //                   10.pw,
  //                   const Expanded(
  //                     child: TextField(
  //                       decoration: InputDecoration(
  //                         hintText: 'cvv',
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               20.ph,
  //               SizedBox(
  //                 width: context.width,
  //                 height: 50,
  //                 child: ElevatedButton(
  //                   style: ButtonStyle(
  //                     backgroundColor: MaterialStateProperty.all<Color>(
  //                         AppColors.primaryColor),
  //                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //                       RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(10),
  //                       ),
  //                     ),
  //                   ),
  //                   onPressed: () {},
  //                   child: const Text('تأكيد الدفع'),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      // _showBottomSheet(context, "assets/icons/master_card_icon.svg");
      child: Container(
        width: context.width,
        height: 60,
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: selected ? AppColors.primaryColor : Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            iconPath.endsWith('svg')
                ? AppConstants.customAssetSvg(
                    imagePath: iconPath,
                  )
                : AppConstants.customAssetImage(
                    imagePath: iconPath,
                    width: 25,
                    // height: 25,
                  ),
            20.pw,
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            //const Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
