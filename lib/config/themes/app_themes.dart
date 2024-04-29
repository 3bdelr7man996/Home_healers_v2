import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
    scaffoldBackgroundColor: AppColors.backGroundColor,
    fontFamily: 'Tajawal-Regular',
    appBarTheme: const AppBarTheme(
      color: AppColors.primaryColor,
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(borderSide: BorderSide.none),
      hintStyle: const TextStyle(color: AppColors.strokColor),
      fillColor: AppColors.whiteColor,
      filled: true,
      isDense: true,
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.borderColor,
          ),
          borderRadius: BorderRadius.circular(15)),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.borderColor,
          ),
          borderRadius: BorderRadius.circular(15)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
       foregroundColor: Colors.white,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),) ,
      textStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    )),
  );
}
