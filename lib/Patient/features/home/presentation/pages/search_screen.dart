// ignore_for_file: unused_local_variable

import 'package:dr/Patient/features/home/presentation/cubit/home_cubit/reservation_cubit.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_cubit/search_cubit.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_state/search_state.dart';
import 'package:dr/Patient/features/home/presentation/pages/filter_screen.dart';
import 'package:dr/Patient/features/home/presentation/widgets/filter_result_widgets/doctor_card_widget.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _isVisible = false;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<ReservationCubit>().onChangestatus_id(null);
    context.read<SearchCubit>().GetSearchResult(context);
  }

  TextEditingController _searchController = TextEditingController();

  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // List<Data>? searchResults = [];

  // List<Data>? Info;
  @override
  Widget build(BuildContext context) {
    // Info =
    //     context.select((SearchCubit cubit) => cubit.state.listOfResponse!.data);
    return Scaffold(
      appBar: customAppBar(context, backButton: true, title: "search"),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    AppConstants.customNavigation(context, FiterScreen(), 0, 0);
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(157, 55, 209, 244),
                          Color(0xFFB61EEF),
                        ],
                      ),
                    ),
                    child: const Icon(
                      Icons.filter_list,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
                10.pw,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  width: context.width * 0.7,
                  child: TextField(
                    controller: _searchController,
                    onChanged: (query) {
                      context.read<SearchCubit>().search(query);
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: " بحث ...",
                      suffixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            20.ph,
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state.Loading) {
                  return CustomLoader(
                    padding: 0,
                  );
                } else if (!state.Loading &&
                    state.searchDataList != null &&
                    state.searchDataList!.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.searchDataList?.length,
                      itemBuilder: (context, index) {
                        // final result = searchResults![index];
                        // final firstName = result.firstnameAr;
                        return DoctorCard(
                          fromFilter: true,
                          doctorInfo: state.searchDataList![index],
                          year: state.searchDataList![index].years,
                        );
                      },
                    ),
                  );
                } else {
                  return Expanded(
                    child: Image.asset("assets/images/noSearchResult.png"),
                  );
                }
              },
            )
          ]),
        ),
      ]),
    );
  }
}
