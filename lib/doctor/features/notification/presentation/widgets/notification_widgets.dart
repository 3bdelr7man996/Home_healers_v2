import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OneNotification extends StatelessWidget {
  final String imagePath, title, date, description;
  const OneNotification({
    super.key,
    required this.imagePath,
    required this.title,
    required this.date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            SvgPicture.asset(
              "${AppImages.iconPath}$imagePath",
              // width: 75,
              // height: 75,
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
                //5.ph,
                Text(
                  convertDate(date),
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Color.fromARGB(255, 197, 198, 200),
                  ),
                ),
              ],
            )
          ],
        ),
        15.ph,
        Text(description),
        const Divider(
          color: Color.fromARGB(74, 0, 0, 0),
          thickness: 0.3,
        ),
      ]),
    );
  }

  String convertDate(String date) {
    DateTime parsedDay = DateTime.parse(date);
    if (parsedDay.day == DateTime.now().day) {
      return 'اليوم';
    } else if (DateTime.now().day - parsedDay.day == 1) {
      return 'امس';
    } else {
      return date;
    }
  }
}
