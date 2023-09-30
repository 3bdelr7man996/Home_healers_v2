import 'dart:developer';

import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/cache_helper.dart';
import 'package:dr/doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/doctor/features/home/presentation/pages/home_screen.dart';
import 'package:dr/doctor/features/settings/presentation/cubit/setting_cubit.dart';
import 'package:dr/features/auth/presentation/pages/select_roll_for_sign_in.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> initConfigData() async {
    await Future.wait([
      context.read<SettingCubit>().getAppInfo(),
      context.read<AuthCubit>().getAllDepartements(),
      context.read<AuthCubit>().getAllStatus(),
      context.read<AuthCubit>().getAllCities(),
      context.read<AuthCubit>().getCurrentPosition(),
    ]);
  }

  @override
  void initState() {
    log("Token ${CacheHelper.getData(key: AppStrings.userToken)}");
    log("user info    ${CacheHelper.getData(key: AppStrings.userInfo)}");
    initConfigData().then((value) {
      if (CacheHelper.dataSaved(key: AppStrings.userToken)) {
        if (CacheHelper.getData(key: AppStrings.isAdvertise)) {
          AppConstants.pushRemoveNavigator(context,
              screen: const HomeScreen(selectedIndex: 0));
        }
      } else {
        AppConstants.pushRemoveNavigator(context,
            screen: const SelectRollForSignIn());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: context.width,
          height: context.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color(0xff5C99A6),
                Color(0xff8265C5),
                Color(0xff8D56CE),
                Color(0xffB61EEF),
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppConstants.customAssetImage(
                imagePath: AppImages.logoImage,
                width: context.width / 2,
                height: context.width / 2,
                fit: BoxFit.contain,
              ),
              15.ph,
              const CustomLoader(
                padding: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
