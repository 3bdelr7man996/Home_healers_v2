import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CopunFieldWidget extends StatelessWidget {
  const CopunFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: 'ادخل كود الخصم',
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              "assets/icons/percent_icon.svg",
              width: 5,
              height: 5,
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'تأكيد',
              style: TextStyle(
                  fontSize: 14.0,
                  decoration: TextDecoration.underline,
                  color: AppColors.primaryColor),
            ),
          )),
      onChanged: (coupon) {},
    );
  }
}
