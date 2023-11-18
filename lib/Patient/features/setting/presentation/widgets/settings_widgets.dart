import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OneOptionForPatient extends StatelessWidget {
  final String iconPath, title;
  final Widget? routeScreen;
  final void Function()? onPressed;
  const OneOptionForPatient({
    super.key,
    required this.iconPath,
    required this.title,
    this.routeScreen,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (routeScreen != null) {
          AppConstants.customNavigation(context, routeScreen!, -1, 0);
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconPath,
                width: 40,
                height: 40,
              ),
              10.pw,
              Text(
                title,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
