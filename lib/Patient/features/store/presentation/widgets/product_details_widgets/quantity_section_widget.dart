import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class QuantitySectionWidget extends StatefulWidget {
  const QuantitySectionWidget({super.key});

  @override
  State<QuantitySectionWidget> createState() => _QuantitySectionWidgetState();
}

class _QuantitySectionWidgetState extends State<QuantitySectionWidget> {
  int quantity = 1;
  int price = 250;
  int baseprice = 250;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "اختر الكمية : ",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Divider(
                  thickness: 0.5,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        quantity = quantity + 1;
                        price = price + baseprice;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 5.0),
                      width: 45.0,
                      height: 45.0,
                      child: Center(
                          child: Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  10.pw,
                  Text(
                    "$quantity",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  10.pw,
                  InkWell(
                    onTap: () {
                      if (quantity > 1) {
                        setState(() {
                          quantity = quantity - 1;
                          price = price - baseprice;
                        });
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 5.0),
                      width: 45.0,
                      height: 45.0,
                      child: Center(
                          child: Icon(
                        Icons.remove,
                        color: AppColors.primaryColor,
                      )),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "${price} ريال سعودي",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: AppColors.secondryColor),
              )
            ],
          ),
        ),
      ],
    );
  }
}
