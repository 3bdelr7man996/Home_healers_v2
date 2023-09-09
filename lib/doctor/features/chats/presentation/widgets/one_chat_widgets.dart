import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/home/presentation/pages/home_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/app_colors.dart';

PreferredSizeWidget AppBarForChat(
  BuildContext context, {
  String title = '',
}) {
  return AppBar(
    centerTitle: true,
    leading: Container(
      margin: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(255, 199, 244, 253),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.primaryColor,
        ),
        onPressed: () {
          AppConstants.customNavigation(
              context, HomeScreen(selectedIndex: 1), 0, -1);
        },
      ),
    ),
    actions: [
      SvgPicture.asset(
        'assets/icons/chat_call_icon.svg',
        width: 35,
        height: 35,
      ),
      10.pw,
      SvgPicture.asset(
        'assets/icons/chat_video_icon.svg',
        width: 35,
        height: 35,
      ),
    ],
    backgroundColor: AppColors.backGroundColor,
    shadowColor: Colors.grey.withOpacity(0.5),
    elevation: 8,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage("assets/images/doctor.png"),
          radius: 20,
        ),
        10.pw,
        Text(
          title.tr(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}

class SenderMeesage extends StatelessWidget {
  const SenderMeesage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: context.width * 0.6,
          alignment: Alignment.centerRight,
          margin: EdgeInsets.symmetric(vertical: 4.0),
          child: Container(
            width: context.width * 0.6,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              gradient: LinearGradient(
                colors: [
                  AppColors.darkPrimaryColor,
                  Color.fromARGB(255, 190, 99, 223),
                ],
                tileMode: TileMode.repeated,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: EdgeInsets.all(10.0),
            child: const Text(
              "بكلم حضرتك بخصوص حالتي اللي بشتكي منها , كسر في رجلي الشمال عندما كنت امارس الرياضة ",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Icon(
            Icons.done,
            size: 17,
          ),
          5.pw,
          Text(
            "10:13",
          ),
        ])
      ],
    );
  }
}

class ReciveMessage extends StatelessWidget {
  const ReciveMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: context.width * 0.6,
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.symmetric(vertical: 4.0),
          child: Container(
            width: context.width * 0.6,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 232, 237, 246),
                  Color.fromARGB(255, 247, 250, 255),
                ],
                tileMode: TileMode.repeated,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(10.0),
            child: const Text(
              "مفيش مشكلة كلمني اكتر عن حالتك الصحية حاليا وهفيدك بكل حاجة هتحتاجها لاتقلق ",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "10:13",
              ),
            ])
      ],
    );
  }
}
