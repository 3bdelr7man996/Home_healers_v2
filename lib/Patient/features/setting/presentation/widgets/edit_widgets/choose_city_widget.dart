// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit/update_info_cubit.dart';
import 'package:dr/Patient/features/setting/presentation/cubit/setting_state/update_info_state.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/doctor/features/auth/data/model/cities_area.dart';
import 'package:dr/doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseCityForProfile extends StatelessWidget {
  List<CityData>? cities;
  ChooseCityForProfile({super.key, required this.cities});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Container(
          width: context.width,
          child: BlocBuilder<UpdateInfoCubit, UpdateInfoState>(
            builder: (context, updateInfoState) {
              return DropdownButton<String>(
                value: updateInfoState.citySelected,
                items: state.citiesList
                    ?.map((city) => DropdownMenuItem(
                        value: city.nameAr, child: Text(city.nameAr!)))
                    .toList(),
                onChanged: (value) {
                  context.read<UpdateInfoCubit>().oncitySelectedChange(value);

                  var val;
                  for (int i = 0; i < cities!.length; i++) {
                    if (cities![i].nameAr == value) {
                      val = cities![i].id;
                    }
                  }
                  context
                      .read<UpdateInfoCubit>()
                      .onCityIdChange(val.toString());
                },
              );
            },
          ),
        );
      },
    );
  }
}
