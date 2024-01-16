import 'package:dr/Patient/features/home/presentation/cubit/home_cubit.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_state.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_font.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:table_calendar/table_calendar.dart';

class TableClenderForSession extends StatefulWidget {
  const TableClenderForSession({super.key});

  @override
  _TableClenderForSessionState createState() => _TableClenderForSessionState();
}

class _TableClenderForSessionState extends State<TableClenderForSession> {
  List<DateTime> selectedDates = [];
  DateTime today = DateTime.now();
  DateTime lastDay = DateTime.now().add(Duration(days: 30));
  void _onDaySelected(DateTime day, DateTime focusDay) async {
    DateTime selectedDate = day;

    // Show the date picker to select the date
    DateTime? selectedDateResult = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: today,
      lastDate: lastDay,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(), // Customize the theme as needed
          child: child!,
        );
      },
    );

    if (selectedDateResult == null) {
      // User canceled the date selection
      return;
    }

    // Show the time picker to select the time
    TimeOfDay? selectedTimeResult = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTimeResult == null) {
      // User canceled the time selection
      return;
    }

    // Combine the selected date and time into a single DateTime object
    selectedDate = DateTime(
      selectedDateResult.year,
      selectedDateResult.month,
      selectedDateResult.day,
      selectedTimeResult.hour,
      selectedTimeResult.minute,
    );

    setState(() {
      print("asdfasdfasdf");
      selectedDates.add(selectedDate);
      print(selectedDates);

      context.read<ReservationCubit>().onChangeDays(selectedDates);
    });

    print(selectedDates);
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ar-EG',
      rowHeight: 43,
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
      availableGestures: AvailableGestures.all,
      selectedDayPredicate: (day) =>
          selectedDates.any((date) => isSameDay(day, date)),
      focusedDay: today,
      firstDay: today,
      lastDay: lastDay,
      onDaySelected: _onDaySelected,
      calendarStyle: const CalendarStyle(
        selectedDecoration: BoxDecoration(
          color: AppColors.primaryColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
  // Text('Selected Dates: ${selectedDates.toString()}'),
  // Text(today.toString().split("")[0]);
}

class LocationInput extends StatelessWidget {
  TextEditingController control;
  LocationInput({super.key, required this.control});

  @override
  Widget build(BuildContext context) {
    // final contextFirst = context;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "location".tr(),
          style: bigBlackFont(fontWeight: FontWeight.w500),
        ),
        5.ph,
        BlocBuilder<ReservationCubit, ReservationState>(
          builder: (context, state) {
            return TextFormField(
              key: const Key('signUpForm_locationInput_textField'),
              controller: (control.text.isEmpty && state.address != null)
                  ? TextEditingController(text: state.address)
                  : control,
              //initialValue: state.advertiser?.addressAr ?? "",
              readOnly: true,
              keyboardType: TextInputType.name,
              onTap: () {
                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapLocationPicker(
                      apiKey: AppStrings.mapApiKey, // Put YOUR OWN KEY here.
                      onNext: (result) {
                        if (result != null) {
                          context.read<ReservationCubit>().onAddressChange(
                                result.formattedAddress,
                              );
                          context.read<ReservationCubit>().onLocationChange(
                                result.geometry.location,
                              );
                          control.text = result.formattedAddress ?? "";
                        }
                        Future.delayed(
                          Duration(seconds: 1),
                          () => Navigator.of(context).pop(),
                        );
                      },
                      location: state.location,
                      origin: state.location,
                      currentLatLng: LatLng(
                          state.location?.lat ?? 24.70281458492638,
                          state.location?.lng ?? 46.704172412998915),
                    ),
                  ),
                );
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "required".tr();
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "location".tr(),
                suffixIcon: SizedBox(
                  height: 18,
                  width: 18,
                  child: AppConstants.customAssetSvg(
                    imagePath:
                        AppImages.locationIcon, //AppImages.showPasswordIcon,
                    fit: BoxFit.none,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
