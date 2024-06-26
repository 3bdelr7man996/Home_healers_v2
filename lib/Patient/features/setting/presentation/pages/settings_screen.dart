import 'dart:io';

import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit/get_point_cubit.dart';
import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit/report_cubit.dart';
import 'package:dr/Patient/features/setting/presentation/pages/edit_profile_screen.dart';
import 'package:dr/Patient/features/setting/presentation/pages/my_point_for_patient.dart';
import 'package:dr/Patient/features/setting/presentation/pages/my_requests_screen_for_patient.dart';
import 'package:dr/Patient/features/setting/presentation/pages/reports_screen.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/settings_widget/one_option_for_patient_widget.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/settings_widget/sign_in_or_log_out_widget.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/doctor/features/settings/presentation/pages/change_password.dart';
import 'package:dr/doctor/features/settings/presentation/pages/contact_us.dart';
import 'package:dr/doctor/features/settings/presentation/widgets/settings_widgets.dart';
import 'package:dr/shared_widgets/delete_account_dialog.dart';
import 'package:dr/shared_widgets/html_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreenForPatient extends StatefulWidget {
  const SettingsScreenForPatient({super.key});

  @override
  State<SettingsScreenForPatient> createState() =>
      _SettingsScreenForPatientState();
}

bool switchValue = false;

class _SettingsScreenForPatientState extends State<SettingsScreenForPatient> {
  late bool IsUserGuest;

  IsGuest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('guest') == false) {
      context.read<GetPointsCubit>().GetMyPoints(context);
      context.read<ReportsCubit>().GetReports();
      context.read<AuthCubit>().getAllCities();
    }
    setState(() {
      IsUserGuest = prefs.containsKey('guest');
    });
  }

  @override
  void initState() {
    super.initState();
    IsUserGuest = false;
    IsGuest();
  }

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
                  IsUserGuest == true
                      ? SizedBox()
                      : Column(
                          children: [
                            Text(
                              "personal_info".tr(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            20.ph,
                            const OneOptionForPatient(
                              iconPath: "assets/icons/person_setting_icon.svg",
                              title: "تعديل الحساب",
                              routeScreen: EditProfileScreenForPatient(),
                            ),
                            15.ph,
                            OneOptionForPatient(
                              iconPath:
                                  "assets/icons/report_for_setting_icon.svg",
                              title: "التقارير",
                              routeScreen: ReportScreenForSetting(),
                            ),
                            15.ph,
                            const OneOptionForPatient(
                              iconPath:
                                  "assets/icons/requests_setting_icon.svg",
                              title: "طلباتي",
                              routeScreen: MyRequestsForPatient(),
                            ),
                            // 15.ph,
                            // const OneOptionForPatient(
                            //   iconPath:
                            //       "assets/icons/budget_icon_for_payment.svg",
                            //   title: "محفظتي",
                            //   routeScreen: MyWalletScreen(),
                            // ),
                            15.ph,
                            const OneOptionForPatient(
                              iconPath:
                                  "assets/icons/my_point_setting_icon.svg",
                              title: "نقاطي",
                              routeScreen: MyPointScreenForPatient(),
                            ),
                            15.ph,
                            const OneOptionForPatient(
                              iconPath: "assets/icons/lock_setting_icon.svg",
                              title: "تغيير الرقم السري",
                              routeScreen: ChangePassword(),
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
                          ],
                        ),
                  const Text(
                    "عن التطبيق",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  15.ph,
                  const OneOptionForPatient(
                    iconPath: "assets/icons/privacy_setting_icon.svg",
                    title: "الخصوصية",
                    routeScreen:
                        HTMLBody(typePage: 'privacy', fromPatient: true),
                  ),
                  15.ph,
                  OneOption(
                    iconPath: AppImages.settingWebPg,
                    title: "visit_the_application_website".tr(),
                    onPressed: () =>
                        AppConstants.launchURL("https://home-healers.com"),
                  ),
                  15.ph,
                  OneOptionForPatient(
                    iconPath: "assets/icons/share_setting_icon.svg",
                    title: "مشاركة التطبيق",
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
                  const OneOptionForPatient(
                    iconPath: "assets/icons/rules_setting_icon.svg",
                    title: "الشروط و الأحكام",
                    routeScreen: HTMLBody(typePage: "terms", fromPatient: true),
                  ),
                  15.ph,
                  const OneOptionForPatient(
                    iconPath: "assets/icons/use_setting_icon.svg",
                    title: "سياسة الاستخدام",
                    routeScreen:
                        HTMLBody(typePage: "policy", fromPatient: true),
                  ),
                  15.ph,
                  const OneOptionForPatient(
                    iconPath: "assets/icons/contact_setting_icon.svg",
                    title: "تواصل معنا",
                    routeScreen: ContactUsScreen(fromPatient: true),
                  ),
                  15.ph,
                  const Divider(thickness: 0.5),
                  15.ph,
                  SignInOrLogOutButton(
                    IsUserGuest: IsUserGuest,
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
