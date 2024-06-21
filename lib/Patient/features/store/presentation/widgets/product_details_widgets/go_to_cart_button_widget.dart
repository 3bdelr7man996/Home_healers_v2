import 'package:dr/Patient/features/store/presentation/pages/cart_screen.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GoToCartButtonWidget extends StatelessWidget {
  const GoToCartButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SizedBox(
          width: context.width,
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColors.secondryColor),
              ),
              onPressed: () {
                AppConstants.customNavigation(context, CartScreen(), -1, 0);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "الذهاب إلى سلة التسوق",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    10.pw,
                    SvgPicture.asset(
                      "assets/icons/basket_icon.svg",
                      width: 37.5,
                      color: Colors.white,
                      height: 37.5,
                    ),
                  ],
                ),
              ))),
    );
  }
}
