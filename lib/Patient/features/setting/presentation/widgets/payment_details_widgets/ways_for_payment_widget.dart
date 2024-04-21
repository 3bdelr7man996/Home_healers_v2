import 'package:dr/Patient/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/payment_details_widgets/payment_type_title_widget.dart';
import 'package:dr/core/extensions/padding_extension.dart';

import 'package:dr/core/utils/app_images.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        BlocBuilder<PaymentCubit, PaymentState>(
          builder: (context, state) {
            return PaymentTypeTile(
              title: "عن طريق المحفظة الاليكترونية",
              balance: state.balanceState == RequestState.loading
                  ? ""
                  : state.walletBalance ?? '0', //todo
              value: PayType.wallet,
              icon: AppImages.walletIcon,
            );
          },
        ),
        10.ph,
        PaymentTypeTile(
          title: "عن طريق البطاقة الائتمانية",
          value: PayType.visa,
          icon: AppImages.budgetIcon,
        ),
        10.ph,
        PaymentTypeTile(
          title: "عن طريق تمارا",
          value: PayType.tamara,
          icon: AppImages.budgetIcon,
        ),
      ],
    );
  }
}
