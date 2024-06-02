// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit/update_reservation_cubit.dart';
import 'package:dr/Patient/features/setting/presentation/cubit/setting_state/update_reservation_state.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstPopUp extends StatefulWidget {
  final VoidCallback toggleVisibility;

  final VoidCallback changePopUp;
  var listOfOrders;

  FirstPopUp(
      {super.key,
      required this.toggleVisibility,
      required this.changePopUp,
      this.listOfOrders});

  @override
  State<FirstPopUp> createState() => _FirstPopUpState();
}

class _FirstPopUpState extends State<FirstPopUp> {
  @override
  Widget build(BuildContext context) {
    bool showPopUp =
        context.select((UpdateReservationCubit cubit) => cubit.state.showPoUp);
    setState(() {
      showPopUp = context
          .select((UpdateReservationCubit cubit) => cubit.state.showPoUp);
    });
    return BlocBuilder<UpdateReservationCubit, UpdateReservationState>(
      builder: (context, state) {
        return state.loadingUpdateResevation
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  const Text(
                    "هل ترغب حقا في \nحذف الطلب ؟",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold, height: 1.5),
                    textAlign: TextAlign.center,
                  ),
                  20.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(16),
                        ),
                        onPressed: () async {
                          await context
                              .read<UpdateReservationCubit>()
                              .onIdChange(widget.listOfOrders.id.toString());
                          await context
                              .read<UpdateReservationCubit>()
                              .onStartAtChange(
                                  widget.listOfOrders.startAt.toString());
                          await context
                              .read<UpdateReservationCubit>()
                              .onEndAtChange(
                                  widget.listOfOrders.endAt.toString());
                          await context
                              .read<UpdateReservationCubit>()
                              .onStatusChange("canceled");
                          await context
                              .read<UpdateReservationCubit>()
                              .updateSelectedReservation(context);
                          await Future.delayed(Duration(seconds: 1), () {
                            Navigator.pop(context);
                          });
                          if (showPopUp) widget.changePopUp();
                        },
                        child: const Text('حذف'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            side:
                                const BorderSide(color: AppColors.primaryColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                            padding: const EdgeInsets.all(16),
                            backgroundColor: Colors.transparent),
                        onPressed: () {
                          Navigator.pop(context);
                          widget.toggleVisibility();
                        },
                        child: const Text(
                          'عودة',
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                      ),
                    ],
                  )
                ],
              );
      },
    );
  }
}
