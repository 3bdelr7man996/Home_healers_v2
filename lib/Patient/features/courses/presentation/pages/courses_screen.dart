import 'package:dr/Patient/features/courses/presentation/widgets/courses_widgets/one_course_widget.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class coursesScreen extends StatefulWidget {
  const coursesScreen({super.key});

  @override
  State<coursesScreen> createState() => _coursesScreenState();
}

class _coursesScreenState extends State<coursesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: "الدورات والمؤتمرات الطبية"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/images/courses.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              20.ph,
              Row(
                children: [
                  Text(
                    "اللقاءات المتاحة",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              10.ph,
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return OneCourseWidget();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
