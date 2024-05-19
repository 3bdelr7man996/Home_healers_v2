// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:dr/Patient/features/offer/presentation/cubit/offer_cubit/offer_cubit.dart';
import 'package:dr/Patient/features/offer/presentation/cubit/offer_state/offer_state.dart';
import 'package:dr/Patient/features/setting/data/models/my_orders_model.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/payment_details_widgets/first_section_for_total_widget.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalDetails extends StatelessWidget {
  var selectedName;
  var type;
  var offerId;
  final OrderData order;
  var categories;
  TotalDetails(
      {super.key,
      required this.type,
      required this.offerId,
      required this.order,
      this.selectedName,
      this.categories});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOffersCubit, GetOffersState>(
      builder: (context, state) {
        return Container(
          width: context.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                FirstSection(
                  order: order,
                  type: type,
                  categories: categories,
                  selectedName: selectedName,
                  AllOffers: state.AllOffers,
                  offerId: offerId,
                ),
                5.ph,
                const Divider(
                  thickness: 1,
                ),
                5.ph,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("مدة الجلسة :"),
                    Text(
                      "30 : 60 دقيقة",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                5.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("عدد الجلسات :"),
                    Text(
                      order.sessionsCount != null
                          ? "${order.sessionsCount}"
                          : "",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                5.ph,
                type != null
                    ? SizedBox()
                    : order.advertiser.sessionPrice == null
                        ? SizedBox()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("سعر الجلسة :"),
                              Text(
                                "${order.advertiser.sessionPrice} ريال",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.secondryColor),
                              ),
                            ],
                          ),
                5.ph,
                type != null
                    ? SizedBox()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "كود الخصم :",
                            style: TextStyle(color: AppColors.primaryColor),
                          ),
                          order.coupon == null
                              ? Text(
                                  "لا يوجد",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primaryColor),
                                )
                              : Text(
                                  "${order.coupon}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                )
                        ],
                      ),
                5.ph,
                // const Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text("الضريبة :"),
                //     Text(
                //       "0 ريال",
                //       style: TextStyle(fontWeight: FontWeight.w500),
                //     ),
                //   ],
                // ),
                // 5.ph,
                const Divider(
                  thickness: 1,
                ),
                5.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "الإجمالي",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      order.advertiser.sessionPrice != null &&
                              order.sessionsCount != null
                          ? order.amount != 0
                              ? "${order.amount}"
                              : "${order.advertiser.sessionPrice! * order.sessionsCount} ريال"
                          : "0",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                10.ph,
              ],
            ),
          ),
        );
      },
    );
  }
}
