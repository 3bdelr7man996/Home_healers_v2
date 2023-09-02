import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/shared_widgets/select_roll_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SelectRollForSignIn extends StatefulWidget {
  const SelectRollForSignIn({super.key});

  @override
  State<SelectRollForSignIn> createState() => _SelectRollForSignInState();
}

class _SelectRollForSignInState extends State<SelectRollForSignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NextButton(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/mainlogo.png",
            width: context.width * 0.9,
          ),
          Text(
            "sign_in".tr(),
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: context.width * 0.06),
          ),
          5.ph,
          Text("Explanation_of_logging_in_select_roll".tr(),
              style: TextStyle(fontSize: context.width * 0.04)),
          20.ph,
          const CardIdentification(
            imagePath: "assets/images/patient.png",
            title: "Roll_Title_For_Patient",
            opacity: 0.5,
          ),
          20.ph,
          const CardIdentification(
            imagePath: "assets/images/doctor.png",
            title: "Roll_Title_For_Doctor",
            opacity: 1,
          ),
        ],
      )),
    );
  }
}
