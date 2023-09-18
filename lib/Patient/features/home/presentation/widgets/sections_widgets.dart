import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dr/Patient/features/home/presentation/pages/filter_screen.dart';
import 'package:dr/Patient/features/home/presentation/pages/section_details_screen.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SliderForPatient extends StatefulWidget {
  const SliderForPatient({super.key});

  @override
  State<SliderForPatient> createState() => _SliderForPatientState();
}

List<String> imageList = [
  'assets/images/report.png',
  'assets/images/doctor.png',
  'assets/images/patient.png',
];

class _SliderForPatientState extends State<SliderForPatient> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: context.height * 0.2,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                _currentImageIndex = index;
              });
            },
          ),
          items: imageList.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: Image.asset(
                      item,
                      fit: BoxFit.cover,
                      width: 1000,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        10.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imageList.map((imageUrl) {
            int index = imageList.indexOf(imageUrl);

            return Container(
              width: 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentImageIndex == index
                    ? AppColors.primaryColor
                    : Colors.grey,
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}

class CustumAppBarForPatient extends StatefulWidget {
  const CustumAppBarForPatient({super.key});

  @override
  State<CustumAppBarForPatient> createState() => _CustumAppBarForPatientState();
}

Future<String> getAttributeFromSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String attribute = prefs.getString(AppStrings.userInfo) ?? '';
  return attribute;
}

class _CustumAppBarForPatientState extends State<CustumAppBarForPatient> {
  TextEditingController _searchController = TextEditingController();

  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  var userInfo;
  var jsonData;
  String FirstName = '';
  @override
  void initState() {
    super.initState();
    getAttributeFromSharedPreferences().then((value) {
      setState(() {
        userInfo = value;
        jsonData = jsonDecode(userInfo);
        List<String> words = jsonData["name"].split(" ");
        FirstName = words[0];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.28,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(255, 103, 157, 252),
            Color.fromARGB(255, 155, 60, 172),
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: context.height * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "مرحبا ! \n ${FirstName} , كيف حالك !",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(
                    jsonData != null
                        ? jsonData["image"] ?? "assets/images/patient.png"
                        : "assets/images/patient.png",
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: context.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    AppConstants.customNavigation(context, FiterScreen(), 0, 0);
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(157, 55, 209, 244),
                          Color(0xFFB61EEF),
                        ],
                      ),
                    ),
                    child: const Icon(
                      Icons.filter_list,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
                10.pw,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  width: context.width * 0.7,
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "… بحث",
                      suffixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class IconsForSections extends StatefulWidget {
  const IconsForSections({super.key});

  @override
  State<IconsForSections> createState() => _IconsForSectionsState();
}

class _IconsForSectionsState extends State<IconsForSections> {
  final List<String> icons = [
    "assets/icons/muscle_icon.svg",
    "assets/icons/sports_muscle_injuries_icon.svg",
    "assets/icons/Post-operative_rehabilitation_icon.svg",
    "assets/icons/children_icon.svg",
    "assets/icons/Cardiac_rehabilitation_icon.svg",
    "assets/icons/nervous_system_injuries_icon.svg",
    "assets/icons/women's_health_problems_icon.svg",
  ];

  final List<String> labels = [
    'إصابات رياضية',
    'الام العضلات والمفاصل',
    'تأهيل الأطفال',
    'تأهيل بعد العمليات الجراحية',
    'تأهيل قلبي رئوي',
    'إصابات الجهاز العصبي',
    'مشاكل صحة المرأة',
  ];

  final List<String> SectiondetailsTitle = [
    'muscle_and_joint_pain_section',
    'muscle_injuries_section',
    'rehabilitation_after_surgeries',
    'pediatric_rehabilitation_section',
    'cardiopulmonary_rehabilitation',
    'nervous_system_injuries',
    'women_health_problems'
  ];
  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().getAllStatus();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: icons.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Builder(builder: (BuildContext context) {
          return InkWell(
            onTap: () {
              AppConstants.customNavigation(
                  context,
                  SectionDetailsScreen(
                      numberOfIcon: index,
                      SectiondetailsTitle: SectiondetailsTitle[index]),
                  -1,
                  0);
            },
            child: Column(
              children: [
                SvgPicture.asset(icons[index]),
                5.ph,
                Text(
                  context.select((AuthCubit cubit) => cubit.state.statusList) !=
                          null
                      ? context
                          .select((AuthCubit cubit) =>
                              cubit.state.statusList![index].nameAr)
                          .toString()
                      : "",
                  textAlign: TextAlign.center,
                )
              ],
            ),
          );
        });
      },
    );
  }
}

class BottomSheetForPatient extends StatelessWidget {
  const BottomSheetForPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 450,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(
            children: [
              const Text(
                "شكراً لك على تقييم الخدمة",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              5.ph,
              const Text(
                "احصل علي خصم 50% علي رسوم الخدمة عند استخدام كود الخصم الخاص بطلبك",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              15.ph,
              Image.asset("assets/images/five_stars.png"),
              15.ph,
              const Text(
                "نسعي دوما لتحسين خدمتكم",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0.0),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: AppColors.primaryColor),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Abcdii',
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 20.0),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                const Icon(
                                  Icons.ios_share_outlined,
                                  color: AppColors.primaryColor,
                                ),
                                10.ph,
                                const Text(
                                  "شارك",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              15.ph,
              const Text(
                "كود الخصم ساري علي جميع الخدمات التي يقدمها التطبيق",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}
