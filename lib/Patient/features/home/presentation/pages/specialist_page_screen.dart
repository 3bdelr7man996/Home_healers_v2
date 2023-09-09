import 'package:dr/Patient/features/home/presentation/widgets/specialist_page_widgets.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class specialistpageScreen extends StatefulWidget {
  const specialistpageScreen({super.key});

  @override
  State<specialistpageScreen> createState() => _specialistpageScreenState();
}

class _specialistpageScreenState extends State<specialistpageScreen> {
  bool click = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              ApPBarForspecialistScreen(),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 75.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: [
                        specialistInfo(),
                        20.ph,
                        const Divider(
                          thickness: 1,
                        ),
                        5.ph,
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "شهادات مهنية :",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        5.ph,
                        Certificates(),
                        5.ph,
                        click
                            ? ButtonWithCounter()
                            : Container(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      click = !click;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: AppColors
                                        .primaryColor, // Background color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10), // BorderRadius
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
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 150,
            left: 30,
            right: 30,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // color of the shadow
                    spreadRadius: 5, // spread radius
                    blurRadius: 7, // blur radius
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(20.0), // Adjust the radius as desired
              ),
              height: 150,
              child: PictureForSpecialist(),
            ),
          ),
        ],
      ),
    );
  }
}
