import 'package:dr/Patient/features/home/presentation/widgets/filter_result_widgets/doctor_card_widget.dart';
import 'package:dr/Patient/features/offer/data/models/get_offers_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OfferScreen extends StatefulWidget {
  GetOffersModel Offers;
  var year;
  OfferScreen({super.key, required this.Offers, required this.year});

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  @override
  Widget build(BuildContext context) {
    List<Offers>? data = widget.Offers.offers;
    return Expanded(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return DoctorCard(
            sessionCountForOffer: data[index].sessionCount,
            offer: data[index],
            fromOffer: true,
            doctorInfo: data[index].advertiser!,
            year: widget.year,
          );
        },
      ),
    );
  }
}
