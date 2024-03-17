import 'package:dr/Patient/features/home/presentation/cubit/home_cubit/reservation_cubit.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApPBarForspecialistScreen extends StatelessWidget {
  const ApPBarForspecialistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: context.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 108, 210, 233),
            Color.fromARGB(173, 116, 10, 154)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35.0),
          bottomRight: Radius.circular(35.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(95, 255, 255, 255),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppColors.whiteColor,
                        ),
                        onPressed: () {
                          context
                              .read<ReservationCubit>()
                              .makesessions_countOne();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "صفحة الأخصائي",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const Spacer()
              ],
            )
          ],
        ),
      ),
    );
  }
}
