// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:dr/core/utils/cache_helper.dart';
import 'package:dr/doctor/features/home/data/models/tab_info.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:maps_launcher/maps_launcher.dart';

import 'app_colors.dart';
import 'app_font.dart';
import 'app_strings.dart';

Future<String> getAttributeFromSharedPreferences() async {
  String attribute = CacheHelper.getData(key: AppStrings.userInfo);
  return attribute;
}

enum ResevationStep {
  reviewing,
  wait_confirm,
  confirmed,
  completed,
  canceled,
}

List<TabInfo> reservationTabs = [
  TabInfo(ResevationStep.reviewing, "reviewing".tr()),
  TabInfo(ResevationStep.wait_confirm, "wait_confirm".tr()),
  TabInfo(ResevationStep.confirmed, "confirmed".tr()),
  TabInfo(ResevationStep.completed, "completed".tr()),
  TabInfo(ResevationStep.canceled, "canceled".tr()),
];

class AppConstants {
  static customButton(
    BuildContext context, {
    required void Function()? onPressed,
    required String title,
    double widthRatio = 0.8,
    double hightRatio = 0.06,
    backgroundColor = AppColors.primaryColor,
    textColor = Colors.white,
    isBoldedText = true,
    String iconUrl = "",
    double elevation = 0,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(elevation),
        enableFeedback: true,
        //side: MaterialStateProperty.all(const BorderSide()),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        shadowColor: MaterialStateProperty.all(AppColors.primaryColor),
        fixedSize: MaterialStateProperty.all(
          Size(context.width * widthRatio, context.height * hightRatio),
        ),
      ),
      child: iconUrl.isEmpty
          ? Text(
              title,
              style: sBigBlackFont().copyWith(
                  color: textColor,
                  fontWeight:
                      isBoldedText ? FontWeight.bold : FontWeight.normal),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: sBigBlackFont().copyWith(
                      color: textColor,
                      fontWeight:
                          isBoldedText ? FontWeight.bold : FontWeight.normal),
                ),
                const SizedBox(
                  width: 5,
                ),
                customAssetImage(
                  imagePath: "${AppStrings.assetsIconsPath}$iconUrl",
                ),
              ],
            ),
    );
  }

  static customAssetImage({
    required String imagePath,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    height,
    width,
    Color? color,
    BoxFit? fit = BoxFit.cover,
  }) {
    return Padding(
      padding: padding,
      child: Image.asset(
        imagePath,
        height: height?.toDouble(),
        color: color,
        width: width?.toDouble(),
        fit: fit,
      ),
    );
  }

  static customFileImage({
    required File file,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    height,
    width,
    Color? color,
    BoxFit? fit = BoxFit.cover,
  }) {
    return Padding(
      padding: padding,
      child: Image.file(
        file,
        height: height?.toDouble(),
        color: color,
        width: width?.toDouble(),
        fit: fit,
      ),
    );
  }

  static customNetworkImage({
    required String imagePath,
    String imgBaseUrl = "http://admin.home-healers.com/upload/",
    String imageError = 'assets/images/logo.png',
    double? height,
    double? width,
    BoxFit? fit = BoxFit.fill,
  }) {
    return Image.network(
      imgBaseUrl + imagePath,
      fit: fit,
      height: height,
      width: width,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Center(
          child: SizedBox(
            height: 20.0,
            width: 20.0,
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          ),
        );
      },
      errorBuilder: (context, x, u) => customAssetImage(
        imagePath: imageError,
        height: height,
        width: width,
      ),
    );
  }

  // static customNetworkImage({
  //   required String imagePath,
  //   String imgBaseUrl = "https://dev.home-healers.com/upload/",
  //   String placeholder = "assets/images/placeholder.png",
  //   String imageError = "assets/images/logo.png",
  //   double? height,
  //   double? width,
  //   BoxFit? fit = BoxFit.fill,
  // }) {
  //   return FadeInImage.assetNetwork(
  //     image: imgBaseUrl + imagePath,
  //     fit: fit,
  //     height: height,
  //     width: width,
  //     placeholder: placeholder,
  //     imageErrorBuilder: (BuildContext context, x, u) =>
  //         customAssetImage(imagePath: imageError),
  //   );
  // }

  ///show asset svg
  static customAssetSvg(
      {required String imagePath,
      double? height,
      double? width,
      EdgeInsetsGeometry? margin,
      Color? color,
      double radius = 0,
      BoxFit fit = BoxFit.cover}) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: SvgPicture.asset(
        imagePath,
        color: color,
        height: height,
        width: width,
        fit: fit,
      ),
    );
  }

  static customNavigation(
    BuildContext context,
    Widget screen,
    double x,
    double y,
  ) async {
    await Navigator.push(
      context,
      PageRouteBuilder(
        settings: RouteSettings(name: screen.toString()),
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(x, y),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return screen;
        },
      ),
    );
  }

  static pushRemoveNavigator(BuildContext context, {required Widget screen}) {
    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        settings: RouteSettings(name: screen.toString()),
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(3, 3),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return screen;
        },
      ),
      (route) => false,
    );
  }

  static customListTile(
      {required String imgName,
      required String title,
      void Function()? onTap}) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(12),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: Image.asset(
            "assets/icons/$imgName.png",
            color: AppColors.primaryColor,
            width: 25,
            height: 25,
          ),
          title: Text(title,
              style: sBigBlackFont().copyWith(
                color: AppColors.primaryColor,
              )),
          style: ListTileStyle.list,
          onTap: onTap,
        ),
      ),
    );
  }

  static launchURL(String url) async => await canLaunchUrl(Uri.parse(url))
      ? await launchUrl(Uri.parse(url))
      : throw 'Could not launch $url';
  static launchMaps(String url) async => MapsLauncher.launchQuery(url);
}
