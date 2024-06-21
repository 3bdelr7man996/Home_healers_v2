// ignore_for_file: deprecated_member_use

import 'package:dr/Patient/features/store/presentation/widgets/product_details_widgets/add_to_cart_button_widget.dart';
import 'package:dr/Patient/features/store/presentation/widgets/product_details_widgets/color_section_widget.dart';
import 'package:dr/Patient/features/store/presentation/widgets/product_details_widgets/go_to_cart_button_widget.dart';
import 'package:dr/Patient/features/store/presentation/widgets/product_details_widgets/image_banner_widget.dart';
import 'package:dr/Patient/features/store/presentation/widgets/product_details_widgets/product_info_widget.dart';
import 'package:dr/Patient/features/store/presentation/widgets/product_details_widgets/product_text_details_widget.dart';
import 'package:dr/Patient/features/store/presentation/widgets/product_details_widgets/quantity_section_widget.dart';
import 'package:dr/Patient/features/store/presentation/widgets/product_details_widgets/sizes_section_widget.dart';
import 'package:dr/Patient/features/store/presentation/widgets/store_widgets/appbar_widget.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidgetForStore(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImagesBannersWidget(),
            Divider(
              thickness: 0.5,
            ),
            ProductInfoWidget(),
            ProductTextDetailsWidget(),
            ColorSectionWidget(),
            SizesSectionWidget(),
            QuantitySectionWidget(),
            20.ph,
            AddToCartButtonWidget(),
            GoToCartButtonWidget()
          ],
        ),
      ),
    );
  }
}
