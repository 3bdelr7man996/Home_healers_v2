import 'package:dr/Patient/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_cubit.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_state.dart';
import 'package:dr/Patient/features/home/presentation/widgets/filter_result_widgets.dart';
import 'package:dr/Patient/features/home/presentation/widgets/home_widgets.dart';
import 'package:dr/Patient/features/home/presentation/widgets/sections_details_widgets.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class SectionDetailsScreen extends StatefulWidget {
  var SectiondetailsTitle;
  var numberOfIcon;
  var status_id;
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
    context.read<SectionCubit>().changeSectionNumber(widget.numberOfIcon);
    context.read<SectionCubit>().GetSectionDetails(context);
    context.read<ReservationCubit>().onChangestatus_id(widget.numberOfIcon);
    print("as");
    IsUserGuest = IsGuest();
  }

  String? image;
  var data;
  var searchResults = [];
  void search(String query) {
    setState(() {
      searchResults = data.where((obj) {
        final name = obj['name_ar'].toString().toLowerCase();
        return name.contains(query.toLowerCase());
      }).toList();
    });
    print(searchResults);
  }

  IsGuest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('guest');
  }

  int i = 0;
  @override
  Widget build(BuildContext context) {
    print(widget.numberOfIcon);
    print("Ghaith");
    var FavoriteList;

    FavoriteList = context.select((FavoriteCubit cubit) => cubit.state.data);

    data = context.select(
      (SectionCubit cubit) => cubit.state.listOfResponse?["data"],
    );
    if (i == 0 && data != null) {
      searchResults = data;
      i++;
    }

    return Scaffold(
      appBar: customAppBar(
        context,
        backButton: true,
        title: widget.SectiondetailsTitle,
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
                  } else if (state.Loading == false && searchResults.isEmpty) {
                    return Center(
                      child: Text(
                        "لا يوجد نتائج",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: searchResults.length,
                        itemBuilder: (context, index) {
                          bool isIdExist = false;
                          if (FavoriteList != null)
                            isIdExist = FavoriteList['data'].any((item) =>
                                item["advertiser"]['id'] ==
                                searchResults[index]['id']);
                          return DoctorCard(
                              fromPackages: widget.fromPackages,
                              isFav: isIdExist,
                              sessionCountForOffer: widget.sessionCountForOffer,
                              fromOffer: widget.fromOffer,
                              status_id: widget.status_id,
                              Data: searchResults[index],
                              name: searchResults[index]["name_ar"],
                              status: searchResults[index]["status"],
                              price: searchResults[index]["session_price"],
                              address: searchResults[index]["address_ar"],
                              statusAdvisor: searchResults[index]
                                  ["status_advisor"],
                              categories: searchResults[index]['categories'],
                              image: searchResults[index]["image"],
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
