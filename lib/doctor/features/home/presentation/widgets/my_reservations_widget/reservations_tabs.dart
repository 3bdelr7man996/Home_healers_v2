import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/doctor/features/home/data/models/tab_info.dart';
import 'package:flutter/material.dart';

import 'tab_item.dart';

class ResevationsTabs extends StatelessWidget {
  final List<TabInfo> tabTitle;
  final int statusId;

  const ResevationsTabs({
    super.key,
    required this.tabTitle,
    required this.statusId,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height * 0.05,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List<Widget>.generate(tabTitle.length, (index) {
          return TabItem(
            tabValue: tabTitle[index].reservationStep,
            title: tabTitle[index].tabName,
            statusId: statusId,
          );
        }),
      ),
    );
  }
}
