// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:dr/Patient/features/payment/presentation/pages/visa_payment_screen.dart';
import 'package:dr/Patient/features/setting/data/models/my_orders_model.dart';
import 'package:dr/Patient/features/setting/presentation/pages/choose_card_for_payment_screen.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/payment_details_widgets.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class PaymentDetailsScreen extends StatefulWidget {
  bool withOffer;
  final OrderData order;
  var categories;
  var selectedName;
  PaymentDetailsScreen({
    super.key,
    this.withOffer = false,
    required this.order,
    this.categories,
    this.selectedName,
  });

  @override
  State<PaymentDetailsScreen> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  @override
  void initState() {
    context.read<PaymentCubit>().resetPayData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.order);
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
              TotalDetails(
                  withOffer: false,
                  order: widget.order,
                  selectedName: widget.selectedName,
                  categories: widget.categories),
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
              BlocBuilder<PaymentCubit, PaymentState>(
                builder: (context, state) {
                  if (state.payWalletState == RequestState.loading ||
                      state.payState == RequestState.loading) {
                    return CustomLoader(
                      padding: 0,
                    );
                  } else {
                    return SizedBox(
                      width: context.width,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.primaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          //log('${context.read<PaymentCubit>().state.selectedPayType}');
                          if (state.selectedPayType == null) {
                            return;
                          }
                          switch (state.selectedPayType) {
                            case PayType.wallet:
                              context
                                  .read<PaymentCubit>()
                                  .payByWallet(context, order: widget.order);
                              break;
                            case PayType.visa:
                              AppConstants.customNavigation(context,
                                  ChooseCardScreen(order: widget.order), 0, 1);
                              break;
                            case PayType.tamara:
                              await context
                                  .read<PaymentCubit>()
                                  .payByTamara(
                                      reservationParentId: widget.order.id)
                                  .then((value) {
                                if (value == true) {
                                  AppConstants.customNavigation(
                                      context,
                                      VisaPaymentScreen(myOrder: widget.order),
                                      0,
                                      1);
                                }
                              });
                              break;
                            default:
                          }
                        },
                        child: const Text('تابع'),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
