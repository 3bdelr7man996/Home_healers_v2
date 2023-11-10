import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BlueSection extends StatefulWidget {
  var oneOrder;
  BlueSection({super.key, this.oneOrder});

  @override
  State<BlueSection> createState() => _BlueSectionState();
}

class _BlueSectionState extends State<BlueSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(129, 109, 219, 244),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "التاريخ و الوقت : ${widget.oneOrder.createdAt}",
                ),
                SvgPicture.asset(
                  "assets/images/mainlogo.svg",
                  width: 45,
                  height: 45,
                ),
              ],
            ),
            10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("السجل الضريبي :12345678910"),
                Text("+96612345678")
              ],
            ),
            10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text("www.HomeHealers.com")],
            )
          ],
        ),
      ),
    );
  }
}
