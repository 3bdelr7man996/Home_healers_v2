import 'package:dr/Patient/features/home/presentation/cubit/home_cubit/secton_cubit.dart';
import 'package:dr/Patient/features/home/presentation/pages/filter_screen.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterForSectionDetails extends StatefulWidget {
  FilterForSectionDetails({super.key});

  @override
  State<FilterForSectionDetails> createState() =>
      _FilterForSectionDetailsState();
}

class _FilterForSectionDetailsState extends State<FilterForSectionDetails> {
  TextEditingController _searchController = TextEditingController();

  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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
            onChanged: (query) => context.read<SectionCubit>().search(query),
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: " ابحث عما تريد هنا ...",
              suffixIcon: Icon(Icons.search),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
