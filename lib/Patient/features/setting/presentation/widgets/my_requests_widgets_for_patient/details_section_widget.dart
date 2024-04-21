// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/setting/data/models/my_orders_model.dart';
import 'package:dr/Patient/features/setting/presentation/pages/requests_details_screen.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DetailsSectionForCard extends StatelessWidget {
  OrderData? listOfOrders;
  int TabIndexClicked;
  DetailsSectionForCard(
      {super.key, required this.listOfOrders, required this.TabIndexClicked});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (listOfOrders!.parentId == 0)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      const Text(
                        "السعر الكلي: ",
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.w500),
                      ),
                      5.pw,
                      Flexible(
                        child: Text(
                          listOfOrders!.amount != null &&
                                  listOfOrders!.amount != 0
                              ? "${listOfOrders!.amount ?? 0} ${"sar".tr()}"
                              : listOfOrders!.advertiser.sessionPrice != null
                                  ? "${listOfOrders!.advertiser.sessionPrice! * listOfOrders!.sessionsCount} ${"sar".tr()}"
                                  : "0 ${"sar".tr()}",
                          style: const TextStyle(
                              fontSize: 12.0,
                              color: AppColors.secondryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              10.ph,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "عدد الجلسات : ${listOfOrders!.sessionsCount}",
                  style: const TextStyle(
                      fontSize: 14.0, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SizedBox(
            height: context.height * 0.05,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.primaryColor,
                backgroundColor: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: AppColors.primaryColor),
                ),
              ),
              onPressed: () {
                List<String> names = [];
                String selectedName = "";
                names.add("الاختصاص");
                for (var item in listOfOrders!.advertiser.categories!) {
                  names.add(item.nameAr!);
                }
                selectedName =
                    names.isNotEmpty ? names[0] : 'No names available';
                AppConstants.customNavigation(
                    context,
                    RequestsDetailsScreenForPatient(
                      oneOrder: listOfOrders,
                      categories: names,
                      selectedName: selectedName,
                      TabIndexClicked: TabIndexClicked,
                    ),
                    -1,
                    0);
              },
              child: Text('order_details'.tr()),
            ),
          ),
        )
      ],
    );
  }
}
