import 'package:dr/Patient/features/home/presentation/cubit/home_cubit/reservation_cubit.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_state/reservation_state.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoneButton extends StatelessWidget {
  final bool fromOffer;
  const DoneButton({super.key, required this.fromOffer});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationCubit, ReservationState>(
      builder: (context, state) {
        return state.Loading
            ? CircularProgressIndicator()
            : Container(
                width: context.width,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (fromOffer) {
                      context.read<ReservationCubit>().MakeReservation(
                            context,
                            true,
                          );
                    } else
                      context.read<ReservationCubit>().MakeReservation(
                            context,
                            false,
                          );
                  },
                  child: Text('إتمام العملية'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
