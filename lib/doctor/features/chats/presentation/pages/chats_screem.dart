import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/doctor/features/chats/presentation/widgets/chats_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customAppBar(context, backButton: false, title: "chats"),
        30.ph,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchField(),
              20.ph,
              Text(
                "active_now".tr(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              10.ph,
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return CircleForActivePeople();
                  },
                ),
              ),
              20.ph,
              Text(
                "messages".tr(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              Container(
                height: context.height * 0.4,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return OneChat();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
