import 'package:flutter/material.dart';
import 'package:mara/Homepage.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _selectedDay;
  DateTime _firstDay = DateTime(
      DateTime.now().year, DateTime.now().month - 3, DateTime.now().day);
  DateTime _lastDay = DateTime(
      DateTime.now().year, DateTime.now().month + 3, DateTime.now().day);
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: _firstDay, //today - 3 months
      lastDay: _lastDay, //today + 3 months
      focusedDay: _focusedDay, //now - today
      calendarFormat: _calendarFormat, //week
      headerVisible: false,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarBuilders: CalendarBuilders(
        dowBuilder: (context, day) => SizedBox(),
        defaultBuilder: (context, date, focusedDay) {
          return Column(
            children: [
              Expanded(
                child: Container(
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: activeColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    date.weekday == 1
                        ? "Mon"
                        : date.weekday == 2
                            ? "Tue"
                            : date.weekday == 3
                                ? "Wed"
                                : date.weekday == 4
                                    ? "Thu"
                                    : date.weekday == 5
                                        ? "Fri"
                                        : date.weekday == 6
                                            ? "Sat"
                                            : "Sun",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: activeColor,
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      selectedDayPredicate: (day) {
        // Use `selectedDayPredicate` to determine which day is currently selected.
        // If this returns true, then `day` will be marked as selected.
        // Using `isSameDay` is recommended to disregard
        // the time-part of compared DateTime objects.
        return isSameDay(_selectedDay, day);
      },
      calendarStyle: CalendarStyle(
        // cellMargin: EdgeInsets.all(1),
        // cellPadding: EdgeInsets.all(5),
        // outsideDecoration: BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: BorderRadius.circular(5),
        //   border: Border.all(
        //     color: Colors.red,
        //     width: 2,
        //   ),
        // ),
        cellAlignment: Alignment.center,
        // selectedColor: Colors.deepOrange[400],
        // todayColor: Colors.deepOrange[200],
        // markersColor: Colors.brown[700],
        // outsideDaysVisible: true,
      ),
      // headerVisible: false,
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          // Call `setState()` when updating the selected day
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        }
      },
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          // Call `setState()` when updating calendar format
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
        // No need to call `setState()` here
        _focusedDay = focusedDay;
      },
    );
  }
}
