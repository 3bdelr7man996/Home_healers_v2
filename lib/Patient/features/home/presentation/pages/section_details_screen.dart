import 'package:dr/Patient/features/home/presentation/cubit/home_cubit.dart';
import 'package:dr/Patient/features/home/presentation/widgets/filter_result_widgets.dart';
import 'package:dr/Patient/features/home/presentation/widgets/home_widgets.dart';
import 'package:dr/Patient/features/home/presentation/widgets/sections_details_widgets.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SectionDetailsScreen extends StatefulWidget {
  var SectiondetailsTitle;
  var numberOfIcon;
  SectionDetailsScreen(
      {super.key,
      required this.SectiondetailsTitle,
      required this.numberOfIcon});

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
  void initState() {
    super.initState();
    context.read<SectionCubit>().changeSectionNumber(widget.numberOfIcon);
    context.read<SectionCubit>().GetSectionDetails(context);
  }

  String? image;

  @override
  Widget build(BuildContext context) {
    var data = context.select(
      (SectionCubit cubit) => cubit.state.listOfResponse?["data"],
    );

    return Scaffold(
      appBar: customAppBar(context,
          backButton: true, title: widget.SectiondetailsTitle),
      bottomNavigationBar: BottomNavigationForPatient(selectedIndex: 2),
      body: Stack(
        children: [
          data == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : data.length == 0
                  ? const Center(
                      child: Text(
                      "عذراً لا يوجد أخصائيين \n في هذا المجال",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 2,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0),
                    ))
                  : Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: FilterForSectionDetails(),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return DoctorCard(
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
