import 'dart:io';

import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/doctor/features/home/presentation/pages/all_requests.dart';
import 'package:dr/doctor/features/settings/presentation/cubit/setting_cubit.dart';
import 'package:dr/doctor/features/settings/presentation/pages/certificates_screen.dart';
import 'package:dr/doctor/features/settings/presentation/pages/change_password.dart';
import 'package:dr/doctor/features/settings/presentation/pages/contact_us.dart';
import 'package:dr/doctor/features/settings/presentation/pages/edit_profile_screen.dart';
import 'package:dr/doctor/features/settings/presentation/pages/my_point_screen.dart';
import 'package:dr/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:dr/features/auth/presentation/pages/select_roll_for_sign_in.dart';
import 'package:dr/shared_widgets/delete_account_dialog.dart';
import 'package:dr/shared_widgets/html_body.dart';
import 'package:dr/doctor/features/settings/presentation/widgets/settings_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/svg.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    context.read<SettingCubit>().getActiveStatus();
    context.read<AuthCubit>().initProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customAppBar(context, title: "settings", backButton: false),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Personalinfo(),
                  20.ph,
                  OneOption(
                    iconPath: AppImages.settingPerson,
                    title: "edit_account".tr(),
                    routeScreen: const EditProfileScreen(),
                  ),
                  15.ph,
                  OneOption(
                    iconPath: AppImages.settingLock,
                    title: "change_password".tr(),
                    routeScreen: const ChangePassword(),
                  ),
                  15.ph,
                  OneOption(
                    iconPath: AppImages.settingRequests,
                    title: "specialist_requests".tr(),
                    routeScreen: const Scaffold(
                        body: Allrequests(
                      fromSetting: true,
                    )),
                  ),
                  15.ph,
                  OneOption(
                    iconPath: AppImages.settingCertificate,
                    title: "certificates_and_documents".tr(),
                    routeScreen: const CertificatesScreen(),
                  ),
                  15.ph,
                  OneOption(
                    iconPath: AppImages.settingPoints,
                    title: "my_point".tr(),
                    routeScreen: const MyPointScreen(),
                  ),
                  15.ph,
                  OneOption(
                    iconPath: AppImages.delete_acc,
                    title: "حذف الحساب",
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => DeleteAccountDialog(),
                      );
                    },
                  ),
                  15.ph,
                  const Divider(thickness: 0.5),
                  15.ph,
                  Text(
                    "about_the_app".tr(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  15.ph,
                  OneOption(
                    iconPath: AppImages.settingPrivacy,
                    title: "privacy".tr(),
                    routeScreen: const HTMLBody(typePage: 'privacy'),
                  ),
                  15.ph,
                  OneOption(
                    iconPath: AppImages.settingWebPg,
                    title: "visit_the_application_website".tr(),
                    onPressed: () =>
                        AppConstants.launchURL("https://home-healers.com"),
                  ),
                  15.ph,
                  OneOption(
                    iconPath: AppImages.settingShare,
                    title: "share_app".tr(),
                    onPressed: () async {
                      await FlutterShare.share(
                        title: 'Home Healers',
                        text:
                            'خدمات العلاج الطبيعي المنزلي والذي يساعدك على تحسين حالتك الصحية والجسدية',
                        linkUrl: Platform.isIOS
                            ? "https://rb.gy/nzkpxe"
                            : "https://rb.gy/quhcf4", //todo ios link
                      );
                    },
                  ),
                  15.ph,
                  OneOption(
                    iconPath: AppImages.settingRules,
                    title: "terms_and_conditions".tr(),
                    routeScreen: const HTMLBody(typePage: 'terms'),
                  ),
                  15.ph,
                  OneOption(
                    iconPath: AppImages.settingPolicy,
                    title: "recruitment_policy".tr(),
                    routeScreen: const HTMLBody(typePage: 'policy'),
                  ),
                  15.ph,
                  const OneOption(
                    iconPath: "assets/icons/contact_setting_icon.svg",
                    title: "تواصل معنا",
                    routeScreen: ContactUsScreen(),
                  ),
                  15.ph,
                  const Divider(thickness: 0.5),
                  15.ph,
                  GestureDetector(
                    onTap: () {
                      context.read<LoginCubit>().logOut();

                      AppConstants.pushRemoveNavigator(context,
                          screen: const SelectRollForSignIn());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppImages.logOutIcon,
                          width: 40,
                          height: 40,
                        ),
                        10.pw,
                        Text(
                          "log_out".tr(),
                          style: const TextStyle(
                            fontSize: 20,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        20.ph
                      ],
                    ),
                  ),
                  15.ph
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
