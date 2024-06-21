import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TamaraWidget extends StatefulWidget {
  const TamaraWidget({super.key});

  @override
  State<TamaraWidget> createState() => _TamaraWidgetState();
}

class _TamaraWidgetState extends State<TamaraWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "احجز الآن وادفع لاحقاً",
                style: TextStyle(fontSize: 20.0),
              ),
              10.ph,
              Row(
                children: [
                  Text(
                    "مدعوم من ",
                    style: TextStyle(color: AppColors.secondryColor),
                  ),
                  Image.asset("assets/images/tamara_icons.png")
                ],
              )
            ],
          ),
          Icon(Icons.arrow_forward_ios_outlined)
        ],
      ),
    );
  }
}
