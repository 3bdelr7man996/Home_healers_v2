import 'package:dr/Patient/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:dr/Patient/features/payment/presentation/pages/visa_payment_screen.dart';
import 'package:dr/Patient/features/setting/data/models/my_orders_model.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocBuilder<PaymentCubit, PaymentState>(
        builder: (context, state) {
          if (state.payState == RequestState.loading) {
            return const CustomLoader(
              padding: 0,
            );
          } else {
            return Container(
              width: context.width,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () async {
                  await context
                      .read<PaymentCubit>()
                      .payByVisa(reservationParentId: order.id)
                      .then((value) {
                    if (value == true) {
                      AppConstants.customNavigation(
                          context, VisaPaymentScreen(myOrder: order), 0, 1);
                    }
                  });
                },
                child: const Text('تابع'),
              ),
            );
          }
        },
      ),
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
                  previous.selectedPayCard != current.selectedPayCard,
              builder: (context, state) {
                return CardWay(
                  iconPath: AppImages.masterCard,
                  title: "ماستر كارد",
                  selected: state.selectedPayCard == PayCard.master,
                  onTap: () => context
                      .read<PaymentCubit>()
                      .onSelectPayCard(PayCard.master),
                );
              },
            ),
            20.ph,
            BlocBuilder<PaymentCubit, PaymentState>(
              buildWhen: (previous, current) =>
                  previous.selectedPayCard != current.selectedPayCard,
              builder: (context, state) {
                return CardWay(
                  iconPath: AppImages.visaCard,
                  title: "فيزة كارد",
                  selected: state.selectedPayCard == PayCard.visa,
                  onTap: () => context
                      .read<PaymentCubit>()
                      .onSelectPayCard(PayCard.visa),
                );
              },
            ),
            20.ph,
            BlocBuilder<PaymentCubit, PaymentState>(
              buildWhen: (previous, current) =>
                  previous.selectedPayCard != current.selectedPayCard,
              builder: (context, state) {
                return CardWay(
                  iconPath: AppImages.madaCard,
                  title: "مدى كارد",
                  selected: state.selectedPayCard == PayCard.mada,
                  onTap: () => context
                      .read<PaymentCubit>()
                      .onSelectPayCard(PayCard.mada),
                );
              },
            ),
            20.ph,
            BlocBuilder<PaymentCubit, PaymentState>(
              buildWhen: (previous, current) =>
                  previous.selectedPayCard != current.selectedPayCard,
              builder: (context, state) {
                return CardWay(
                  iconPath: AppImages.americanExCard,
                  title: "أمريكان إكسبريس كارد",
                  selected: state.selectedPayCard == PayCard.american,
                  onTap: () => context
                      .read<PaymentCubit>()
                      .onSelectPayCard(PayCard.american),
                );
              },
            ),
            20.ph,
          ],
        ),
      ),
    );
  }
}
