import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpTermsField extends StatelessWidget {
  const SignUpTermsField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return ListTile(
          leading: Checkbox(
            value: state.term,
            onChanged: (v) {
              context.read<AuthCubit>().onTermChange();
            },
            activeColor: AppColors.primaryColor,
          ),
          title: Text(
            'terms'.tr(),
            style: const TextStyle(color: AppColors.primaryColor, fontSize: 13),
          ),
        );
      },
    );
  }
}
