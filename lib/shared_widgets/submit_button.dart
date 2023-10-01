import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color backGroundColor;
  final String title;
  const SubmitButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.backGroundColor = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.width * 0.03),
          ),
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          const Size(double.infinity, 50),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          backGroundColor,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
