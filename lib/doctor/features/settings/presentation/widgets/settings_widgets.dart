import 'dart:developer';

import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Personalinfo extends StatefulWidget {
  final bool switchValue;

  Personalinfo({Key? key, required this.switchValue}) : super(key: key);

  @override
  State<Personalinfo> createState() => _PersonalinfoState();
}

class _PersonalinfoState extends State<Personalinfo> {
  late bool switchValue;

  @override
  void initState() {
    super.initState();
    switchValue = widget.switchValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "personal_info".tr(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  switchValue ? "نشط الآن" : "غير نشط",
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Switch(
                  inactiveThumbColor: Colors.red,
                  inactiveTrackColor: const Color.fromARGB(174, 244, 67, 54),
                  activeColor: Colors.green,
                  value: switchValue,
                  onChanged: (value) {
                    setState(() {
                      switchValue = value;
                    });
                  },
                ),
              ],
            ),
            Text(
              "(إظهار وجودك للمرضى)",
              style: TextStyle(color: Colors.grey[400]),
            )
          ],
        ),
      ],
    );
  }
}

class OneOption extends StatelessWidget {
  final String iconPath, title;
  final Widget? routeScreen;
  final void Function()? onPressed;
  const OneOption({
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
          log("route screen != null");
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
              color: AppColors.textGrey,
            ),
          ),
          //const Icon(Icons.arrow_back_ios_new)
        ],
      ),
    );
  }
}
