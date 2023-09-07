import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_font.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextFormFieldForChangePassword extends StatelessWidget {
  final int num;
  final String title;
  final String icon;

  TextFormFieldForChangePassword(
      {super.key, required this.num, required this.title, required this.icon});

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
          decoration: InputDecoration(
            suffixIcon: num == 4
                ? SizedBox(
                    height: 18,
                    width: 18,
                    child: AppConstants.customAssetSvg(
                      imagePath: AppImages.showPasswordIcon,
                      fit: BoxFit.none,
                    ),
                  )
                : num == 5
                    ? SizedBox(
                        height: 18,
                        width: 18,
                        child: AppConstants.customAssetSvg(
                          imagePath: AppImages.hiddenPassIcon,
                          fit: BoxFit.none,
                        ),
                      )
                    : null,
            hintText: title.tr(),
            prefixIcon: SizedBox(
              height: 18,
              width: 18,
              child: AppConstants.customAssetSvg(
                imagePath: icon,
                fit: BoxFit.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PopUpForChangePassword extends StatelessWidget {
  final VoidCallback _toggleVisibility;
  final bool _isVisible;
  PopUpForChangePassword(
      {super.key,
      required VoidCallback toggleVisibility,
      required bool isVisible})
      : this._isVisible = isVisible,
        _toggleVisibility = toggleVisibility;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: Positioned.fill(
        child: GestureDetector(
          onTap: _toggleVisibility,
          child: Container(
            color: Colors.black54,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: context.height * 0.3),
                  child: Center(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      height: context.height * 0.2,
                      width: context.width * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.close,
                                    color: AppColors.primaryColor,
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/correct_icon.svg',
                                      width: 50,
                                      height: 50,
                                    ),
                                    20.ph,
                                    Text(
                                      "password_changed".tr(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
