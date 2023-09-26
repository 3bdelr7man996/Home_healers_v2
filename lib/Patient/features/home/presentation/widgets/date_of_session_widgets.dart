import 'package:dr/Patient/features/home/presentation/cubit/home_cubit.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
