import 'package:dr/Patient/features/setting/data/repositories/update_reservation_repo.dart';
import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/requests_details_widgets.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestsDetailsScreenForPatient extends StatefulWidget {
  int num;
  var listOfOrders;
  var categories, selectedName;
  RequestsDetailsScreenForPatient(
      {super.key,
      required this.num,
      this.listOfOrders,
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
        print(endAt);
        print(startAt);
        await context
            .read<UpdateReservationCubit>()
            .onIdChange(widget.listOfOrders.id.toString());
        await context.read<UpdateReservationCubit>().onStartAtChange(startAt);
        await context.read<UpdateReservationCubit>().onEndAtChange(endAt);
        await context
            .read<UpdateReservationCubit>()
            .onStatusChange(widget.listOfOrders.status);
        await context
            .read<UpdateReservationCubit>()
            .updateSelectedReservation(context);
      }
    }

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
                    listOfOrders: widget.listOfOrders,
                  ),
                  20.ph,
                  const Divider(
                    thickness: 1,
                  ),
                  20.ph,
                  TowSection(
                    num: widget.num,
                    listOfOrders: widget.listOfOrders,
                    categories: widget.categories,
                    selectedName: widget.selectedName,
                  ),
                  20.ph,
                  Divider(
                    thickness: 1,
                  ),
                  widget.num == 2 ||
                          widget.num == 3 ||
                          widget.num == 4 ||
                          num == 5
                      ? SessionInfoForPatient(
                          MainOrder: widget.listOfOrders,
                        )
                      : SizedBox(),
                  Text(
                    "تفاصيل الإجمالي",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  20.ph,
                  Bill(
                    listOfOrders: widget.listOfOrders,
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
                                  padding: EdgeInsets.all(16),
                                ),
                                onPressed: () {},
                                child: Text('إظهار الفاتورة'),
                              ),
                              if (widget.listOfOrders.canReview == 1)
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      side: BorderSide(
                                          color: AppColors.primaryColor),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      elevation: 0,
                                      padding: EdgeInsets.all(16),
                                      backgroundColor: Colors.transparent),
                                  onPressed: () {
                                    Future.delayed(Duration.zero, () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const BottomSheetForEvalute();
                                        },
                                      );
                                    });
                                  },
                                  child: Text(
                                    'تقييم الخدمة',
                                    style: TextStyle(
                                        color: AppColors.primaryColor),
                                  ),
                                ),
                            ],
                          )
                        : widget.num != 2 && widget.num != 6
                            ? ElevatedButton(
                                onPressed: () async {
                                  _toggleVisibility();
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.primaryColor),
                                  minimumSize: MaterialStateProperty.all<Size>(
                                    Size(double.infinity, 50),
                                  ),
                                ),
                                child: Text(
                                  'الغاء الطلب',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : SizedBox(),
                  if (widget.num == 2)
                    ElevatedButton(
                      onPressed: () {
                        _toggleVisibility();
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
                          Size(double.infinity, 50),
                        ),
                      ),
                      child: Text(
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
                          Size(double.infinity, 50),
                        ),
                      ),
                      child: Text(
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
          PopUpForRemoveRequest(
            listOfOrders: widget.listOfOrders,
            toggleVisibility: _toggleVisibility,
            changePopUp: changePopUp,
            isVisible: _isVisible,
            firstPopUp: _firstPopUp,
          )
        ],
      ),
    );
  }
}

class BottomSheetForEvalute extends StatelessWidget {
  const BottomSheetForEvalute({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 350,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(
            children: [
              const Text(
                "اكتب تعليقك",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              15.ph,
              FiveStarRating(
                rating: 0,
                onRatingChanged: (rating) {},
              ),
              15.ph,
              TextFormField(
                maxLines: 5,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(16),
                  hintText: "اكتب تعليقك ...",
                ),
              ),
              15.ph,
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.primaryColor),
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(double.infinity, 50),
                  ),
                ),
                child: Text(
                  'إرسال التعليق',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class FiveStarRating extends StatefulWidget {
  final int rating;
  final Function(int) onRatingChanged;

  const FiveStarRating({
    Key? key,
    required this.rating,
    required this.onRatingChanged,
  }) : super(key: key);

  @override
  State<FiveStarRating> createState() => _FiveStarRatingState();
}

class _FiveStarRatingState extends State<FiveStarRating> {
  int _rating = 0;

  @override
  void initState() {
    super.initState();
    _rating = widget.rating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 1; i <= 5; i++)
          InkWell(
            onTap: () {
              setState(() {
                _rating = i;
                widget.onRatingChanged(_rating);
              });
            },
            child: Icon(
              Icons.star,
              size: 40,
              color: i <= _rating ? Colors.yellow : Colors.grey,
            ),
          ),
      ],
    );
  }
}
