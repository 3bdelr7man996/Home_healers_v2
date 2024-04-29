import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/features/auth/presentation/pages/activate_account.dart';
import 'package:dr/features/auth/presentation/pages/confirm_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PopUpForForgetPassword extends StatelessWidget {
  const PopUpForForgetPassword({
    super.key,
    required this.email,
  });
  final String email;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AlertDialog(
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            10.ph,
            Text(
              "سيصلك رسالة علي بريدك الالكتروني او الواتس اب بها\n رابط لاستعادة كلمة المرور الخاصة بك",
              style: TextStyle(fontSize: 14.0),
              textAlign: TextAlign.center,
            ),
            AppConstants.customButton(context, onPressed: () {
              Navigator.pop(context);
              AppConstants.customNavigation(
                  context,
                  ActivateAccountScreen(
                    email: email,
                    cacheData: callBack,
                    fromForgetPass: true,
                  ),
                  -1,
                  0);
            }, title: "متابعة"),
          ],
        ),
      ),
    );
  }

  callBack({BuildContext? context}) {
    AppConstants.customNavigation(
      context!,
      ConfirmPasswordScreen(),
      -1,
      0,
    );
  }
}
