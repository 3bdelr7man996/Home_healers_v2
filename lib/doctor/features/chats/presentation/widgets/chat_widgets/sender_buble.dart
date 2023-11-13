import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SenderBuble extends StatelessWidget {
  final String content, createdAt;
  SenderBuble({super.key, required this.content, required this.createdAt});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Container(
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
              child: Text(
                "$content",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Icon(
              Icons.done,
              size: 14,
              color: AppColors.textGrey,
            ),
            5.pw,
            Text(
              "${createdAt}",
              style: TextStyle(
                fontSize: 9.0,
                color: AppColors.textGrey,
              ),
            ),
          ])
        ],
      ),
    );
  }
}
