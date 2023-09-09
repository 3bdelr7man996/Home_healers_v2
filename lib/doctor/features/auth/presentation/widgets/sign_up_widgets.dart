import 'package:dr/Patient/features/auth/presentation/pages/injury_area_screen.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_font.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/doctor/features/home/presentation/pages/home_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TextFormFieldForSignUp extends StatelessWidget {
  final int num;
  final String title;
  final String icon;

  TextFormFieldForSignUp(
      {super.key, required this.num, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.tr(),
          style: bigBlackFont(fontWeight: FontWeight.w500),
        ),
        5.ph,
        TextFormField(
          decoration: InputDecoration(
            suffixIcon: num == 4
                ? SizedBox(
                    height: 18,
                    width: 18,
                    child: AppConstants.customAssetSvg(
                      imagePath: AppImages.showPasswordIcon,
                      fit: BoxFit.none,
                    ),
                  )
                : num == 5
                    ? SizedBox(
                        height: 18,
                        width: 18,
                        child: AppConstants.customAssetSvg(
                          imagePath: AppImages.hiddenPassIcon,
                          fit: BoxFit.none,
                        ),
                      )
                    : null,
            hintText: title.tr(),
            prefixIcon: num == 7
                ? null
                : SizedBox(
                    height: 18,
                    width: 18,
                    child: AppConstants.customAssetSvg(
                      imagePath: icon,
                      fit: BoxFit.none,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}

class GenderButton extends StatelessWidget {
  final int num;
  final String title;
  const GenderButton({super.key, int num = 0, String title = ""})
      : this.num = num,
        this.title = title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.3,
      height: context.height * 0.05,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: const BorderSide(color: AppColors.primaryColor, width: 1.5),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black54),
        ),
        onPressed: () {},
        child: Text(title.tr()),
      ),
    );
  }
}

class BottomSheetForSignUP extends StatelessWidget {
  final int num;
  final String title;
  const BottomSheetForSignUP({super.key, int num = 0, String title = ""})
      : this.num = num,
        this.title = title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.tr(),
            style: bigBlackFont(fontWeight: FontWeight.w500),
          ),
          5.ph,
          SizedBox(
            height: context.height * 0.05,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black54,
                side: const BorderSide(color: Colors.black54, width: 0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return num == 1
                        ? const OptionsForJobTitle()
                        : const OptionsForsection();
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title.tr()),
                  const Icon(Icons.arrow_forward_ios_outlined),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OptionsForJobTitle extends StatelessWidget {
  const OptionsForJobTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.height * 0.35,
        color: Colors.white,
        child: Column(
          children: [
            10.ph,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'select_job_title'.tr(),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Senior_Physical_Therapist".tr()),
                  const Radio(
                      value: "Senior_Physical_Therapist",
                      groupValue: null,
                      onChanged: null),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Physical_therapy_consultant".tr()),
                  const Radio(
                      value: "Physical_therapy_consultant",
                      groupValue: null,
                      onChanged: null),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Physiotherapist".tr()),
                  const Radio(
                      value: "Physiotherapist",
                      groupValue: null,
                      onChanged: null),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('select'.tr()),
              ),
            ),
          ],
        ));
  }
}

class OptionsForsection extends StatelessWidget {
  const OptionsForsection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: context.height * 0.65,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              10.ph,
              Text(
                'select_section'.tr(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              20.ph,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Muscle_and_joint_pain'.tr()),
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
              15.ph,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Sports_injuries'.tr()),
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
              15.ph,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Post-operative_rehabilitation'.tr()),
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
              15.ph,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Rehabilitation_of_children'.tr()),
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
              15.ph,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Cardiopulmonary_rehabilitation'.tr()),
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
              15.ph,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Women's_health_problems".tr()),
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
              15.ph,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('confirm'.tr()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonForSignUp extends StatelessWidget {
  final VoidCallback _toggleVisibility;
  ButtonForSignUp(
      {super.key,
      required VoidCallback toggleVisibility,
      required bool isVisible})
      : _toggleVisibility = toggleVisibility;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _toggleVisibility();
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: AppColors.primaryColor),
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all<Color>(AppColors.primaryColor),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        fixedSize:
            MaterialStateProperty.all<Size>(Size(context.width * 0.8, 50)),
      ),
      child: Text('create_account'.tr()),
    );
  }
}

class PopUp extends StatelessWidget {
  final VoidCallback _toggleVisibility;
  final bool _isVisible;
  final int rollSelected;
  const PopUp(
      {super.key,
      required VoidCallback toggleVisibility,
      required int rollSelected,
      required bool isVisible})
      : _isVisible = isVisible,
        rollSelected = rollSelected,
        _toggleVisibility = toggleVisibility;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: Positioned.fill(
        child: GestureDetector(
          onTap: _toggleVisibility,
          child: Container(
            color: Colors.black54,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: context.height * 0.3),
                  child: Center(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      height: context.height * 0.3,
                      width: context.width * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.close),
                                ],
                              ),
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: AppConstants.customAssetSvg(
                                  imagePath: AppImages.correctIcon,
                                  fit: BoxFit.none,
                                ),
                              ),
                              10.ph,
                              Text("Congratulations".tr()),
                              10.ph,
                              Text("account_created".tr()),
                              10.ph,
                              ElevatedButton(
                                onPressed: () {
                                  _toggleVisibility();
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 500),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        return SlideTransition(
                                          position: Tween<Offset>(
                                            begin: const Offset(0, 1),
                                            end: Offset.zero,
                                          ).animate(animation),
                                          child: child,
                                        );
                                      },
                                      pageBuilder: (context, animation,
                                          secondaryAnimation) {
                                        return rollSelected == 1
                                            ? HomeScreen(
                                                selectedIndex: 0,
                                              )
                                            : InjuryAreaScreen();
                                      },
                                    ),
                                  );
                                },
                                style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: const BorderSide(
                                          color: AppColors.primaryColor),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.primaryColor),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  fixedSize: MaterialStateProperty.all<Size>(
                                      Size(context.width * 0.6, 50)),
                                ),
                                child: Text('go_to_main_screen'.tr()),
                              ),
                            ]),
                      ),
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
