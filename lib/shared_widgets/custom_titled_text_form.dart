import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_font.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TiteldTextFormField extends StatelessWidget {
  final String title;
  final String? suffixIconPath;
  final String? prefixIconPath;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool validate;
  final String? validateMsg;
  final void Function(String)? onChanged;
  const TiteldTextFormField({
    super.key,
    required this.title,
    this.suffixIconPath,
    this.prefixIconPath,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validate = true,
    this.validateMsg,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.tr(),
          style: bigBlackFont(fontWeight: FontWeight.w500),
        ),
        5.ph,
        TextFormField(
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: validate
              ? (value) {
                  if (value == null || value.isEmpty) {
                    return validateMsg;
                  } else {
                    return null;
                  }
                }
              : null,
          onChanged: onChanged,
          decoration: InputDecoration(
            suffixIcon: suffixIconPath != null
                ? SizedBox(
                    height: 18,
                    width: 18,
                    child: AppConstants.customAssetSvg(
                      imagePath: suffixIconPath!, //AppImages.showPasswordIcon,
                      fit: BoxFit.none,
                    ),
                  )
                : null,
            hintText: title.tr(),
            prefixIcon: prefixIconPath != null
                ? SizedBox(
                    height: 18,
                    width: 18,
                    child: AppConstants.customAssetSvg(
                      imagePath: prefixIconPath!,
                      fit: BoxFit.none,
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}