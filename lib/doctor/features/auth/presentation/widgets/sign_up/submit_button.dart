import 'package:dr/Patient/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonForSignUp extends StatelessWidget {
  final void Function()? onPressed;

  const ButtonForSignUp({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    bool Request = context
        .select((AuthCubitForPatient cubit) => cubit.state.requestStatus);
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: AppColors.primaryColor),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
            Request ? Colors.grey : AppColors.primaryColor),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        fixedSize:
            MaterialStateProperty.all<Size>(Size(context.width * 0.8, 50)),
      ),
      child: Request
          ? CircularProgressIndicator(
              color: Colors.white,
            )
          : Text('create_account'.tr()),
    );
  }
}
