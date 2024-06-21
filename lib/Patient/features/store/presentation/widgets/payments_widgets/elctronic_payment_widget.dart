import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:flutter/material.dart';

class ElctronicPaymentWidget extends StatefulWidget {
  const ElctronicPaymentWidget({super.key});

  @override
  State<ElctronicPaymentWidget> createState() => _ElctronicPaymentWidgetState();
}

class _ElctronicPaymentWidgetState extends State<ElctronicPaymentWidget> {
  int selectedValueForPayment = 1;

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
          Row(
            children: [
              AppConstants.customAssetSvg(
                imagePath: "assets/icons/payment_icon.svg",
                fit: BoxFit.none,
              ),
              10.pw,
              Text(
                "عن طريق الدفع الإلكتروني",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Radio(
            value: 1,
            groupValue: selectedValueForPayment,
            onChanged: (value) =>
                setState(() => selectedValueForPayment = value as int),
          ),
        ],
      ),
    );
  }
}
