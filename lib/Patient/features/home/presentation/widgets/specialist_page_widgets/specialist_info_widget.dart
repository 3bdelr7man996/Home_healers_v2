// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/home/presentation/widgets/specialist_page_widgets/static_box_widget.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/auth/data/model/advertiser_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class specialistInfo extends StatefulWidget {
  Advertiser? doctorInfo;
  var years;
  specialistInfo({super.key, this.doctorInfo, required this.years});

  @override
  State<specialistInfo> createState() => _specialistInfoState();
}

class _specialistInfoState extends State<specialistInfo> {
  List<String> names = [];
  String selectedName = "";

  @override
  void initState() {
    super.initState();
    names.add("الأقسام :");
    for (var item in widget.doctorInfo!.statusAdvisor!) {
      names.add(item.nameAr!);
    }
    selectedName = names.isNotEmpty ? names[0] : 'No names available';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            statisticsBox(
              text1: "جلسة طبية",
              text2: "${widget.doctorInfo!.rating}",
            ),
            widget.years == null
                ? SizedBox()
                : statisticsBox(
                    text1: "سنوات الخبرة",
                    text2: "${widget.years}",
                  ),
            statisticsBox(
              text1: "تقييم",
              text2: "${widget.doctorInfo!.rating}",
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
            names.isNotEmpty
                ? Container(
                    height: 25,
                    child: DropdownButton<String>(
                      underline: Container(), // Hide the underline
                      // icon: const SizedBox(), // Hide the arrow icon
                      value: selectedName,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedName = newValue!;
                        });
                      },
                      items:
                          names.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  )
                : Text('No Data available')
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
            Text(
              "مدة الجلسة الواحدة: ${widget.doctorInfo!.sessionDur!} دقيقة",
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
              "سعر الجلسة الطبية : ",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              "${widget.doctorInfo!.sessionPrice} SAR",
              style: TextStyle(
                  fontWeight: FontWeight.w500, color: AppColors.secondryColor),
            ),
            10.pw,
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 4),
            //   child: RichText(
            //     text: const TextSpan(
            //       children: <TextSpan>[
            //         TextSpan(
            //           text: '800 SAR',
            //           style: TextStyle(
            //               color: Colors.grey,
            //               decoration: TextDecoration.lineThrough,
            //               decorationColor: Colors.grey,
            //               decorationThickness: 2.0,
            //               fontSize: 14),
            //         ),
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
        5.ph,
        Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: AppColors.primaryColor,
            ),
            10.pw,
            Expanded(
              child: Text(
                "${widget.doctorInfo!.addressAr}",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
