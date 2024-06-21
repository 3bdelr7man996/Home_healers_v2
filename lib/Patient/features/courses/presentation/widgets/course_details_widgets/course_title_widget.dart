import 'package:dr/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';

class CourseTitleWidget extends StatelessWidget {
  const CourseTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "تفاصيل اللقاء :",
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
        5.ph,
        Text(
          "ستقدم معرض شمال إفريقيا الصحي مسارًا من التعليم والتدريب الطبيين لأخصائيي الرعاية الصحية خلال جميع أيام المعرض، ومؤتمرين معتمدين للتعليم الطبي المستمر و مؤتمر غير سريري ومجموعة مختارة من ورش العمل للهندسة الطبية الحيوية.",
          style: TextStyle(fontSize: 14.0),
        ),
        20.ph,
      ],
    );
  }
}
