// ignore_for_file: must_be_immutable

import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:dr/features/auth/presentation/pages/select_roll_for_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInOrLogOutButton extends StatelessWidget {
  bool IsUserGuest;
  SignInOrLogOutButton({super.key, required this.IsUserGuest});

  @override
  Widget build(BuildContext context) {
    return IsUserGuest == true
        ? Container(
            width: context.width,
            height: context.height * 0.05,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: AppColors.primaryColor,
              ),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('guest');
                AppConstants.customNavigation(
                    context, SelectRollForSignIn(), -1, 0);
              },
              child: Text('تسجيل دخول'),
            ),
          )
        : InkWell(
            onTap: () async {
              context.read<LoginCubit>().logOut();
              AppConstants.pushRemoveNavigator(context,
                  screen: const SelectRollForSignIn());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/log_out_setting_icon.svg",
                  width: 40,
                  height: 40,
                ),
                10.pw,
                const Text(
                  "تسجيل الخروج",
                  style: TextStyle(fontSize: 20, color: AppColors.primaryColor),
                ),
                20.ph
              ],
            ),
          );
  }
}
