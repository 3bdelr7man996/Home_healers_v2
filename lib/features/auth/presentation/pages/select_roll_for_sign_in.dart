import 'package:dr/Patient/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/shared_widgets/select_roll_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectRollForSignIn extends StatefulWidget {
  const SelectRollForSignIn({super.key});

  @override
  State<SelectRollForSignIn> createState() => _SelectRollForSignInState();
}

class _SelectRollForSignInState extends State<SelectRollForSignIn> {
  @override
  void initState() {
    context.read<AuthCubit>().getCurrentPosition();
    context.read<AuthCubitForPatient>().getCurrentPosition();
    super.initState();
  }

  int rollSelected = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NextButton(rollSelected: rollSelected),
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppConstants.customAssetImage(
              imagePath: AppImages.mainLogoTransp,
              width: context.width * 0.5,
              height: 150,
            ),
            // Image.asset(
            //   "assets/images/mainlogo.png",
            //   width: context.width * 0.9,
            // ),
            20.ph,
            Text(
              "sign_in".tr(),
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: context.width * 0.06),
            ),
            5.ph,
            Text("Explanation_of_logging_in_select_roll".tr(),
                style: TextStyle(fontSize: context.width * 0.04)),
            20.ph,
            InkWell(
              onTap: () {
                setState(() {
                  rollSelected = 0;
                });
              },
              child: CardIdentification(
                imagePath: "assets/images/patient.png",
                patient: true,
                title: "Roll_Title_For_Patient",
                opacity: rollSelected == 0 ? 1 : 0.5,
              ),
            ),
            20.ph,
            InkWell(
              onTap: () {
                setState(() {
                  rollSelected = 1;
                });
              },
              child: CardIdentification(
                imagePath: "assets/images/doctor.png",
                title: "Roll_Title_For_Doctor",
                opacity: rollSelected == 1 ? 1 : 0.5,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
