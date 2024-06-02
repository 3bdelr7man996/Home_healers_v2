import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit/get_point_cubit.dart';
import 'package:dr/Patient/features/setting/presentation/cubit/setting_state/get_point_state.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/http_helper.dart';
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
          width: context.width * 0.9,
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
                    state.myPointsData == null
                        ? ""
                        : '${state.myPointsData?.points} نقطة',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  5.ph,
                  Text(
                    state.myPointsData == null
                        ? ""
                        : '(${state.myPointsData?.pointsInSAR} ر.س)',
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
                  (state.pointState == RequestState.loading)
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            context.read<GetPointsCubit>().pointsToCashback(
                                state.myPointsData?.points, context);
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
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
                        ),
                  10.ph,
                  Text(
                    "رصيــدك الحالي ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "${state.myPointsData?.walletBalance} ر.س",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
