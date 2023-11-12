// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class TotalDetails extends StatelessWidget {
  bool withOffer;
  TotalDetails({super.key, required this.withOffer});

  @override
  Widget build(BuildContext context) {
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
            Row(
              children: [
                Image.asset(
                  "assets/images/person2.png",
                  width: 100,
                  height: 75,
                ),
                5.pw,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "فارس الفارس",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      withOffer ? 5.ph : 10.ph,
                      const Text(
                        "أخصائي علاج طبيعي",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14),
                      ),
                      withOffer ? 5.ph : 0.ph,
                      withOffer
                          ? Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/offer_icon.svg",
                                  color: AppColors.primaryColor,
                                  width: 20,
                                  height: 20,
                                ),
                                5.pw,
                                Expanded(
                                    child: Text("عرض 12 جلسة - عمود فقري")),
                              ],
                            )
                          : SizedBox()
                    ],
                  ),
                )
              ],
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("عدد الجلسات :"),
                Text(
                  "4",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            5.ph,
            withOffer
                ? SizedBox()
                : const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("سعر الجلسة :"),
                      Text(
                        "250 ريال",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.secondryColor),
                      ),
                    ],
                  ),
            5.ph,
            withOffer
                ? SizedBox()
                : const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "كود الخصم :",
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                      Text(
                        "لا يوجد",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor),
                      ),
                    ],
                  ),
            5.ph,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("الضريبة :"),
                Text(
                  "0 ريال",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            5.ph,
            const Divider(
              thickness: 1,
            ),
            5.ph,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "الإجمالي",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "1000 ريال",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            10.ph,
          ],
        ),
      ),
    );
  }
}

class WaysForPayment extends StatefulWidget {
  const WaysForPayment({super.key});

  @override
  State<WaysForPayment> createState() => _WaysForPaymentState();
}

class _WaysForPaymentState extends State<WaysForPayment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: context.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                SvgPicture.asset("assets/icons/budget_icon_for_payment.svg"),
                20.pw,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "عن طريق المحفظة",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      5.ph,
                      const Text(
                        "رصيدك 1500 ريال سعودي",
                        style: TextStyle(
                            fontSize: 12,
                            color: AppColors.secondryColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<PaymentCubit, PaymentState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: 25,
                      height: 50,
                      child: RadioListTile(
                        activeColor: AppColors.primaryColor,
                        value: PayType.wallet,
                        groupValue: state.selectedPayType,
                        onChanged: (value) {
                          context.read<PaymentCubit>().onSelectPayType(value!);
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
        10.ph,
        Container(
          width: context.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                SvgPicture.asset(
                    "assets/icons/budget_outline_icon_for_payment.svg"),
                20.pw,
                const Expanded(
                  child: Text(
                    "عن طريق البطاقة الائتمانية",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                BlocBuilder<PaymentCubit, PaymentState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: 25,
                      height: 50,
                      child: RadioListTile(
                        activeColor: AppColors.primaryColor,
                        value: PayType.visa,
                        groupValue: state.selectedPayType,
                        onChanged: (value) {
                          context.read<PaymentCubit>().onSelectPayType(value!);
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
