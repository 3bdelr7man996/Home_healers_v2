import 'package:dr/Patient/features/home/presentation/cubit/home_cubit/reservation_cubit.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_cubit/secton_cubit.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_state/section_state.dart';

import 'package:dr/Patient/features/home/presentation/widgets/filter_result_widgets/doctor_card_widget.dart';
import 'package:dr/Patient/features/home/presentation/widgets/home_widgets/home_widgets.dart';
import 'package:dr/Patient/features/home/presentation/widgets/sections_details_widgets/sections_details_widgets.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class SectionDetailsScreen extends StatefulWidget {
  String? SectiondetailsTitle;
  int? numberOfIcon;
  int? status_id;
  bool fromOffer;
  bool fromPackages;
  var sessionCountForOffer;
  SectionDetailsScreen(
      {super.key,
      this.sessionCountForOffer,
      required this.SectiondetailsTitle,
      this.status_id,
      this.fromOffer = false,
      this.fromPackages = false,
      required this.numberOfIcon});

  @override
  State<SectionDetailsScreen> createState() => _SectionDetailsScreenState();
}

class _SectionDetailsScreenState extends State<SectionDetailsScreen> {
  var IsUserGuest;
  @override
  void initState() {
    super.initState();
    context.read<SectionCubit>().changeSectionNumber(widget.numberOfIcon!);
    context.read<SectionCubit>().GetSectionDetails(context);
    context.read<ReservationCubit>().onChangestatus_id(widget.numberOfIcon);

    IsUserGuest = IsGuest();
  }

  IsGuest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('guest');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        backButton: true,
        title: widget.SectiondetailsTitle!,
      ),
      bottomNavigationBar: widget.fromOffer
          ? null
          : BottomNavigationForPatient(selectedIndex: 2),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: FilterForSectionDetails(),
              ),
              BlocBuilder<SectionCubit, SectionState>(
                // buildWhen: (previous, current) =>
                //     previous.sectionDoctorsList != current.sectionDoctorsList,
                builder: (context, state) {
                  if (state.Loading == true) {
                    return CustomLoader();
                  } else if (state.Loading == false &&
                      state.sectionDoctorsList == null ||
                      state.sectionDoctorsList!.isEmpty) {
                    return Center(
                      child: Text(
                        "لا يوجد نتائج",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.sectionDoctorsList?.length,
                        itemBuilder: (context, index) {
                          print("${state.sectionDoctorsList![index].isFav!}");
                          return DoctorCard(
                            fromPackages: widget.fromPackages,
                            sessionCountForOffer: widget.sessionCountForOffer,
                            fromOffer: widget.fromOffer,
                            status_id: widget.status_id,
                            doctorInfo: state.sectionDoctorsList![index],
                            year: state.sectionDoctorsList![index].years,
                          );
                        },
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
