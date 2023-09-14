import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/shared_widgets/custom_titled_text_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpNameField extends StatelessWidget {
  const SignUpNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TiteldTextFormField(
            title: "first_name".tr(),
            prefixIconPath: AppImages.personIcon,
            validate: true,
            validateMsg: "required".tr(),
            onChanged: (p0) => context.read<AuthCubit>().onFNameChange(p0),
          ),
        ),
        15.pw,
        Expanded(
          child: TiteldTextFormField(
            title: "last_name".tr(),
            prefixIconPath: AppImages.personIcon,
            validate: true,
            validateMsg: "required".tr(),
            onChanged: (p0) => context.read<AuthCubit>().onLNameChange(p0),
          ),
        ),
      ],
    );
  }
}
