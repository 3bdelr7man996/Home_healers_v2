import 'package:dr/Patient/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class GenderButton extends StatelessWidget {
  final String title;
  final String gender;
  bool fromPatient;
  bool fromSetting;
  GenderButton(
      {super.key,
      this.title = "",
      required this.gender,
      this.fromSetting = false,
      this.fromPatient = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
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
              if (fromSetting)
                context.read<UpdateInfoCubit>().onGenderChange(gender);
              fromPatient
                  ? context.read<AuthCubitForPatient>().onGenderChange(gender)
                  : context.read<AuthCubit>().onGenderChange(gender);
            },
            child: Text(title.tr()),
          ),
        );
      },
    );
  }
}
