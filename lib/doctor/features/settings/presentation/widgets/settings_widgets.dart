import 'dart:developer';

import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/settings/presentation/cubit/setting_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class Personalinfo extends StatelessWidget {
  Personalinfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "personal_info".tr(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        BlocBuilder<SettingCubit, SettingState>(
          builder: (context, state) {
            return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      state.userActive ? "نشط الآن" : "غير نشط",
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Switch(
                      inactiveThumbColor: Colors.red,
                      inactiveTrackColor:
                          const Color.fromARGB(174, 244, 67, 54),
                      activeColor: Colors.green,
                      value: state.userActive,
                      onChanged: (value) async {
                        context.read<SettingCubit>().changeActiveStatus();
                      },
                    ),
                  ],
                ),
                Text(
                  "(إظهار وجودك للمرضى)",
                  style: TextStyle(color: Colors.grey[400]),
                )
              ],
            );
          },
        )
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
        } else if (onPressed != null) {
          onPressed!();
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
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ),
          //const Icon(Icons.arrow_back_ios_new)
        ],
      ),
    );
  }
}
