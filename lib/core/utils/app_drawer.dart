import 'package:flutter/material.dart';
import 'package:dr/core/extensions/media_query_extension.dart';

import 'app_font.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.6,
      child: Drawer(
        child: SafeArea(
          child: CustomScrollView(slivers: <Widget>[
            const SliverToBoxAdapter(),
            SliverFixedExtentList(
              itemExtent: 70,
              delegate: SliverChildListDelegate([]),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "اصدار ٠.٠.٢",
                    style: sBigBlackFont(),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
