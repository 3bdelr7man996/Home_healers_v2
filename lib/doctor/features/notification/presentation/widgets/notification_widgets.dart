import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class OneNotification extends StatelessWidget {
  String imagePath, title, date, description;
  OneNotification(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.date,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: 175,
      child: Column(children: [
        Row(
          children: [
            SvgPicture.asset(
              imagePath,
              width: 75,
              height: 75,
            ),
            10.pw,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                5.ph,
                Opacity(
                  opacity: 0.5,
                  child: Text(
                    "اليوم ${date} PM",
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            )
          ],
        ),
        15.ph,
        Text(description),
        30.ph,
        const Divider(
          color: const Color.fromARGB(74, 0, 0, 0),
          thickness: 0.5,
        ),
      ]),
    );
  }
}
