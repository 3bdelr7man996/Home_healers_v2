import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TableClenderForSession extends StatefulWidget {
  const TableClenderForSession({super.key});

  @override
  _TableClenderForSessionState createState() => _TableClenderForSessionState();
}

class _TableClenderForSessionState extends State<TableClenderForSession> {
  List<DateTime> selectedDates = [];
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusDay) {
    setState(() {
      if (selectedDates.contains(day)) {
        selectedDates.remove(day);
      } else {
        selectedDates.add(day);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ar-EG',
      rowHeight: 43,
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
      availableGestures: AvailableGestures.all,
      selectedDayPredicate: (day) =>
          selectedDates.any((date) => isSameDay(day, date)),
      focusedDay: today,
      firstDay: DateTime.utc(2023, 9, 9),
      lastDay: DateTime.utc(2024, 5, 10),
      onDaySelected: _onDaySelected,
      calendarStyle: CalendarStyle(
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
