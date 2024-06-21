import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:flutter/widgets.dart';

class OneProductWidget extends StatefulWidget {
  const OneProductWidget({super.key});

  @override
  State<OneProductWidget> createState() => _OneProductWidgetState();
}

class _OneProductWidgetState extends State<OneProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text("2 x",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
          10.pw,
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: AppConstants.customNetworkImage(
              imagePath: "asd",
              width: 55,
              height: 62,
              fit: BoxFit.fill,
              imageError: "assets/images/placeholder.png",
            ),
          ),
          10.pw,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "جبيرة طبية مستوردة",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
              10.ph,
              Text("250 ريال سعودي",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondryColor,
                      fontSize: 16.0))
            ],
          )
        ],
      ),
    );
  }
}
