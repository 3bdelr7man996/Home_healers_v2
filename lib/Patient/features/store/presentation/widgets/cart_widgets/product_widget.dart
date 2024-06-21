// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/store/presentation/pages/product_details_screen.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductCartWidget extends StatefulWidget {
  ProductCartWidget({
    super.key,
  });

  @override
  State<ProductCartWidget> createState() => _ProductCartWidgetState();
}

class _ProductCartWidgetState extends State<ProductCartWidget> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppConstants.customNavigation(context, ProductDetailsScreen(), -1, 0);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: AppConstants.customNetworkImage(
                      imagePath: "asd",
                      width: 121,
                      height: 136,
                      fit: BoxFit.fill,
                      imageError: "assets/images/placeholder.png",
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: InkWell(
                    onTap: () async {},
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.favorite,
                        size: 20,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "جبيرة طبية مستوردة",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    20.pw,
                    SvgPicture.asset(
                      "assets/icons/delete_item_cart_icon.svg",
                      width: 37.5,
                      height: 37.5,
                    ),
                  ],
                ),
                5.ph,
                Text(
                  "250 ريال سعودي",
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondryColor),
                ),
                5.ph,
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 1),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    5.pw,
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 1),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                        child: Center(child: Text("XL"))),
                  ],
                ),
                10.ph,
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          quantity = quantity + 1;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 5.0),
                        width: 32.0,
                        height: 32.0,
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
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    10.pw,
                    InkWell(
                      onTap: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity = quantity - 1;
                          });
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 5.0),
                        width: 32.0,
                        height: 32.0,
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
