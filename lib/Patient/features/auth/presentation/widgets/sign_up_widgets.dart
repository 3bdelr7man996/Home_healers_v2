import 'package:dr/Patient/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_font.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFormFieldForSignUpForPatient extends StatelessWidget {
  final int num;
  final String title;
  final String icon;

  TextFormFieldForSignUpForPatient(
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
          obscureText: num == 4
              ? context.select(
                  (AuthCubitForPatient cubit) => cubit.state.obscurePass)
              : num == 5
                  ? context.select((AuthCubitForPatient cubit) =>
                      cubit.state.obscureConfPass)
                  : false,
          decoration: InputDecoration(
            suffixIcon: num == 4
                ? context.select(
                        (AuthCubitForPatient cubit) => cubit.state.obscurePass)
                    ? InkWell(
                        onTap: () {
                          context.read<AuthCubitForPatient>().showPassword();
                        },
                        child: SizedBox(
                          height: 18,
                          width: 18,
                          child: AppConstants.customAssetSvg(
                            imagePath: AppImages.hiddenPassIcon,
                            fit: BoxFit.none,
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          context.read<AuthCubitForPatient>().showPassword();
                        },
                        child: SizedBox(
                          height: 18,
                          width: 18,
                          child: AppConstants.customAssetSvg(
                            imagePath: AppImages.showPasswordIcon,
                            fit: BoxFit.none,
                          ),
                        ),
                      )
                : num == 5
                    ? context.select((AuthCubitForPatient cubit) =>
                            cubit.state.obscureConfPass)
                        ? InkWell(
                            onTap: () {
                              context
                                  .read<AuthCubitForPatient>()
                                  .showConfPassword();
                            },
                            child: SizedBox(
                              height: 18,
                              width: 18,
                              child: AppConstants.customAssetSvg(
                                imagePath: AppImages.hiddenPassIcon,
                                fit: BoxFit.none,
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              context
                                  .read<AuthCubitForPatient>()
                                  .showConfPassword();
                            },
                            child: SizedBox(
                              height: 18,
                              width: 18,
                              child: AppConstants.customAssetSvg(
                                imagePath: AppImages.showPasswordIcon,
                                fit: BoxFit.none,
                              ),
                            ),
                          )
                    : null,
            hintText: title.tr(),
            prefixIcon: num == 7
                ? null
                : SizedBox(
                    height: 18,
                    width: 18,
                    child: AppConstants.customAssetSvg(
                      imagePath: icon,
                      fit: BoxFit.none,
                    ),
                  ),
          ),
          onChanged: (value) {
            if (num == 1)
              context.read<AuthCubitForPatient>().onFNameChange(value);
            else if (num == 2)
              context.read<AuthCubitForPatient>().onLNameChange(value);
            else if (num == 3)
              context.read<AuthCubitForPatient>().onEmailChange(value);
            else if (num == 8)
              context.read<AuthCubitForPatient>().onPhoneChange(value);
            else if (num == 7)
              context.read<AuthCubitForPatient>().onIdentificationChange(value);
            else if (num == 4)
              context.read<AuthCubitForPatient>().onPassWordChange(value);
            else if (num == 5)
              context.read<AuthCubitForPatient>().onConfPassChange(value);
          },
        ),
      ],
    );
  }
}

class GenderButtonForSignUpForPatient extends StatelessWidget {
  final String title;
  final String gender;

  GenderButtonForSignUpForPatient({
    super.key,
    this.title = "",
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubitForPatient, AuthStateForPatient>(
      builder: (context, state) {
        return SizedBox(
          width: context.width * 0.3,
          height: context.height * 0.05,
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: (state.gender != null && state.gender == gender)
                      ? const BorderSide(
                          color: AppColors.primaryColor, width: 1.5)
                      : BorderSide.none,
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black54),
            ),
            onPressed: () {
              context.read<AuthCubitForPatient>().onGenderChange(gender);
            },
            child: Text(title.tr()),
          ),
        );
      },
    );
  }
}
