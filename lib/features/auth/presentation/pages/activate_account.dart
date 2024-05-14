import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/features/auth/presentation/widgets/activate_account/verfication_code_form.dart';
import 'package:dr/features/auth/presentation/cubit/forget_cubit/forget_password_cubit.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivateAccountScreen extends StatelessWidget {
  const ActivateAccountScreen({
    super.key,
    required this.email,
    required this.cacheData,
    this.isAdvertise = false,
    this.fromForgetPass = false,
  });
  final String email;
  final bool isAdvertise;
  final Function({BuildContext? context})? cacheData;
  final bool fromForgetPass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: "activation_code",
        backButton: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                40.ph,
                Image.asset("assets/images/activation_code.png"),
                40.ph,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "كود التفعيل",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25.0),
                    ),
                  ],
                ),
                20.ph,
                const Text(
                  "من فضلك ادخل الكود المرسل الي الواتس اب ",
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
                30.ph,
                const VerficationForm(),
                30.ph,
                BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                  builder: (context, state) {
                    if (state.resendCodeState == RequestState.loading) {
                      return CupertinoActivityIndicator();
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("ألم تتلقى الرمز ؟"),
                          5.pw,
                          InkWell(
                            onTap: () {
                              context
                                  .read<ForgetPasswordCubit>()
                                  .resendCode(email: email);
                            },
                            child: const Text(
                              "إعادة إرسال",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      );
                    }
                  },
                ),
                30.ph,
                BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                  builder: (context, state) {
                    if (state.activeState == RequestState.loading) {
                      return CustomLoader(
                        padding: 0,
                      );
                    } else {
                      return Container(
                        width: context.width * 0.8,
                        height: context.height * 0.05,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<ForgetPasswordCubit>().activateAccount(
                                  context,
                                  email: email,
                                  code: state.code,
                                  cacheData: cacheData,
                                  isAdvertise: isAdvertise,
                                  fromForgetPass: fromForgetPass,
                                );
                            //todo
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'متابعة',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
