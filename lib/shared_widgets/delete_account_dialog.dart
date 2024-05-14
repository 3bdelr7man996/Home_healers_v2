import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        "هل تريد بالتأكيد حذف الحساب ؟",
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
      actions: [
        BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return state.deleteState == RequestState.loading
                ? SizedBox(
                    height: 12.0,
                    width: 12.0,
                    child: CustomLoader(
                      padding: 0,
                    ))
                : TextButton(
                    onPressed: () {
                      context.read<LoginCubit>().deleteAcc(context);
                    },
                    child: Text("نعم"),
                  );
          },
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("إلغاء"),
        ),
      ],
    );
  }
}
