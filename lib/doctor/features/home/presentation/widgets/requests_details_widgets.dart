import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/home/presentation/pages/home_screen.dart';
import 'package:dr/doctor/features/home/presentation/pages/report_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class RequestsDetailsHeader extends StatelessWidget {
  String mainPage;
  RequestsDetailsHeader({super.key, required this.mainPage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: context.width,
          height: context.height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "رقم الطلب : 973",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "تاريخ الطلب : 11-06-2023",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
              mainPage == "Review" || mainPage == "Waiting for payment"
                  ? Text(
                      mainPage == "Review" ? "المراجعة" : "انتظار الدفع",
                      style: const TextStyle(
                          color: AppColors.yellowColor,
                          fontWeight: FontWeight.bold),
                    )
                  : mainPage == "Canceled"
                      ? const Text(
                          "ملغية",
                          style: TextStyle(
                              color: AppColors.redColor,
                              fontWeight: FontWeight.bold),
                        )
                      : const Text(
                          "تم الدفع",
                          style: TextStyle(
                              color: AppColors.greenColor,
                              fontWeight: FontWeight.bold),
                        ),
            ],
          ),
        ),
        Container(
          height: 1,
          width: context.width,
          color: Colors.grey,
        ),
        20.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 115,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage('assets/images/person.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            10.pw,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "فارس السيد",
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500),
                ),
                10.ph,
                const Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppColors.primaryColor,
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Text(
                        'موقع المريض',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            mainPage == "The payment was made"
                ? Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/message_icon.svg',
                          width: 30,
                          height: 30,
                        ),
                        10.pw,
                        SvgPicture.asset(
                          'assets/icons/call_icon.svg',
                          width: 30,
                          height: 30,
                        ),
                      ],
                    ),
                  )
                : Text(""),
          ],
        ),
        20.ph,
        const Text(
          "نوع الإصابة : قدم",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        10.ph,
        Row(
          children: [
            const Text(
              " عدد الجلسات :",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            5.pw,
            const Text(
              "5",
              style: TextStyle(
                  color: AppColors.secondryColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        10.ph,
        Row(
          children: [
            const Text(
              " حساب الجلسات  :",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            5.pw,
            const Text(
              "1500 ريال سعودي",
              style: TextStyle(
                  color: AppColors.secondryColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        30.ph,
      ],
    );
  }
}

const sessions = [
  {"الأولى", "22-5-2023"},
  {"الثانية", "22-5-2023"},
  {"الرابعة", "15-2-2023"},
  {"الخامسة", "22-5-2023"},
  {"السادسة", "22-5-2023"},
];
const checked = [true, true, false, false, false];

// ignore: must_be_immutable
class SessionInfo extends StatelessWidget {
  String mainPage;
  SessionInfo({super.key, required String this.mainPage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Session_details".tr(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
        10.ph,
        Container(
          height: context.height * 0.15,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sessions.length,
            itemBuilder: (context, index) {
              return OneSessionInfo(
                  mainPage: mainPage,
                  title: sessions[index].first,
                  date: sessions[index].last,
                  checked: checked[index]);
            },
          ),
        ),
        30.ph,
      ],
    );
  }
}

// ignore: must_be_immutable
class OneSessionInfo extends StatelessWidget {
  String title, date, mainPage;
  bool checked;
  OneSessionInfo({
    super.key,
    required this.title,
    required this.date,
    required this.checked,
    required this.mainPage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
      ),
      child: Column(
        children: [
          Opacity(
            opacity: mainPage == "The payment was made" && checked ? 0.5 : 1,
            child: Container(
              width: context.width * 0.25,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.transparent, width: 1),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          5.ph,
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          5.ph,
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        date,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          10.ph,
          mainPage == "The payment was made" && checked
              ? SvgPicture.asset(
                  'assets/icons/correct_icon.svg',
                  width: 25,
                  height: 25,
                )
              : const Text(
                  "",
                )
        ],
      ),
    );
  }
}

class descriptionPatientCondition extends StatelessWidget {
  const descriptionPatientCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "description_of_the_patient's_condition".tr(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
        10.ph,
        Container(
          height: null,
          width: context.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'اعاني من كسر في ساقي اليمني نتيجة مباراة قدم في الاسبوع الماضي اتناول حاليا المسكنات ولكن دون جدوي , اتمني الوصول لحل قريب لمسكنات ولكن دون جدوي , اتمني الوصول لحل قريب لمسكنات ولكن دون جدوي , اتمني الوصول لحل قريب لمسكنات ولكن دون جدوي , اتمني الوصول لحل قريبا وشكرا',
              style: TextStyle(fontSize: 16.0, height: 1.5),
              textAlign: TextAlign.start,
            ),
          ),
        ),
        30.ph
      ],
    );
  }
}

class Reports extends StatelessWidget {
  const Reports({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "patient_reports".tr(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
        10.ph,
        SizedBox(
          width: context.width * 0.9,
          height: context.height * 0.2,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10),
                child: InkWell(
                  onTap: () {
                    AppConstants.customNavigation(
                        context,
                        FullScreenImage(pathImage: 'assets/images/report.png'),
                        1,
                        0);
                  },
                  child: Container(
                    width: context.width * 0.3,
                    height: context.height * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/report.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        30.ph
      ],
    );
  }
}

// ignore: must_be_immutable
class FullScreenImage extends StatelessWidget {
  String pathImage;
  FullScreenImage({super.key, required String this.pathImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, backButton: true),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: context.width,
          height: context.height,
          color: AppColors.blackColor,
          child: Image.asset(
            pathImage,
            width: context.width,
            height: context.height,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

class ButtonsForReview extends StatelessWidget {
  const ButtonsForReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: context.width * 0.25,
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: const BorderSide(color: Colors.red),
                ),
              ),
            ),
            child: Text(
              'rejecting_the_request'.tr(),
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
        ),
        SizedBox(
          width: context.width * 0.55,
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.primaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            child: Text(
              'accept_the_order_send_the_payment_request'.tr(),
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class CustomBottomNavigation extends StatefulWidget {
  int selectedIndex;
  CustomBottomNavigation({super.key, required int this.selectedIndex});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 103, 157, 252),
              Color.fromARGB(255, 155, 60, 172),
            ],
          ),
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/myRequests_icon.svg',
                width: 24,
                height: 24,
              ),
              label: 'طلباتي',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/messanger_icon.svg',
                width: 24,
                height: 24,
              ),
              label: 'المحادثات',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/notification_icon.svg',
                width: 24,
                height: 24,
              ),
              label: 'الإشعارات',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/setting_icon.svg',
                width: 24,
                height: 24,
              ),
              label: 'الإعدادت',
            ),
          ],
          currentIndex: widget.selectedIndex,
          onTap: (index) {
            AppConstants.customNavigation(
                context,
                HomeScreen(
                  selectedIndex: index,
                ),
                1,
                0);
          },
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}

class ButtonsForPayment extends StatelessWidget {
  const ButtonsForPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: context.width * 0.4,
          child: ElevatedButton(
            onPressed: () {
              AppConstants.customNavigation(context, ReportScreen(), 1, 0);
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.secondryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            child: Row(
              children: [
                Text(
                  'add_report'.tr(),
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                5.pw,
                SvgPicture.asset(
                  'assets/icons/report_icon.svg',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: context.width * 0.4,
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.primaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            child: Text(
              'end_the_first_session'.tr(),
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}
