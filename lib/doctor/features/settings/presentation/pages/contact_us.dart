import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/doctor/features/settings/presentation/cubit/setting_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  final bool fromPatient;
  const ContactUsScreen({super.key, this.fromPatient = false});

  @override
  Widget build(BuildContext context) {
    final appInfo = context.select((SettingCubit cubit) => cubit.state.appInfo);

    return Scaffold(
      appBar: customAppBar(
        context,
        backButton: true,
        title: "contact_us",
        fromSetting: fromPatient ? false : true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/contact-us.png"),
              ],
            ),
            20.ph,
            Text(
              "social_media".tr(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            20.ph,
            Row(
              children: [
                SocialIcon(
                  imagePath: "assets/icons/whatsapp_icon.svg",
                  socialUrl: appInfo?.whats ?? "",
                ),
                10.pw,
                SocialIcon(
                  imagePath: "assets/icons/snapchat_icon.svg",
                  socialUrl: appInfo?.snap ?? "",
                ),
                10.pw,
                SocialIcon(
                  imagePath: "assets/icons/facebook_icon.svg",
                  socialUrl: appInfo?.fb ?? "",
                ),
                10.pw,
                SocialIcon(
                  imagePath: "assets/icons/twitter_icon.svg",
                  socialUrl: appInfo?.tw ?? "",
                )
              ],
            ),
            30.ph,
            Text(
              "whatsapp".tr(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            20.ph,
            ListTile(
              leading: SvgPicture.asset("assets/icons/mobile.svg"),
              title: Text(
                appInfo?.mobile ?? '',
                textAlign: context.locale.languageCode == "ar"
                    ? TextAlign.right
                    : TextAlign.left,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              onTap: () => AppConstants.launchURL('tel:${appInfo?.mobile}'),
            ),
            30.ph,
            Text(
              "email".tr(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            20.ph,
            ListTile(
                leading: SvgPicture.asset(
                    "assets/icons/message_for_contact_icon.svg"),
                title: Text(
                  appInfo?.email ?? '',
                  textAlign: context.locale.languageCode == "ar"
                      ? TextAlign.right
                      : TextAlign.left,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                onTap: () async {
                  var emailLaunch = Uri(
                    scheme: 'mailto',
                    path: '${appInfo?.email}',
                  );
                  await launchUrl(emailLaunch);
                }),
          ],
        ),
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  const SocialIcon({
    super.key,
    required this.imagePath,
    required this.socialUrl,
  });
  final String imagePath;
  final String socialUrl;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          AppConstants.launchURL(socialUrl);
        },
        icon: AppConstants.customAssetSvg(imagePath: imagePath));
  }
}
