import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class OrderStatusWidget extends StatefulWidget {
  const OrderStatusWidget({super.key});

  @override
  State<OrderStatusWidget> createState() => _OrderStatusWidgetState();
}

class _OrderStatusWidgetState extends State<OrderStatusWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        20.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "إجمالي التكلفة ",
              style: TextStyle(color: AppColors.textGrey),
            ),
            Text(
              "1500 ر.س",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        20.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "تم الدفع",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.greenColor),
            )
          ],
        ),
        20.ph,
        InkWell(
          onTap: () {},
          child: Container(
            width: 114,
            height: 27,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryColor,
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
            child: Center(
              child: Text(
                "إظهار الفاتورة",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
            ),
          ),
        )
      ],
    );
  }
}
