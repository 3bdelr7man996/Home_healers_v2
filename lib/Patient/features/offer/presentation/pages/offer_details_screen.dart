import 'package:dr/Patient/features/home/presentation/widgets/filter_result_widgets.dart';
import 'package:dr/Patient/features/home/presentation/widgets/home_widgets.dart';
import 'package:dr/Patient/features/home/presentation/widgets/sections_details_widgets.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class OfferDetailsScreen extends StatefulWidget {
  const OfferDetailsScreen({super.key});

  @override
  State<OfferDetailsScreen> createState() => _OfferDetailsScreenState();
}

class _OfferDetailsScreenState extends State<OfferDetailsScreen> {
  bool _isVisible = false;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          customAppBar(context, backButton: true, title: "spinal_pain_offers"),
      bottomNavigationBar: BottomNavigationForPatient(selectedIndex: 0),
      body: Stack(
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: FilterForSectionDetails(),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return DoctorCard(
                        toggleVisibility: _toggleVisibility,
                        fromOfferScreen: true,
                        isVisible: _isVisible);
                  },
                ),
              )
            ],
          ),
          PopUpForAddToFavourite(
            isVisible: _isVisible,
            toggleVisibility: _toggleVisibility,
          )
        ],
      ),
    );
  }
}
