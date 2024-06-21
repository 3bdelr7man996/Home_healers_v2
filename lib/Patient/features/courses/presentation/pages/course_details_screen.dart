import 'package:dr/Patient/features/courses/presentation/widgets/course_details_widgets/about_course_widget.dart';
import 'package:dr/Patient/features/courses/presentation/widgets/course_details_widgets/course_creator_widget.dart';
import 'package:dr/Patient/features/courses/presentation/widgets/course_details_widgets/course_date_widget.dart';
import 'package:dr/Patient/features/courses/presentation/widgets/course_details_widgets/course_title_widget.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: "تفاصيل المؤتمر"),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: context.height,
                  ),
                  AppConstants.customNetworkImage(
                    imagePath: "asd",
                    width: context.width,
                    height: context.height * 0.35,
                    fit: BoxFit.fill,
                    imageError: "assets/images/placeholder.png",
                  ),
                  Positioned(
                    top: context.height * 0.3,
                    child: Container(
                        height: context.height * 0.6,
                        width: context.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              children: [
                                AboutCourseWidget(),
                                20.ph,
                                CourseTitleWidget(),
                                CourseDateWidget(),
                                20.ph,
                                CourseCreator(),
                                25.ph,
                                Container(
                                  width: context.width,
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text("احجز مقعدك الآن"),
                                      )),
                                )
                              ],
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
