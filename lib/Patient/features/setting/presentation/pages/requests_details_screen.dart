// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:dr/Patient/features/setting/data/models/my_orders_model.dart';
import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:dr/Patient/features/setting/presentation/pages/bill_screen.dart';
import 'package:dr/Patient/features/setting/presentation/pages/payment_details_screen.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/requests_details_widgets.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestsDetailsScreenForPatient extends StatefulWidget {
  int num;
  OrderData oneOrder;
  var categories, selectedName;
  RequestsDetailsScreenForPatient(
      {super.key,
      required this.num,
      required this.oneOrder,
      this.categories,
      this.selectedName});

  @override
  State<RequestsDetailsScreenForPatient> createState() =>
      _RequestsDetailsScreenForPatientState();
}

class _RequestsDetailsScreenForPatientState
    extends State<RequestsDetailsScreenForPatient> {
  bool _isVisible = false;
  bool _firstPopUp = false;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
      _firstPopUp = !_firstPopUp;
    });
  }

  void changePopUp() {
    setState(() {
      _firstPopUp = !_firstPopUp;
    });
  }

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
            .onIdChange(widget.oneOrder.id.toString());
        await context.read<UpdateReservationCubit>().onStartAtChange(startAt);
        await context.read<UpdateReservationCubit>().onEndAtChange(endAt);
        await context
            .read<UpdateReservationCubit>()
            .onStatusChange(widget.oneOrder.status!);
        await context
            .read<UpdateReservationCubit>()
            .updateSelectedReservation(context);
      }
    }

    print("ghaith");
    print(widget.oneOrder.canReview);
    return Scaffold(
      appBar: customAppBar(context, backButton: true, title: "order_details"),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FirstSection(
                    num: widget.num,
                    listOfOrders: widget.oneOrder,
                  ),
                  20.ph,
                  const Divider(
                    thickness: 1,
                  ),
                  20.ph,
                  TowSection(
                    num: widget.num,
                    listOfOrders: widget.oneOrder,
                    categories: widget.categories,
                    selectedName: widget.selectedName,
                  ),
                  20.ph,
                  const Divider(
                    thickness: 1,
                  ),
                  widget.num == 2 ||
                          widget.num == 3 ||
                          widget.num == 4 ||
                          num == 5
                      ? SessionInfoForPatient(
                          MainOrder: widget.oneOrder,
                        )
                      : const SizedBox(),
                  const Text(
                    "تفاصيل الإجمالي",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  20.ph,
                  Bill(
                    listOfOrders: widget.oneOrder,
                  ),
                  30.ph,
                  if (widget.num != 5)
                    widget.num == 4
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: AppColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.all(16),
                                ),
                                onPressed: () {
                                  AppConstants.customNavigation(
                                      context,
                                      BillScreen(oneOrder: widget.oneOrder),
                                      0,
                                      0);
                                },
                                child: const Text('إظهار الفاتورة'),
                              ),
                              if (widget.oneOrder.canReview == 1)
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
                                    style: TextStyle(
                                        color: AppColors.primaryColor),
                                  ),
                                ),
                            ],
                          )
                        : widget.num != 2 && widget.num != 6
                            ? widget.oneOrder.startAt == widget.oneOrder.endAt
                                ? SizedBox()
                                : ElevatedButton(
                                    onPressed: () {
                                      _toggleVisibility();
                                    },
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        AppColors.primaryColor,
                                      ),
                                      minimumSize: MaterialStateProperty.all(
                                        const Size(double.infinity, 50),
                                      ),
                                    ),
                                    child: const Text(
                                      'الغاء الطلب',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                            : const SizedBox(),
                  if (widget.num == 2)
                    ElevatedButton(
                      onPressed: () {
                        // _toggleVisibility();
                        AppConstants.customNavigation(
                            context,
                            PaymentDetailsScreen(
                                withOffer: true, order: widget.oneOrder),
                            -1,
                            0);
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
                  if (widget.num == 6)
                    ElevatedButton(
                      onPressed: () async {
                        selectDateTimeAndSave();
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
                        'تعديل',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
          Container(
            height: context.height,
            child: PopUpForRemoveRequest(
              listOfOrders: widget.oneOrder,
              toggleVisibility: _toggleVisibility,
              changePopUp: changePopUp,
              isVisible: _isVisible,
              firstPopUp: _firstPopUp,
            ),
          )
        ],
      ),
    );
  }
}
