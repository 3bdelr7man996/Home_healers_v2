import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_font.dart';
import '../../../../shared_widgets/custom_app_bar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: CustomScrollView(slivers: <Widget>[
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                15.0.ph,
                Text(
                  "register_new_account".tr(),
                  style: titleStyle(),
                ),
                10.ph,
                SizedBox(
                  width: context.width * 0.6,
                  child: Text(
                    "enjoy_many_advantages".tr(),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    style: bigBlackFont(fontWeight: FontWeight.w400),
                  ),
                ),
                60.ph,
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "first_name".tr(),
                            style: bigBlackFont(fontWeight: FontWeight.w500),
                          ),
                          5.ph,
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "first_name".tr(),
                              prefixIcon: SizedBox(
                                height: 18,
                                width: 18,
                                child: AppConstants.customAssetSvg(
                                  imagePath: AppImages.personIcon,
                                  fit: BoxFit.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    15.pw,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "last_name".tr(),
                            style: bigBlackFont(fontWeight: FontWeight.w500),
                          ),
                          5.ph,
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "last_name".tr(),
                              prefixIcon: SizedBox(
                                height: 18,
                                width: 18,
                                child: AppConstants.customAssetSvg(
                                  imagePath: AppImages.personIcon,
                                  fit: BoxFit.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
