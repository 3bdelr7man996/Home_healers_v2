import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/features/auth/presentation/pages/select_roll_for_sign_in.dart';
import 'package:dr/features/splash/presentation/pages/third_screen.dart';
import 'package:dr/features/splash/presentation/pages/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/secondPage.svg",
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const Text(
              "عائلة هوم هيلرز  :",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const Text(
              "احجز جلستك الطبية المنزلية مع افضل الاخصائين في العلاج الطبيعي والتاهيل الطبي المنزلي في راحة بيتك وبامكانك الحجز مع الاخصائي المتاح حاليا في التطبيق او حجز موعد معه",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width * 0.08,
                  height: height * 0.02,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 198, 217, 233),
                    borderRadius: BorderRadius.all(
                      Radius.circular(width * 0.02),
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                Container(
                  width: width * 0.12,
                  height: height * 0.02,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 55, 210, 244),
                    borderRadius: BorderRadius.all(
                      Radius.circular(width * 0.02),
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                Container(
                  width: width * 0.08,
                  height: height * 0.02,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 198, 217, 233),
                    borderRadius: BorderRadius.all(
                      Radius.circular(width * 0.02),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(width * 0.06),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    AppConstants.customNavigation(context, ThirdScreen(), 1, 0);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10),
                    backgroundColor: Color(0xFF37D2F4),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(Icons.arrow_back),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: Color(0xFF37D2F4),
                    padding: EdgeInsets.all(10),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: InkWell(
                onTap: () {
                  AppConstants.customNavigation(
                      context, SelectRollForSignIn(), -0.5, -0.5);
                },
                child: Text(
                  "تخطي",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
