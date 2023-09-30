import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/doctor/features/settings/presentation/pages/certificates_screen.dart';
import 'package:dr/doctor/features/settings/presentation/pages/change_password.dart';
import 'package:dr/doctor/features/settings/presentation/pages/contact_us.dart';
import 'package:dr/doctor/features/settings/presentation/pages/edit_profile_screen.dart';
import 'package:dr/doctor/features/settings/presentation/pages/my_point_screen.dart';
import 'package:dr/doctor/features/settings/presentation/pages/html_body.dart';
import 'package:dr/doctor/features/settings/presentation/widgets/settings_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

bool switchValue = false;

class _SettingsScreenState extends State<SettingsScreen> {
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
                  Personalinfo(
                    switchValue: switchValue,
                  ),
                  20.ph,
                  OneOption(
                    IconPath: "assets/icons/person_setting_icon.svg",
                    title: "تعديل الحساب",
                    routeScreen: const EditProfileScreen(),
                  ),
                  15.ph,
                  OneOption(
                    IconPath: "assets/icons/lock_setting_icon.svg",
                    title: "تغيير الرقم السري",
                    routeScreen: const ChangePassword(),
                  ),
                  15.ph,
                  OneOption(
                    IconPath: "assets/icons/requests_setting_icon.svg",
                    title: "طلبات الأخصائي",
                  ),
                  15.ph,
                  OneOption(
                    IconPath: "assets/icons/certificate_setting_icon.svg",
                    title: "الشهادات و المستندات",
                    routeScreen: const CertificatesScreen(),
                  ),
                  15.ph,
                  OneOption(
                    IconPath: "assets/icons/my_point_setting_icon.svg",
                    title: "نقاطي",
                    routeScreen: const MyPointScreen(),
                  ),
                  15.ph,
                  const Divider(thickness: 0.5),
                  15.ph,
                  const Text(
                    "عن التطبيق",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  15.ph,
                  OneOption(
                    IconPath: "assets/icons/privacy_setting_icon.svg",
                    title: "الخصوصية",
                    routeScreen: const HTMLBody(typePage: 'privacy'),
                  ),
                  15.ph,
                  OneOption(
                    IconPath: "assets/icons/web_setting_icon.svg",
                    title: "زيارة موقع التطبيق",
                  ),
                  15.ph,
                  OneOption(
                    IconPath: "assets/icons/share_setting_icon.svg",
                    title: "مشاركة التطبيق",
                  ),
                  15.ph,
                  OneOption(
                    IconPath: "assets/icons/rules_setting_icon.svg",
                    title: "الشروط و الأحكام",
                    routeScreen: const HTMLBody(typePage: 'terms'),
                  ),
                  15.ph,
                  OneOption(
                    IconPath: "assets/icons/use_setting_icon.svg",
                    title: "سياسة الاستخدام",
                    routeScreen: const HTMLBody(typePage: 'policy'),
                  ),
                  15.ph,
                  OneOption(
                    IconPath: "assets/icons/contact_setting_icon.svg",
                    title: "تواصل معنا",
                    routeScreen: ContactUsScreen(),
                  ),
                  15.ph,
                  const Divider(thickness: 0.5),
                  15.ph,
                  Row(
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
