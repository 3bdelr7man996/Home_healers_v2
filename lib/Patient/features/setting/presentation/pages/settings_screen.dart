import 'package:dr/Patient/features/setting/presentation/pages/edit_profile_screen.dart';
import 'package:dr/Patient/features/setting/presentation/pages/my_point_for_patient.dart';
import 'package:dr/Patient/features/setting/presentation/pages/my_requests_screen_for_patient.dart';
import 'package:dr/Patient/features/setting/presentation/pages/my_wallet_screen.dart';
import 'package:dr/Patient/features/setting/presentation/pages/reports_screen.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/settings_widgets.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/doctor/features/settings/presentation/pages/change_password.dart';
import 'package:dr/doctor/features/settings/presentation/pages/contact_us.dart';
import 'package:dr/features/auth/presentation/cubit/login_cubit.dart';
import 'package:dr/features/auth/presentation/pages/select_roll_for_sign_in.dart';
import 'package:dr/shared_widgets/html_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SettingsScreenForPatient extends StatefulWidget {
  const SettingsScreenForPatient({super.key});

  @override
  State<SettingsScreenForPatient> createState() =>
      _SettingsScreenForPatientState();
}

bool switchValue = false;

class _SettingsScreenForPatientState extends State<SettingsScreenForPatient> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customAppBar(context, title: "settings", backButton: false),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "personal_info".tr(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  20.ph,
                  OneOptionForPatient(
                    IconPath: "assets/icons/person_setting_icon.svg",
                    title: "تعديل الحساب",
                    routeScreen: EditProfileScreenForPatient(),
                  ),
                  15.ph,
                  OneOptionForPatient(
                    IconPath: "assets/icons/report_for_setting_icon.svg",
                    title: "التقارير",
                    routeScreen: ReportScreenForSetting(),
                  ),
                  15.ph,
                  OneOptionForPatient(
                    IconPath: "assets/icons/requests_setting_icon.svg",
                    title: "طلباتي",
                    routeScreen: MyRequestsForPatient(),
                  ),
                  15.ph,
                  OneOptionForPatient(
                    IconPath: "assets/icons/budget_icon_for_payment.svg",
                    title: "محفظتي",
                    routeScreen: MyWalletScreen(),
                  ),
                  15.ph,
                  OneOptionForPatient(
                    IconPath: "assets/icons/my_point_setting_icon.svg",
                    title: "نقاطي",
                    routeScreen: MyPointScreenForPatient(),
                  ),
                  15.ph,
                  OneOptionForPatient(
                    IconPath: "assets/icons/lock_setting_icon.svg",
                    title: "تغيير الرقم السري",
                    routeScreen: ChangePassword(),
                  ),
                  15.ph,
                  const Divider(thickness: 0.5),
                  15.ph,
                  const Text(
                    "عن التطبيق",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  15.ph,
                  OneOptionForPatient(
                    IconPath: "assets/icons/privacy_setting_icon.svg",
                    title: "الخصوصية",
                    routeScreen:
                        const HTMLBody(typePage: 'privacy', fromPatient: true),
                  ),
                  15.ph,
                  OneOptionForPatient(
                    IconPath: "assets/icons/web_setting_icon.svg",
                    title: "زيارة موقع التطبيق",
                  ),
                  15.ph,
                  OneOptionForPatient(
                    IconPath: "assets/icons/share_setting_icon.svg",
                    title: "مشاركة التطبيق",
                  ),
                  15.ph,
                  OneOptionForPatient(
                    IconPath: "assets/icons/rules_setting_icon.svg",
                    title: "الشروط و الأحكام",
                    routeScreen: HTMLBody(typePage: "terms"),
                  ),
                  15.ph,
                  OneOptionForPatient(
                    IconPath: "assets/icons/use_setting_icon.svg",
                    title: "سياسة الاستخدام",
                    routeScreen: HTMLBody(typePage: "policy"),
                  ),
                  15.ph,
                  OneOptionForPatient(
                    IconPath: "assets/icons/contact_setting_icon.svg",
                    title: "تواصل معنا",
                    routeScreen: ContactUsScreen(fromPatient: true),
                  ),
                  15.ph,
                  const Divider(thickness: 0.5),
                  15.ph,
                  InkWell(
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
                          "assets/icons/log_out_setting_icon.svg",
                          width: 40,
                          height: 40,
                        ),
                        10.pw,
                        const Text(
                          "تسجيل الخروج",
                          style: TextStyle(
                              fontSize: 20, color: AppColors.primaryColor),
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
