import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';

PreferredSizeWidget customAppBar(
  BuildContext context, {
  String title = '',
  bool backButton = true,
}) {
  return AppBar(
    centerTitle: true,
    leading: backButton
        ? Container(
            margin: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 199, 244, 253),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.primaryColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        : const SizedBox(),
    backgroundColor: AppColors.backGroundColor,
    shadowColor: Colors.grey.withOpacity(0.5),
    elevation: 8,
    title: Text(
      title.tr(),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
        color: Colors.black,
      ),
    ),
  );
}
