import 'package:dr/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';

class CourseCreator extends StatelessWidget {
  const CourseCreator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "منظم اللقاء :",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            5.pw,
            Expanded(
              child: Divider(
                thickness: 0.5,
              ),
            ),
          ],
        ),
        10.ph,
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Image.asset(
                "assets/images/doctor.png",
                fit: BoxFit.fill,
              ),
            ),
            5.pw,
            Column(
              children: [
                Text(
                  "م/احمد علي",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                5.ph,
                Text(
                  "نظم معلومات",
                  style: TextStyle(fontSize: 16),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
