import 'package:dr/Patient/features/favorite/data/models/favoriteModel.dart';
import 'package:dr/Patient/features/favorite/presentation/cubit/favorite_cubit/favorite_cubit.dart';
import 'package:dr/Patient/features/home/data/models/section-model.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_cubit/reservation_cubit.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_cubit/secton_cubit.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_state/section_state.dart';

import 'package:dr/Patient/features/home/presentation/widgets/filter_result_widgets/doctor_card_widget.dart';
import 'package:dr/Patient/features/home/presentation/widgets/filter_result_widgets/popUp_favourite_widget.dart';
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
  bool _isVisible = false;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  var IsUserGuest;
  @override
  void initState() {
    super.initState();
    context.read<SectionCubit>().changeSectionNumber(widget.numberOfIcon!);
    context.read<SectionCubit>().GetSectionDetails(context);
    context.read<ReservationCubit>().onChangestatus_id(widget.numberOfIcon);
    IsUserGuest = IsGuest();
  }

  String? image;
  List<Data>? data;
  List<Data>? searchResults;
  void search(String query) {
    setState(() {
      searchResults = data!.where((obj) {
        final name = obj.nameAr.toString().toLowerCase();
        return name.contains(query.toLowerCase());
      }).toList();
    });
  }

  IsGuest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('guest');
  }

  int i = 0;
  @override
  Widget build(BuildContext context) {
    FavoriteModel? FavoriteList;

    FavoriteList = context.select((FavoriteCubit cubit) => cubit.state.data);

    data = context.select(
      (SectionCubit cubit) => cubit.state.listOfResponse!.data,
    );
    setState(() {
      searchResults = context.select(
        (SectionCubit cubit) => cubit.state.listOfResponse!.data,
      );
    });

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
                child: FilterForSectionDetails(search: search),
              ),
              BlocBuilder<SectionCubit, SectionState>(
                builder: (context, state) {
                  if (state.Loading == true) {
                    return CustomLoader();
                  } else if (state.Loading == false && searchResults!.isEmpty) {
                    return Center(
                      child: Text(
                        "لا يوجد نتائج",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: searchResults!.length,
                        itemBuilder: (context, index) {
                          bool isIdExist = false;
                          if (FavoriteList != null)
                            isIdExist = FavoriteList.data.any((item) =>
                                item.advertiser!.id! ==
                                searchResults![index].id);
                          return DoctorCard(
                              fromPackages: widget.fromPackages,
                              isFav: isIdExist,
                              sessionCountForOffer: widget.sessionCountForOffer,
                              fromOffer: widget.fromOffer,
                              status_id: widget.status_id,
                              doctorInfo: searchResults![index],
                              name: searchResults![index].nameAr!,
                              status: searchResults![index].status!,
                              price: searchResults![index].sessionPrice!,
                              address: searchResults![index].addressAr!,
                              statusAdvisor:
                                  searchResults![index].statusAdvisor,
                              categories: searchResults![index].categories,
                              image: searchResults![index].image!,
                              toggleVisibility: _toggleVisibility,
                              isVisible: _isVisible);
                        },
                      ),
                    );
                  }
                },
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
