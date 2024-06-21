import 'package:dr/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CourseDateWidget extends StatelessWidget {
  const CourseDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/online_course.svg',
            ),
            10.pw,
            Text(
              "أونلاين",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/course_date.svg',
            ),
            10.pw,
            Text(
              "12/2/2022",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/course_time.svg',
            ),
            10.pw,
            Text(
              "8:30 PM",
              style: TextStyle(fontSize: 14),
            ),
          ],
        )
      ],
    );
  }
}
