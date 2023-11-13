import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ReciveBuble extends StatelessWidget {
  final String content, createdAt;
  ReciveBuble({super.key, this.content = '', this.createdAt = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 237, 239, 243),
                    Color.fromARGB(255, 194, 212, 243),
                  ],
                  tileMode: TileMode.repeated,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "$content",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "$createdAt",
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
