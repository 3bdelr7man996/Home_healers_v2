// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/home/presentation/cubit/home_cubit/reservation_cubit.dart';
import 'package:dr/Patient/features/home/presentation/widgets/date_of_session_widgets/dropDown_select_section_widget.dart';
import 'package:dr/Patient/features/home/presentation/widgets/date_of_session_widgets/table_clender_widget.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/doctor/features/auth/data/model/advertiser_model.dart';
import 'package:dr/doctor/features/auth/data/model/status_model.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/date_of_session_widgets/coupon_field_widget.dart';
import '../widgets/date_of_session_widgets/done_button_widget.dart';
import '../widgets/date_of_session_widgets/location_input_widget.dart';

class DateOfSessionScreen extends StatefulWidget {
  Advertiser? doctorInfo;
  int? status_id;
  bool fromOffer;
  bool fromPackages;
  bool? fromFilter;
  bool? fromFav;
  DateOfSessionScreen(
      {super.key,
      this.doctorInfo,
      this.fromFilter,
      this.fromPackages = false,
      this.fromFav = false,
      this.status_id,
      required this.fromOffer});

  @override
  _DateOfSessionScreenState createState() => _DateOfSessionScreenState();
}

class _DateOfSessionScreenState extends State<DateOfSessionScreen> {
  List<String> names = [];
  String selectedName = "";

  @override
  void initState() {
    super.initState();

    context
        .read<ReservationCubit>()
        .onChangeadvertiserId(widget.doctorInfo!.id);
    if (widget.fromFilter == false)
      context.read<ReservationCubit>().onChangestatus_id(widget.status_id);
    context.read<ReservationCubit>().makeNotesEmpty();
    for (StatusData item in widget.doctorInfo?.statusAdvisor ?? []) {
      if (item.nameAr != null) {
        names.add(item.nameAr!);
      }
    }
    selectedName = names.isNotEmpty ? names[0] : 'No names available';
  }

  final TextEditingController control = TextEditingController();
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
              LocationInput(control: control),
              30.ph,
              CouponField(),
              30.ph,
              widget.fromOffer
                  ? SizedBox()
                  : TextFormField(
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
              widget.fromFav!
                  ? DropDownForSelectSection(
                      doctorInfo: widget.doctorInfo,
                      names: names,
                      selectedName: selectedName,
                    )
                  : SizedBox(),
              widget.fromPackages
                  ? SizedBox()
                  : widget.fromFilter! || widget.fromOffer
                      ? names.isNotEmpty
                          ? DropDownForSelectSection(
                              doctorInfo: widget.doctorInfo,
                              names: names,
                              selectedName: selectedName,
                            )
                          : SizedBox()
                      : SizedBox(),
              10.ph,
              DoneButton(
                fromOffer: widget.fromOffer,
              )
            ],
          ),
        ),
      ),
    );
  }
}
