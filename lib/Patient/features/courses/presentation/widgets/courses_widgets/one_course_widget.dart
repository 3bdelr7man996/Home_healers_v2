import 'package:dr/Patient/features/courses/presentation/pages/course_details_screen.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:flutter/material.dart';

class OneCourseWidget extends StatefulWidget {
  const OneCourseWidget({super.key});

  @override
  State<OneCourseWidget> createState() => _OneCourseWidgetState();
}

class _OneCourseWidgetState extends State<OneCourseWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: AppConstants.customNetworkImage(
                    imagePath: "asd",
                    width: 121,
                    height: 122,
                    fit: BoxFit.fill,
                    imageError: "assets/images/placeholder.png",
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Positioned(
                top: 15,
                right: 15,
                child: InkWell(
                  onTap: () async {},
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.favorite,
                      size: 20,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.green,
                          ),
                          10.pw,
                          Text(
                            "حضور أونلاين",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Text(
                        "12/2/2022",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  5.ph,
                  Text(
                    "لقاء عن العلاج الطبي",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  5.ph,
                  Text(
                    "250 ريال سعودي",
                    style: TextStyle(
                        color: AppColors.secondryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  5.ph,
                  Text(
                    "لقاء يجمع كبار عمالقة الطب العلاجي حول العالم لمناقشة التحديات",
                    style: TextStyle(fontSize: 14),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          AppConstants.customNavigation(
                              context, CourseDetails(), -1, 0);
                        },
                        child: Row(
                          children: [
                            Text(
                              "المزيد",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor,
                                  fontSize: 14),
                            ),
                            5.pw,
                            Icon(
                              Icons.arrow_forward,
                              color: AppColors.primaryColor,
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
