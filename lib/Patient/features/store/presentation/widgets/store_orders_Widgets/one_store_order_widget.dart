import 'package:dr/Patient/features/store/presentation/widgets/store_orders_Widgets/one_product_widget.dart';
import 'package:dr/Patient/features/store/presentation/widgets/store_orders_Widgets/order_status_widget.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';

class OneStoreOrder extends StatefulWidget {
  const OneStoreOrder({super.key});

  @override
  State<OneStoreOrder> createState() => _OneStoreOrderState();
}

class _OneStoreOrderState extends State<OneStoreOrder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5.0,
            spreadRadius: 2.0,
            offset: const Offset(0, 3.0),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("رقم الطلب : 1234567",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              Text("تاريخ الطلب : 12/12/2022",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
          ///////////////////All Products ///////////////////////////////
          10.ph,
          ListView.builder(
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              return OneProductWidget();
            },
          ),
          //////////////////////////Order Status /////////////////////////////////
          OrderStatusWidget()
        ],
      ),
    );
  }
}
