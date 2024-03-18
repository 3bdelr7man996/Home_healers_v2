import 'package:dr/Patient/features/home/data/models/section-model.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_cubit/filter_cubit.dart';
import 'package:dr/Patient/features/home/presentation/widgets/filter_result_widgets/doctor_card_widget.dart';
import 'package:dr/Patient/features/home/presentation/widgets/filter_result_widgets/popUp_favourite_widget.dart';
import 'package:dr/Patient/features/home/presentation/widgets/home_widgets/home_widgets.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
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
    List<Data?>? data = context.select(
      (FilterCubit cubit) => cubit.state.listOfResponse?.data,
    );
    return Scaffold(
      appBar: customAppBar(context, title: "filter_result", backButton: true),
      bottomNavigationBar: BottomNavigationForPatient(selectedIndex: 2),
      body: data == null
          ? CircularProgressIndicator()
          : data.length == 0
              ? Center(child: Image.asset("assets/images/noSearchResult.png"))
              : Stack(children: [
                  ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return DoctorCard(
                          fromFilter: true,
                          doctorInfo: data[index],
                          name: data[index]!.nameAr!,
                          status: data[index]!.status!,
                          price: data[index]!.sessionPrice,
                          address: data[index]!.addressAr!,
                          statusAdvisor: data[index]!.statusAdvisor!,
                          categories: data[index]!.categories!,
                          image: data[index]!.image!,
                          toggleVisibility: _toggleVisibility,
                          isVisible: _isVisible);
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
