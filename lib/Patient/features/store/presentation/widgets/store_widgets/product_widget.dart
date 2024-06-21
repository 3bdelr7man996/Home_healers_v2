// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/store/presentation/pages/product_details_screen.dart';
import 'package:dr/Patient/features/store/presentation/widgets/store_widgets/colors_widget.dart';
import 'package:dr/Patient/features/store/presentation/widgets/store_widgets/sizes_widget.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductWidget extends StatefulWidget {
  bool allColors, allSizes;
  ProductWidget({super.key, required this.allSizes, required this.allColors});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
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
                Text(
                  "جبيرة طبية مستوردة",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
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
                widget.allSizes
                    ? Text(
                        "متوفر جميع المقاسات",
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      )
                    : SizesWidget(sizes: ["x", "xxl", "l", "x", "xxl", "l"]),
                5.ph,
                widget.allColors
                    ? Text(
                        "متوفر جميع الألوان",
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      )
                    : ColorsWidget(colors: ["#ffff", "#ffff"]),
                5.ph,
                ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text("أضف إلى سلة التسوق "),
                        SvgPicture.asset(
                          "assets/icons/basket_icon.svg",
                          width: 37.5,
                          color: Colors.white,
                          height: 37.5,
                        ),
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
