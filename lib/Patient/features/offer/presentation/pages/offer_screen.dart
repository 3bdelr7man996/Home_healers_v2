import 'package:dr/Patient/features/offer/presentation/widgets/offer_widgets.dart';

import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key});

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: "Offer", backButton: false),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [OfferCard(), OfferCard()],
          );
        },
      ),
    );
  }
}
