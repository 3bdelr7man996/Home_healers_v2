import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OptionsForJobTitle extends StatelessWidget {
  const OptionsForJobTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.height * 0.35,
        color: Colors.white,
        child: Column(
          children: [
            10.ph,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'select_job_title'.tr(),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            BlocBuilder<AuthCubit, AuthState>(
              // buildWhen: (previous, current) =>
              //     previous.selectedCategories != current.selectedCategories,
              builder: (context, state) {
                if (state.departementState == RequestState.loading) {
                  return const CustomLoader(
                    padding: 0,
                  );
                } else if (state.departemensList != null) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.departemensList!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(state.departemensList![index].nameAr!),
                              Checkbox(
                                  value: state.selectedCategories != null
                                      ? state.selectedCategories?.contains(
                                          state.departemensList![index].id)
                                      : false,
                                  onChanged: (checked) {
                                    context.read<AuthCubit>().onSelectCategory(
                                          state.departemensList![index].id,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('select'.tr()),
              ),
            ),
          ],
        ));
  }
}
