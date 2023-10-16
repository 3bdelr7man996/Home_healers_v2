// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/setting/presentation/pages/choose_card_for_payment_screen.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/payment_details_widgets.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentDetailsScreen extends StatefulWidget {
  bool withOffer;
  PaymentDetailsScreen({super.key, this.withOffer = false});

  @override
  State<PaymentDetailsScreen> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: "payment_details", backButton: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "تفاصيل الإجمالي",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                ),
              ),
              10.ph,
              TotalDetails(withOffer: widget.withOffer),
              widget.withOffer ? 0.ph : 20.ph,
              widget.withOffer
                  ? const SizedBox.shrink()
                  : TextField(
                      decoration: InputDecoration(
                        hintText: 'ادخل كود الخصم',
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            "assets/icons/percent_icon.svg",
                            width: 5,
                            height: 5,
                          ),
                        ),
                      ),
                    ),
              20.ph,
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "اختر طريقة الدفع :",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                ),
              ),
              10.ph,
              const WaysForPayment(),
              15.ph,
              SizedBox(
                width: context.width,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {
                    AppConstants.customNavigation(
                        context, ChooseCard_screen(), -1, 0);
                  },
                  child: Text('تابع'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
