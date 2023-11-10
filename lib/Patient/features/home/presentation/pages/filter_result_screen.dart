import 'package:dr/Patient/features/home/presentation/cubit/home_cubit.dart';
import 'package:dr/Patient/features/home/presentation/widgets/filter_result_widgets.dart';
import 'package:dr/Patient/features/home/presentation/widgets/home_widgets.dart';
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
    var data = context.select(
      (FilterCubit cubit) => cubit.state.listOfResponse?["data"],
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
                          Data: data[index],
                          name: data[index]["name_ar"],
                          status: data[index]["status"],
                          price: data[index]["session_price"],
                          address: data[index]["address_ar"],
                          statusAdvisor: data[index]["status_advisor"],
                          categories: data[index]['categories'],
                          image: data[index]["image"],
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
