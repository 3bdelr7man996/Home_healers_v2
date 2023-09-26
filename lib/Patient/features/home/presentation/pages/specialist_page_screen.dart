import 'package:dr/Patient/features/home/presentation/widgets/specialist_page_widgets.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class specialistpageScreen extends StatefulWidget {
  var Data;
  var status_id;
  specialistpageScreen({super.key, this.Data, this.status_id});

  @override
  State<specialistpageScreen> createState() => _specialistpageScreenState();
}

class _specialistpageScreenState extends State<specialistpageScreen> {
  bool click = false;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              ApPBarForspecialistScreen(),
              Container(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 75.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: [
                        specialistInfo(Data: widget.Data),
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
                        Certificates(Data: widget.Data['images']),
                        5.ph,
                        click
                            ? ButtonWithCounter(
                                Data: widget.Data, status_id: widget.status_id)
                            : Container(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      click = !click;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: AppColors.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(16.0),
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
            top: 140,
            left: 25,
            right: 25,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              height: 175,
              child: PictureForSpecialist(Data: widget.Data),
            ),
          ),
        ],
      ),
    );
  }
}
