// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/setting/data/models/my_orders_model.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class ImageSectionForCard extends StatelessWidget {
  OrderData? listOfOrders;
  List<String>? categories;
  String? selectedName;
  ImageSectionForCard(
      {super.key,
      required this.categories,
      required this.listOfOrders,
      required this.selectedName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: AppConstants.customNetworkImage(
              width: context.width * 0.2,
              height: context.width * 0.2,
              imageError: AppImages.doctorPlaceholder,
              imagePath: "${listOfOrders!.advertiser.image}",
            ),
          ),
          10.pw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${listOfOrders!.advertiser.nameAr}",
                  style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                if (categories != null)
                  categories!.isNotEmpty
                      ? DropdownButton<String>(
                          padding: EdgeInsets.zero,
                          underline: SizedBox(),
                          value: selectedName,
                          //iconEnabledColor: Colors.white,
                          // isExpanded: true,
                          onChanged: (String? newValue) {},
                          items: categories!
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: SizedBox(
                                width: 80.0,
                                child: Text(
                                  value,
                                  style: TextStyle(fontSize: 14.0),
                                ),
                              ),
                            );
                          }).toList(),
                        )
                      : const Text(''),
              ],
            ),
          )
        ],
      ),
    );
  }
}
