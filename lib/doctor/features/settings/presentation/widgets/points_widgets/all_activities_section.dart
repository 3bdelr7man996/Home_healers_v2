import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/doctor/features/settings/presentation/cubit/setting_cubit.dart';
import 'package:dr/doctor/features/settings/presentation/widgets/points_widgets/points_activities.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllActivitiesSection extends StatelessWidget {
  const AllActivitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        if (state.pointState == RequestState.loading) {
          return const CustomLoader(
            padding: 0,
          );
        } else if (state.pointState == RequestState.success &&
            state.pointsData?.newPointsNotifications != null) {
          return SizedBox(
            height: context.height * 0.5,
            child: ListView.builder(
              itemCount: state.pointsData?.newPointsNotifications?.length,
              itemBuilder: (context, index) {
                return Activity(
                  title: state.pointsData?.newPointsNotifications?[index].data
                          ?.title ??
                      "",
                  body: state.pointsData?.newPointsNotifications?[index].data
                          ?.body ??
                      "",
                  date: state.pointsData?.newPointsNotifications?[index]
                          .createdAt ??
                      "",
                );
              },
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
