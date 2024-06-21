import 'package:dr/Patient/features/store/presentation/widgets/store_widgets/appbar_widget.dart';
import 'package:dr/Patient/features/store/presentation/widgets/store_widgets/product_widget.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidgetForStore(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "المنتجات المتوفرة",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              20.ph,
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ProductWidget(
                    allColors: false,
                    allSizes: true,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
