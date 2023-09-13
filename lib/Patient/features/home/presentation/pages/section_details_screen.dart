import 'package:dr/Patient/features/home/presentation/widgets/filter_result_widgets.dart';
import 'package:dr/Patient/features/home/presentation/widgets/home_widgets.dart';
import 'package:dr/Patient/features/home/presentation/widgets/sections_details_widgets.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SectionDetailsScreen extends StatefulWidget {
  var SectiondetailsTitle;
  SectionDetailsScreen({super.key, required this.SectiondetailsTitle});

  @override
  State<SectionDetailsScreen> createState() => _SectionDetailsScreenState();
}

class _SectionDetailsScreenState extends State<SectionDetailsScreen> {
  bool _isVisible = false;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,
          backButton: true, title: widget.SectiondetailsTitle),
      bottomNavigationBar: BottomNavigationForPatient(selectedIndex: 2),
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
