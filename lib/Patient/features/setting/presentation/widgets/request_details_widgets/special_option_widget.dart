// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/setting/data/models/my_orders_model.dart';
import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit/update_reservation_cubit.dart';
import 'package:dr/Patient/features/setting/presentation/pages/bill_screen.dart';
import 'package:dr/Patient/features/setting/presentation/pages/payment_details_screen.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/request_details_widgets/bottomsheet_for_evaluate_widget.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/firebase_analytic_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecialOptions extends StatefulWidget {
  var fromNotification;
  int TabIndexClicked;
  OrderData? oneOrder;
  String? selectedName;
  List<String>? categories;
  Function toggleVisibility;
  SpecialOptions(
      {super.key,
      required this.TabIndexClicked,
      required this.categories,
      required this.fromNotification,
      required this.oneOrder,
      required this.selectedName,
      required this.toggleVisibility});

  @override
  State<SpecialOptions> createState() => _SpecialOptionsState();
}

class _SpecialOptionsState extends State<SpecialOptions> {
  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    TimeOfDay selectedTime = TimeOfDay.now();
    Future<void> selectDateTimeAndSave() async {
      // Select the date.
      final DateTime? date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
      );
      if (date != null) {
        setState(() {
          selectedDate = date;
        });
      }

      // Select the time.
      final TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: selectedTime,
      );
      if (time != null) {
        setState(() {
          selectedTime = time;
        });
      }

      final DateTime newDateTime = selectedDate.add(
          Duration(hours: selectedTime.hour, minutes: selectedTime.minute));
      if (time != null && date != null) {
        var endAt = newDateTime.toString();
        endAt = endAt.substring(0, endAt.length - 4);
        var startAt = DateTime(
          newDateTime.year,
          newDateTime.month,
          newDateTime.day,
          00,
          00,
          00,
        ).toString();
        startAt = startAt.substring(0, startAt.length - 4);

        await context
            .read<UpdateReservationCubit>()
            .onIdChange(widget.oneOrder!.id.toString());
        await context.read<UpdateReservationCubit>().onStartAtChange(startAt);
        await context.read<UpdateReservationCubit>().onEndAtChange(endAt);
        await context
            .read<UpdateReservationCubit>()
            .onStatusChange(widget.oneOrder!.status!);
        await context
            .read<UpdateReservationCubit>()
            .updateSelectedReservation(context);
      }
    }

    return Column(
      children: [
        if (widget.fromNotification == false)
          if (widget.TabIndexClicked != 4)
            widget.TabIndexClicked == 3 || widget.TabIndexClicked == 2
                ? Row(
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
                        onPressed: () {
                          AppConstants.customNavigation(context,
                              BillScreen(oneOrder: widget.oneOrder!), 0, 0);
                        },
                        child: const Text('إظهار الفاتورة'),
                      ),
                      if (widget.oneOrder!.canReview == 1 &&
                          widget.TabIndexClicked != 2)
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              side: const BorderSide(
                                  color: AppColors.primaryColor),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0,
                              padding: const EdgeInsets.all(16),
                              backgroundColor: Colors.transparent),
                          onPressed: () {
                            Future.delayed(Duration.zero, () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return BottomSheetForEvalute(
                                      oneOrder: widget.oneOrder);
                                },
                              );
                            });
                          },
                          child: const Text(
                            'تقييم الخدمة',
                            style: TextStyle(color: AppColors.primaryColor),
                          ),
                        ),
                    ],
                  )
                : widget.TabIndexClicked != 1 && widget.TabIndexClicked != 5
                    ? ElevatedButton(
                        onPressed: () {
                          widget.toggleVisibility();
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            AppColors.primaryColor,
                          ),
                          minimumSize: MaterialStateProperty.all(
                            const Size(double.infinity, 50),
                          ),
                        ),
                        child: const Text(
                          'إلغاء الطلب',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : const SizedBox(),
        if (widget.TabIndexClicked == 1)
          widget.oneOrder?.parentId != 0
              ? SizedBox()
              : ElevatedButton(
                  onPressed: () {
                    // _toggleVisibility();
                    FirebaseAnalyticUtil.logGoToCheckoutEvent();
                    AppConstants.customNavigation(
                        context,
                        PaymentDetailsScreen(
                            selectedName: widget.selectedName,
                            withOffer: true,
                            order: widget.oneOrder!,
                            categories: widget.categories),
                        -1,
                        0);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.primaryColor),
                    minimumSize: MaterialStateProperty.all<Size>(
                      const Size(double.infinity, 50),
                    ),
                  ),
                  child: const Text(
                    'ادفع الآن',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
        if (widget.TabIndexClicked == 5)
          ElevatedButton(
            onPressed: () async {
              selectDateTimeAndSave();
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.primaryColor),
              minimumSize: MaterialStateProperty.all<Size>(
                const Size(double.infinity, 50),
              ),
            ),
            child: const Text(
              'تعديل',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }
}
