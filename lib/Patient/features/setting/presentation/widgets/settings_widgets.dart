import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class OneOptionForPatient extends StatelessWidget {
  String IconPath, title;
  var routeScreen;
  OneOptionForPatient(
      {super.key,
      required this.IconPath,
      required this.title,
      this.routeScreen});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppConstants.customNavigation(context, routeScreen, -1, 0);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                IconPath,
                width: 40,
                height: 40,
              ),
              10.pw,
              Text(
                title,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Icon(Icons.arrow_back_ios_new)
        ],
      ),
    );
  }
}
