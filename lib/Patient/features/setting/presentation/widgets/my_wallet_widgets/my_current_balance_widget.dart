import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyCurrentBalance extends StatelessWidget {
  const MyCurrentBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 108, 210, 233),
            Color.fromARGB(173, 116, 10, 154)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            children: [
              Text(
                "الرصيد الحالي",
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              15.ph,
              Text(
                "1500 SAR",
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "شحن",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(173, 116, 10, 154)),
                ),
                5.pw,
                SvgPicture.asset("assets/icons/add2_icon.svg")
              ],
            ),
          )
        ]),
      ),
    );
  }
}
