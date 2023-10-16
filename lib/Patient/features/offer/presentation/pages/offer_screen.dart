import 'package:dr/Patient/features/home/presentation/widgets/filter_result_widgets.dart';
import 'package:dr/Patient/features/offer/data/models/get_offers_model.dart';
import 'package:flutter/material.dart';

class OfferScreen extends StatefulWidget {
  var Offers;
  OfferScreen({super.key, required this.Offers});

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  bool _isVisible = false;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("aha");
    print(widget.Offers['offers'][0]['advertiser']['status_advisor']);
    var data = widget.Offers['offers'];
    return Expanded(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return DoctorCard(
              sessionCountForOffer: data[index]['session_count'],
              offer: data[index],
              fromOffer: true,
              Data: data[index]['advertiser'],
              name: data[index]['advertiser']['name_ar'],
              status: data[index]['advertiser']['status'],
              price: data[index]['advertiser']['session_price'],
              address: data[index]['advertiser']['address_ar'],
              statusAdvisor: data[index]['advertiser']['status_advisor'],
              categories: data[index]['advertiser']['categories'],
              image: data[index]['advertiser']['image'],
              toggleVisibility: _toggleVisibility,
              isVisible: _isVisible);
        },
      ),
    );
  }
}
