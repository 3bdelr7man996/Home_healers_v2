// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/home/presentation/cubit/home_cubit.dart';
import 'package:dr/Patient/features/home/presentation/widgets/date_of_session_widgets.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../setting/presentation/pages/my_requests_screen_for_patient.dart';

class DateOfSessionScreen extends StatefulWidget {
  var Data;
  var status_id;
  DateOfSessionScreen({super.key, this.Data, this.status_id});

  @override
  _DateOfSessionScreenState createState() => _DateOfSessionScreenState();
}

class _DateOfSessionScreenState extends State<DateOfSessionScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("/////////////");
    print(widget.Data);
    print("/////////////");
    print(widget.status_id);
    context.read<ReservationCubit>().onChangeadvertiserId(widget.Data["id"]);
    context.read<ReservationCubit>().onChangestatus_id(widget.status_id);
    context.read<ReservationCubit>().makeNotesEmpty();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,
          title: "choose_your_reservation_date", backButton: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TableClenderForSession(),
              30.ph,
              TextFormField(
                onChanged: (value) {
                  context.read<ReservationCubit>().onChangeNotes(value);
                },
                maxLines: 7,
                decoration: InputDecoration(
                  hintText:
                      'تفاصيل أخري \nتشخيص سابق - ملاحظات - الوقت المناسب للزيارة',
                  hintStyle: TextStyle(fontSize: 12),
                ),
              ),
              10.ph,
              // TextField(
              //   decoration: InputDecoration(
              //     hintText: 'حدد موقع الجلسة العلاجية',
              //     suffixIcon: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: SvgPicture.asset(
              //         "assets/icons/session_location_icon.svg",
              //         width: 5,
              //         height: 5,
              //       ),
              //     ),
              //   ),
              // ),
              // 20.ph,
              Container(
                width: context.width,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<ReservationCubit>().MakeReservation(context);
                  },
                  child: Text('إتمام العملية'),
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.primaryColor,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
