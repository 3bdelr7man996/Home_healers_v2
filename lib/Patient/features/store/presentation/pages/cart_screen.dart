import 'package:dr/Patient/features/store/presentation/pages/payment_screen.dart';
import 'package:dr/Patient/features/store/presentation/widgets/cart_widgets/purchase_details_widget.dart';
import 'package:dr/Patient/features/store/presentation/widgets/cart_widgets/product_widget.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../widgets/cart_widgets/coupon_field_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: "سلة التسوق"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'لقد أضفت (',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ' 3 منتجات ',
                          style: TextStyle(
                              color: AppColors.hintColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ')',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              10.ph,
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ProductCartWidget();
                },
              ),
              25.0.ph,
              CopunFieldWidget(),
              25.0.ph,
              Text(
                "تفاصيل عملية الشراء",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              15.0.ph,
              PurchaseDetailsWidget(),
              15.ph,
              SizedBox(
                  width: context.width,
                  child: ElevatedButton(
                      onPressed: () {
                        AppConstants.customNavigation(
                            context, PaymentScreen(), -1, 0);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("الاستمرار للدفع"),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
