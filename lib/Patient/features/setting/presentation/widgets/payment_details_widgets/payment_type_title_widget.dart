import 'package:dr/Patient/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class PaymentTypeTile extends StatelessWidget {
  const PaymentTypeTile({
    super.key,
    this.balance,
    required this.title,
    required this.icon,
    required this.value,
  });

  final String title;
  final String? balance;
  final String icon;
  final PayType value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            20.pw,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  5.ph,
                  if (balance != null)
                    Text(
                      "رصيدك ${balance} ريال سعودي",
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
                    value: value, //  PayType.wallet,
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
    );
  }
}
