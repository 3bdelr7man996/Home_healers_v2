import 'package:dr/Patient/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:dr/Patient/features/payment/presentation/pages/visa_payment_screen.dart';
import 'package:dr/Patient/features/setting/data/models/my_orders_model.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/choose_card_for_payment_widgets.dart';

class ChooseCardScreen extends StatelessWidget {
  const ChooseCardScreen({super.key, required this.order});
  final OrderData order;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: "choose_card", backButton: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "اختر الكارد الخاصة بك :",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
            ),

            20.ph,
            BlocBuilder<PaymentCubit, PaymentState>(
              buildWhen: (previous, current) =>
                  previous.selectedPayType != current.selectedPayType,
              builder: (context, state) {
                return CardWay(
                  iconPath: "assets/images/tamara.png",
                  title: "Tamara",
                  selected: state.selectedPayType == PayType.tamara,
                  onTap: () => context
                      .read<PaymentCubit>()
                      .onSelectPayType(PayType.tamara),
                );
              },
            ),

            // 20.ph,
            // CardWay(
            //   iconPath: "assets/icons/paypal_icon.svg",
            //   title: "PayPal",
            // ),
            //?============================================================
            // 20.ph,
            // BlocBuilder<PaymentCubit, PaymentState>(
            // buildWhen: (previous, current) =>
            //     previous.selectedPayType != current.selectedPayType,
            //   builder: (context, state) {
            //     return CardWay(
            //       iconPath: "assets/icons/Apple_pay_icon.svg",
            //       title: "Apple PAy",
            //       selected: state.selectedPayType == PayType.apple,
            //       onTap: () => context
            //           .read<PaymentCubit>()
            //           .onSelectPayType(PayType.apple),
            //     );
            //   },
            // ),
            //?==============================================================
            // 20.ph,
            // CardWay(
            //   iconPath: "assets/images/stc_pay.png",
            //   num: 1,
            //   title: "Stc Pay",
            // ),
            20.ph,
            BlocBuilder<PaymentCubit, PaymentState>(
              // buildWhen: (previous, current) =>
              //     previous.selectedPayType != current.selectedPayType,
              builder: (context, state) {
                return CardWay(
                  iconPath: "assets/icons/visa_card_icon.svg",
                  title: "Visa",
                  selected: state.selectedPayType == PayType.tap,
                  onTap: () =>
                      context.read<PaymentCubit>().onSelectPayType(PayType.tap),
                );
              },
            ),
            20.ph,
            BlocBuilder<PaymentCubit, PaymentState>(
              builder: (context, state) {
                if (state.payState == RequestState.loading) {
                  return const CustomLoader(
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
                        switch (state.selectedPayType) {
                          case PayType.tap:
                            await context
                                .read<PaymentCubit>()
                                .payByVisa(reservationParentId: order.id)
                                .then((value) {
                              if (value == true) {
                                AppConstants.customNavigation(context,
                                    VisaPaymentScreen(myOrder: order), 0, 1);
                              }
                            });
                            break;
                          case PayType.tamara:
                            await context
                                .read<PaymentCubit>()
                                .payByTamara(reservationParentId: order.id)
                                .then((value) {
                              if (value == true) {
                                AppConstants.customNavigation(context,
                                    VisaPaymentScreen(myOrder: order), 0, 1);
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
    );
  }
}
