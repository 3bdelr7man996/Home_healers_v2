import 'package:dr/Patient/features/home/presentation/widgets/home_widgets/home_widgets.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/doctor/features/settings/presentation/cubit/setting_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:simple_html_css/simple_html_css.dart';
// import 'package:simple_html_css/simple_html_css.dart';

class PageModel {
  final String? title;
  final String? body;

  PageModel({
    this.title,
    this.body,
  });
}

class HTMLBody extends StatelessWidget {
  const HTMLBody({
    Key? key,
    required this.typePage,
    this.fromPatient = false,
  }) : super(key: key);
  final String typePage;
  final bool fromPatient;
  @override
  Widget build(BuildContext context) {
    final appInfo = context.select((SettingCubit cubit) => cubit.state.appInfo);

    PageModel? pageBody;
    if (typePage == 'policy') {
      pageBody =
          PageModel(title: 'recruitment_policy'.tr(), body: appInfo?.policy);
    }
    if (typePage == 'terms') {
      pageBody =
          PageModel(title: 'terms_and_conditions'.tr(), body: appInfo?.terms);
    }
    if (typePage == 'privacy') {
      pageBody = PageModel(title: 'privacy'.tr(), body: appInfo?.privacy);
    }

    return Scaffold(
        appBar: customAppBar(context,
            backButton: true,
            fromSetting: fromPatient ? false : true,
            title: pageBody!.title!),
        bottomNavigationBar: fromPatient
            ? BottomNavigationForPatient(
                selectedIndex: 4,
              )
            : null,
        //CustomBottomNavigation(selectedIndex: 3),
        body: Builder(builder: (context) {
          // or use HTML.toRichText()
          final TextSpan textSpan = HTML.toTextSpan(
            context,
            """<body><div style='line-height:2; font-size:13px'>${pageBody?.body}</div></body>""",
            linksCallback: (dynamic link) {
              AppConstants.launchURL(link);
            },
            // as name suggests, optionally set the default text style
            defaultTextStyle: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.normal,
                fontSize: 13.3),
            overrideStyle: <String, TextStyle>{
              'body': const TextStyle(fontSize: 13.6),
              'a': const TextStyle(wordSpacing: 2),
            },
          );

          return SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: RichText(
                text: textSpan,
              ));
          // Text(pageBody.body),
        }));
  }
}
