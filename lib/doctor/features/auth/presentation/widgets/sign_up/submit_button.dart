import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ButtonForSignUp extends StatelessWidget {
  final VoidCallback _toggleVisibility;
  const ButtonForSignUp(
      {super.key,
      required VoidCallback toggleVisibility,
      required bool isVisible})
      : _toggleVisibility = toggleVisibility;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _toggleVisibility();
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: AppColors.primaryColor),
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all<Color>(AppColors.primaryColor),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        fixedSize:
            MaterialStateProperty.all<Size>(Size(context.width * 0.8, 50)),
      ),
      child: Text('create_account'.tr()),
    );
  }
}
