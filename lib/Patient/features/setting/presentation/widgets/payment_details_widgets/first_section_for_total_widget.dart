// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/offer/presentation/cubit/offer_cubit/package_cubit.dart';
import 'package:dr/Patient/features/offer/presentation/cubit/offer_state/package_state.dart';
import 'package:dr/Patient/features/setting/data/models/my_orders_model.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class FirstSection extends StatelessWidget {
  OrderData order;
  var type, categories, selectedName, AllOffers, offerId;
  FirstSection(
      {super.key,
      required this.order,
      required this.type,
      required this.categories,
      required this.selectedName,
      required this.AllOffers,
      required this.offerId});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          child: AppConstants.customNetworkImage(
            imagePath: "${order.advertiser.image}",
            imageError: AppImages.doctorPlaceholder,
            width: context.width * 0.25,
            height: context.width * 0.25 - 10,
          ),
        ),
        5.pw,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.advertiser.nameAr!,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              type != null ? 5.ph : 10.ph,
              categories.isNotEmpty
                  ? SizedBox(
                      height: 35,
                      child: DropdownButton<String>(
                        padding: EdgeInsets.zero,
                        underline: SizedBox(), // Hide the underline
                        value: selectedName,
                        onChanged: (String? newValue) {},
                        items: categories
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 14.0),
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  : const Text('No Data available'),
              type != null ? 5.ph : 0.ph,
              type != null
                  ? BlocBuilder<GetPackagesCubit, GetPackagesState>(
                      builder: (context, value) {
                        return AllOffers == null && value.AllPackages == null
                            ? SizedBox()
                            : Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/offer_icon.svg",
                                    color: AppColors.primaryColor,
                                    width: 20,
                                    height: 20,
                                  ),
                                  5.pw,
                                  if (type == "offer")
                                    for (int i = 0;
                                        i < AllOffers!.offers.length;
                                        i++)
                                      AllOffers!.offers[i].id == offerId
                                          ? Expanded(
                                              child: Text(AllOffers!
                                                      .offers[i].description ??
                                                  "عن طريق العرض"))
                                          : SizedBox(),
                                  if (type == "package")
                                    for (int i = 0;
                                        i < value.AllPackages!.packages.length;
                                        i++)
                                      value.AllPackages!.packages[i].id ==
                                              offerId
                                          ? Expanded(
                                              child: Text(value
                                                      .AllPackages!
                                                      .packages[i]
                                                      .description ??
                                                  "عن طريق الباكدج"))
                                          : SizedBox()
                                ],
                              );
                      },
                    )
                  : SizedBox()
            ],
          ),
        )
      ],
    );
  }
}
