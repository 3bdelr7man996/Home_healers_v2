import 'package:dr/Patient/features/home/presentation/cubit/home_cubit/filter_cubit.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_state/filter_state.dart';
import 'package:dr/Patient/features/home/presentation/widgets/filter_result_widgets/doctor_card_widget.dart';
import 'package:dr/Patient/features/home/presentation/widgets/filter_result_widgets/popUp_favourite_widget.dart';
import 'package:dr/Patient/features/home/presentation/widgets/home_widgets/home_widgets.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterResultScreen extends StatefulWidget {
  FilterResultScreen({super.key});

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
        body: BlocBuilder<FilterCubit, FilterState>(
          builder: (context, state) {
            if (state.Loading) {
              return CustomLoader(
                padding: 0,
              );
            } else if (!state.Loading &&
                state.filterDataList != null &&
                state.filterDataList!.isNotEmpty) {
              return Stack(children: [
                ListView.builder(
                  itemCount: state.filterDataList?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return DoctorCard(
                        fromFilter: true,
                        doctorInfo: state.filterDataList![index],
                        year: state.filterDataList![index].years,
                        toggleVisibility: _toggleVisibility,
                        isVisible: _isVisible);
                  },
                ),
                PopUpForAddToFavourite(
                  isVisible: _isVisible,
                  toggleVisibility: _toggleVisibility,
                )
              ]);
            } else {
              return Center(
                  child: Image.asset("assets/images/noSearchResult.png"));
            }
          },
        ));
  }
}
