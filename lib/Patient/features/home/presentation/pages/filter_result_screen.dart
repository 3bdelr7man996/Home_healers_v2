import 'package:dr/Patient/features/home/presentation/widgets/filter_result_widgets.dart';
import 'package:dr/Patient/features/home/presentation/widgets/home_widgets.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class FilterResultScreen extends StatefulWidget {
  const FilterResultScreen({super.key});

  @override
  State<FilterResultScreen> createState() => _FilterResultScreenState();
}

class _FilterResultScreenState extends State<FilterResultScreen> {
  bool _isVisible = false;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: "filter_result", backButton: true),
      bottomNavigationBar: BottomNavigationForPatient(selectedIndex: 2),
      body: Stack(children: [
        ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return DoctorCard(
                toggleVisibility: _toggleVisibility, isVisible: _isVisible);
          },
        ),
        PopUpForAddToFavourite(
          isVisible: _isVisible,
          toggleVisibility: _toggleVisibility,
        )
      ]),
    );
  }
}
