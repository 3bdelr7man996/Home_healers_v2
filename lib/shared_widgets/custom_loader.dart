import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({
    super.key,
    this.padding = 0.3,
  });
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.height * padding),
      child: Center(
          child: CircularProgressIndicator.adaptive(
        backgroundColor: AppColors.primaryColor.withOpacity(0.4),
        valueColor: const AlwaysStoppedAnimation<Color>(
          AppColors.primaryColor,
        ),
      )),
    );
  }
}
