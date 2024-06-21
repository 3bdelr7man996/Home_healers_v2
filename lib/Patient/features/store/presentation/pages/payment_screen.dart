import 'package:dr/Patient/features/store/presentation/pages/confirm_payment_screen.dart';
import 'package:dr/Patient/features/store/presentation/widgets/cart_widgets/purchase_details_widget.dart';
import 'package:dr/Patient/features/store/presentation/widgets/payments_widgets/address_widget.dart';
import 'package:dr/Patient/features/store/presentation/widgets/payments_widgets/elctronic_payment_widget.dart';
import 'package:dr/Patient/features/store/presentation/widgets/payments_widgets/tamara_widget.dart';
import 'package:dr/Patient/features/store/presentation/widgets/payments_widgets/wallet_widget.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: "الدفع"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "تفاصيل عملية الشراء",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              10.ph,
              PurchaseDetailsWidget(withWalletDiscount: true),
              25.ph,
              Row(
                children: [
                  Text(
                    "اختر العنوان الخاص بك",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              10.ph,
              AddressWidget(),
              20.ph,
              WalletWidget(),
              25.ph,
              Row(
                children: [
                  Text(
                    "اختر طريقة الدفع",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              10.ph,
              ElctronicPaymentWidget(),
              10.ph,
              TamaraWidget(),
              25.ph,
              Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: context.width,
                  child: ElevatedButton(
                      onPressed: () {
                        AppConstants.customNavigation(
                            context, confirmPaymentScreen(), -1, 0);
                      },
                      child: Text("الاستمرار للدفع")))
            ],
          ),
        ),
      ),
    );
  }
}
