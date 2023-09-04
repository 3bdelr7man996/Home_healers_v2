import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dr/core/extensions/media_query_extension.dart';

import 'app_colors.dart';
import 'app_font.dart';
import 'app_images.dart';
import 'app_strings.dart';

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
    double? height,
    double? width,
  }) {
    return FadeInImage.assetNetwork(
      image: imagePath,
      fit: BoxFit.fill,
      height: height,
      width: width,
      placeholder: AppImages.placeholderImage,
      imageErrorBuilder: (BuildContext context, x, u) =>
          customAssetImage(imagePath: AppImages.logoImage),
    );
  }

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
      BuildContext context, Widget screen, double x, double y) {
    Navigator.push(
      context,
      PageRouteBuilder(
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
}
