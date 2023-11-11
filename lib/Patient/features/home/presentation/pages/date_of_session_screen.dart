// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/home/presentation/cubit/home_cubit.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_state.dart';
import 'package:dr/Patient/features/home/presentation/widgets/date_of_session_widgets.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateOfSessionScreen extends StatefulWidget {
  var Data;
  var status_id;
  bool fromOffer;
  var fromFilter;
  DateOfSessionScreen(
      {super.key,
      this.Data,
      this.fromFilter,
      this.status_id,
      this.fromOffer = false});

  @override
  _DateOfSessionScreenState createState() => _DateOfSessionScreenState();
}

class _DateOfSessionScreenState extends State<DateOfSessionScreen> {
  List<String> names = [];
  String selectedName = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<ReservationCubit>().onChangeadvertiserId(widget.Data["id"]);
    if (widget.fromFilter == false)
      context.read<ReservationCubit>().onChangestatus_id(widget.status_id);
    context.read<ReservationCubit>().makeNotesEmpty();
    for (var item in widget.Data["status_advisor"]) {
      names.add(item['name_ar']);
    }
    selectedName = names.isNotEmpty ? names[0] : 'No names available';
  }

  late int id;

  @override
  Widget build(BuildContext context) {
    print("sss");
    print(widget.Data["status_advisor"]);
    print(widget.status_id);
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
              LocationInput(),
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
              widget.fromFilter || widget.fromOffer
                  ? names.isNotEmpty
                      ? DropdownButton<String>(
                          underline: Container(), // Hide the underline
                          // icon: const SizedBox(), // Hide the arrow icon
                          value: selectedName,
                          onChanged: (String? newValue) async {
                            for (var category
                                in widget.Data["status_advisor"]) {
                              if (category['name_ar'] == newValue) {
                                id = category['id'];
                                break;
                              }
                            }
                            await context
                                .read<ReservationCubit>()
                                .onChangestatus_id(id);
                            setState(() {
                              selectedName = newValue!;
                              print(selectedName);
                              print("ss");
                            });
                          },
                          items: names
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )
                      : SizedBox()
                  : SizedBox(),
              10.ph,
              BlocBuilder<ReservationCubit, ReservationState>(
                builder: (context, state) {
                  return state.Loading
                      ? CircularProgressIndicator()
                      : Container(
                          width: context.width,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (widget.fromOffer) {
                                context
                                    .read<ReservationCubit>()
                                    .MakeReservation(context, true);
                              } else
                                context
                                    .read<ReservationCubit>()
                                    .MakeReservation(context, false);
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
                        );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
