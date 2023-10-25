import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/features/auth/presentation/cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../features/auth/presentation/pages/activation_code_screen.dart';

class PopUpForForgetPassword extends StatelessWidget {
  const PopUpForForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    _toggleVisibility() {
      context.read<ForgetPasswordCubit>().onShowPopUpChange();
    }

    var _isVisible =
        context.select((ForgetPasswordCubit cubit) => cubit.state.showPopUp);
    return Visibility(
      visible: _isVisible,
      child: Positioned.fill(
        child: GestureDetector(
          onTap: () {
            _toggleVisibility();
            AppConstants.customNavigation(
                context, ActivationCodeScreen(), -1, 0);
          },
          child: Container(
            color: Colors.black54,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    height: context.height * 0.20,
                    width: context.width * 0.8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/correct_icon.svg',
                                  width: 50,
                                  height: 50,
                                ),
                              ],
                            ),
                            Text(
                              "تم ارسال الايميل بنجاح!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                            10.ph,
                            Text(
                              "سيصلك رسالة علي بريدك الالكتروني بها\n رابط لاستعادة كلمة المرور الخاصة بك",
                              style: TextStyle(fontSize: 14.0),
                              textAlign: TextAlign.center,
                            ),
                          ]),
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
