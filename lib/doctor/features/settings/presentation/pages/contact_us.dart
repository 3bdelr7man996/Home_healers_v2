import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        backButton: true,
        title: "contact_us",
        fromSetting: true,
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
                SvgPicture.asset("assets/icons/messanger_facebook_icon.svg"),
                10.pw,
                SvgPicture.asset("assets/icons/snapchat_icon.svg"),
                10.pw,
                SvgPicture.asset("assets/icons/facebook_icon.svg"),
                10.pw,
                SvgPicture.asset("assets/icons/twitter_icon.svg")
              ],
            ),
            30.ph,
            Text(
              "whatsapp".tr(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            20.ph,
            Row(
              children: [
                SvgPicture.asset("assets/icons/whatsapp_icon.svg"),
                10.pw,
                Text(
                  "+966 12345678",
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 18),
                )
              ],
            ),
            30.ph,
            Text(
              "email".tr(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            20.ph,
            Row(
              children: [
                SvgPicture.asset("assets/icons/message_for_contact_icon.svg"),
                10.pw,
                Text(
                  "example@mail.com",
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 18),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
