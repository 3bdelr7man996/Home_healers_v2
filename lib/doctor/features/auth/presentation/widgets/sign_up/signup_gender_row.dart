import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_font.dart';
import 'package:dr/doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/shared_widgets/gender_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpGenderField extends StatelessWidget {
  const SignUpGenderField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "gender".tr(),
            style: bigBlackFont(fontWeight: FontWeight.w500),
          ),
          5.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return GenderButton(
                    title: "male".tr(),
                    isSelected: state.gender == "male",
                    onPressed: () {
                      context.read<AuthCubit>().onGenderChange("male");
                    },
                  );
                },
              ),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return GenderButton(
                    title: "female".tr(),
                    isSelected: state.gender == "female",
                    onPressed: () {
                      context.read<AuthCubit>().onGenderChange("female");
                    },
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
