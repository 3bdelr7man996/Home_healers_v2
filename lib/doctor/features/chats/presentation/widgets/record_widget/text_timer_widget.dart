import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/chats/presentation/cubit/record_cubit/record_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:record/record.dart';

class TextTimer extends StatelessWidget {
  const TextTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecorderCubit, RecorderState>(
      buildWhen: (previous, current) =>
          previous.recordDuration != current.recordDuration,
      builder: (context, state) {
        return state.recordState == RecordState.record
            ? Directionality(
                textDirection: TextDirection.ltr,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.5),
                  child: Text(
                    context.read<RecorderCubit>().formatNumber(),
                    style: const TextStyle(
                      color: AppColors.secondryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
