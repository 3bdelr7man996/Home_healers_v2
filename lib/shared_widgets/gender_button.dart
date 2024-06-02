import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GenderButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final void Function()? onPressed;

  GenderButton({
    super.key,
    this.title = "",
    this.isSelected = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.3,
      height: context.height * 0.05,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: isSelected
                  ? const BorderSide(color: AppColors.primaryColor, width: 1.5)
                  : BorderSide.none,
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black54),
        ),
        onPressed: onPressed,
        // () {
        //   if (fromSetting)
        //     context.read<EditUserAccCubit>().onGenderChange(gender);
        //   fromPatient
        //       ? context.read<AuthCubitForPatient>().onGenderChange(gender)
        //       : context.read<AuthCubit>().onGenderChange(gender);
        // },
        child: Text(title.tr()),
      ),
    );
  }
}
