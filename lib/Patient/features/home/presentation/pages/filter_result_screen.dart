import 'package:dr/Patient/features/home/presentation/widgets/filter_result_widgets/doctor_card_widget.dart';
import 'package:dr/Patient/features/home/presentation/widgets/home_widgets/home_widgets.dart';
import 'package:dr/Patient/features/home/presentation/cubit/filter_cubit/filter_cubit.dart';
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
                state.specialistList != null &&
                state.specialistList!.isNotEmpty) {
              return Stack(children: [
                ListView.builder(
                  itemCount: state.specialistList?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return DoctorCard(
                      fromFilter: true,
                      doctorInfo: state.specialistList![index],
                      year: state.specialistList![index].years,
                    );
                  },
                ),
              ]);
            } else {
              return Center(
                  child: Image.asset("assets/images/noSearchResult.png"));
            }
          },
        ));
  }
}
