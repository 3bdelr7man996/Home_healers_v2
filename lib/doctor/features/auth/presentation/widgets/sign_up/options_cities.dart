// ignore_for_file: must_be_immutable

import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OptionsForCities extends StatelessWidget {
  OptionsForCities({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.65,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            10.ph,
            Text(
              'select_city'.tr(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            20.ph,
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state.citiesState == RequestState.loading) {
                  return const CustomLoader(
                    padding: 0,
                  );
                } else if (state.citiesList != null) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.citiesList!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(state.citiesList![index].nameAr!),
                              Radio(
                                groupValue: state.selectedCity,
                                value: state.citiesList![index].id,
                                onChanged: (checked) {
                                  try {
                                    context.read<AuthCubit>().onSelectCity(
                                          state.citiesList![index].id!,
                                          state.citiesList![index].nameAr ?? '',
                                        );
                                  } catch (e) {
                                    print(e.toString());
                                  }
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            15.ph,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('confirm'.tr()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
