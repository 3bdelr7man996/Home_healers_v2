// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/home/data/models/section-model.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_cubit/reservation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownForSelectSection extends StatefulWidget {
  String selectedName;
  Data? doctorInfo;
  List<String> names;
  DropDownForSelectSection(
      {super.key,
      required this.selectedName,
      required this.doctorInfo,
      required this.names});

  @override
  State<DropDownForSelectSection> createState() =>
      _DropDownForSelectSectionState();
}

late int id;

class _DropDownForSelectSectionState extends State<DropDownForSelectSection> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      underline: Container(), // Hide the underline
      // icon: const SizedBox(), // Hide the arrow icon
      value: widget.selectedName,
      onChanged: (String? newValue) async {
        for (StatusAdvisor category in widget.doctorInfo!.statusAdvisor!) {
          if (category.nameAr == newValue) {
            id = category.id!;
            break;
          }
        }
        await context.read<ReservationCubit>().onChangestatus_id(id);
        setState(() {
          widget.selectedName = newValue!;
        });
      },
      items: widget.names.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
