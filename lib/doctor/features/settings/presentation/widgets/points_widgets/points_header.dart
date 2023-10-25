import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/doctor/features/settings/presentation/cubit/setting_cubit.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyPointsheader extends StatelessWidget {
  const MyPointsheader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.height * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 108, 210, 233),
              AppColors.secondryColor
            ],
          ),
        ),
        child: BlocBuilder<SettingCubit, SettingState>(
          builder: (context, state) {
            if (state.pointState == RequestState.loading) {
              return const CustomLoader(padding: 0);
            } else if (state.pointState == RequestState.success &&
                state.pointsData?.points != null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'your_number_of_points'.tr(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    5.ph,
                    Text(
                      '${state.pointsData?.points} ${'point'.tr()}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    5.ph,
                    Text(
                      '(${state.pointsData?.walletBalance} ${'SAR'.tr()})',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ));
  }
}
