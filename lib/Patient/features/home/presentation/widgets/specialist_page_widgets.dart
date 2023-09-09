import 'package:dr/Patient/features/home/presentation/pages/date_of_session_screen.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/home/presentation/widgets/requests_details_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ApPBarForspecialistScreen extends StatelessWidget {
  const ApPBarForspecialistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: context.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 108, 210, 233),
            Color.fromARGB(173, 116, 10, 154)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35.0),
          bottomRight: Radius.circular(35.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(95, 255, 255, 255),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppColors.whiteColor,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Expanded(
                      child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "صفحة الأخصائي",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                  )),
                ),
                const Spacer()
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PictureForSpecialist extends StatefulWidget {
  const PictureForSpecialist({
    super.key,
  });

  @override
  State<PictureForSpecialist> createState() => _PictureForSpecialistState();
}

class _PictureForSpecialistState extends State<PictureForSpecialist> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Container(
            width: 150,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage("assets/images/person2.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          10.pw,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "فارس الأسمري",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
              5.ph,
              const Text(
                "أخصائي علاج طبيعي",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              5.ph,
              const Stars(),
              5.ph,
              const Text(
                " متاح الان",
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}

class Stars extends StatelessWidget {
  const Stars({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 20,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 20,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 20,
        ),
        Icon(
          Icons.star_half,
          color: Colors.yellow,
          size: 20,
        ),
        Icon(
          Icons.star_border,
          color: Colors.yellow,
          size: 20,
        ),
      ],
    );
  }
}

class statisticsBox extends StatelessWidget {
  String text1, text2;
  statisticsBox({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text1,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          5.ph,
          Text(
            text2,
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class specialistInfo extends StatelessWidget {
  const specialistInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            statisticsBox(
              text1: "مرضى",
              text2: "+100",
            ),
            statisticsBox(
              text1: "خبرة",
              text2: "+10 سنوات",
            ),
            statisticsBox(
              text1: "تقييم",
              text2: "4.5",
            )
          ],
        ),
        20.ph,
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SvgPicture.asset(
              "assets/icons/hearing_aids_icon.svg",
              width: 25,
              height: 25,
            ),
            5.pw,
            const Text(
              "تخصص إصابات والآم العمود الفقري",
              style: TextStyle(fontWeight: FontWeight.w500),
            )
          ],
        ),
        5.ph,
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SvgPicture.asset(
              "assets/icons/clock_icon.svg",
              width: 25,
              height: 25,
            ),
            5.pw,
            const Text(
              "مدة الجلسة الواحدة: 30 : 60 دقيقة",
              style: TextStyle(fontWeight: FontWeight.w500),
            )
          ],
        ),
        5.ph,
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SvgPicture.asset(
              "assets/icons/offer_outlined_icon.svg",
              width: 25,
              height: 25,
            ),
            10.pw,
            const Text(
              "سعر العرض : ",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const Text(
              "250 SAR",
              style: TextStyle(
                  fontWeight: FontWeight.w500, color: AppColors.secondryColor),
            ),
            10.pw,
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '800 SAR',
                      style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.grey,
                          decorationThickness: 2.0,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        5.ph,
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: AppColors.primaryColor,
            ),
            10.pw,
            const Text(
              "الرياض - الجزيرة",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}

class Certificates extends StatelessWidget {
  const Certificates({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imageList = [
      "assets/images/certificate.png",
      "assets/images/certificate.png",
      "assets/images/certificate.png",
      "assets/images/certificate.png",
      "assets/images/certificate.png",
      "assets/images/certificate.png",
      "assets/images/certificate.png",
      "assets/images/certificate.png",
      "assets/images/certificate.png",
      "assets/images/certificate.png",
    ];
    return Container(
      width: context.width,
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              AppConstants.customNavigation(
                  context, FullScreenImage(pathImage: imageList[index]), -1, 0);
            },
            child: Container(
              width: 100,
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageList[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ButtonWithCounter extends StatefulWidget {
  const ButtonWithCounter({super.key});

  @override
  State<ButtonWithCounter> createState() => _ButtonWithCounterState();
}

class _ButtonWithCounterState extends State<ButtonWithCounter> {
  int number = 1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    number++;
                  });
                },
                child: const Icon(
                  Icons.add_circle,
                  size: 35,
                  color: AppColors.primaryColor,
                ),
              ),
              5.pw,
              Text(
                '${number}',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              5.pw,
              InkWell(
                onTap: () {
                  setState(() {
                    if (number > 1) number--;
                  });
                },
                child: const Icon(
                  Icons.remove_circle,
                  size: 35,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          Container(
            width: 250,
            child: ElevatedButton(
              onPressed: () {
                AppConstants.customNavigation(
                    context, DateOfSessionScreen(), -1, 0);
              },
              style: ElevatedButton.styleFrom(
                primary: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'احجز الآن',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
