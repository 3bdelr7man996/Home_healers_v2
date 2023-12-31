import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyPointsheaderForPatient extends StatelessWidget {
  const MyPointsheaderForPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPointsCubit, GetPointsState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(15.0),
          width: 325,
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
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'عدد نقاطك',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    5.ph,
                    Text(
                      state.Data == null ? "" : '${state.Data.points} نقطة',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    5.ph,
                    Text(
                      state.Data == null
                          ? ""
                          : '(${state.Data.pointsInSAR} ر.س)',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "تستطيع تحويل \nنقاطك إلى محفظتك",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<GetPointsCubit>()
                            .pointsToCashback(state.Data.points, context);
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: Text(
                        'حول نقاطك',
                        style: TextStyle(
                          color: AppColors.secondryColor,
                          fontSize: 16.0,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
