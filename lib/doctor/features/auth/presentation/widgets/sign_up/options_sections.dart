// ignore_for_file: must_be_immutable

import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OptionsForsection extends StatelessWidget {
  OptionsForsection({super.key});

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
              'select_section'.tr(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            20.ph,
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state.statusState == RequestState.loading) {
                  return const CustomLoader(
                    padding: 0,
                  );
                } else if (state.statusList != null) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.statusList!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(state.statusList![index].nameAr!),
                              Checkbox(
                                  value: state.selectedStatus != null
                                      ? state.selectedStatus?.contains(
                                          state.statusList![index].id)
                                      : false,
                                  onChanged: (checked) {
                                    context.read<AuthCubit>().onSelectStatus(
                                          state.statusList![index].id,
                                        );
                                  }),
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
