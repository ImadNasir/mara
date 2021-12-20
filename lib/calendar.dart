import 'package:flutter/material.dart';
import 'package:mara/Homepage.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  final month;
  Function onPressed;
  Calendar({this.month, this.onPressed});
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.week;

  DateTime _selectedDay;
  DateTime _firstDay;
  DateTime _lastDay;

  getLastDay() {
    if (widget.month == 1) {
      return 31;
    } else if (widget.month == 2) {
      return 28;
    } else if (widget.month == 3) {
      return 31;
    } else if (widget.month == 4) {
      return 30;
    } else if (widget.month == 5) {
      return 31;
    } else if (widget.month == 6) {
      return 30;
    } else if (widget.month == 7) {
      return 31;
    } else if (widget.month == 8) {
      return 31;
    } else if (widget.month == 9) {
      return 30;
    } else if (widget.month == 10) {
      return 31;
    } else if (widget.month == 11) {
      return 30;
    } else if (widget.month == 12) {
      return 31;
    }
  }

  getStartingDayofTheWeek() {
    var firstDay = DateTime(DateTime.now().year, widget.month, 1);
    if (firstDay.weekday == 1) {
      return StartingDayOfWeek.monday;
    } else if (firstDay.weekday == 2) {
      return StartingDayOfWeek.tuesday;
    } else if (firstDay.weekday == 3) {
      return StartingDayOfWeek.wednesday;
    } else if (firstDay.weekday == 4) {
      return StartingDayOfWeek.thursday;
    } else if (firstDay.weekday == 5) {
      return StartingDayOfWeek.friday;
    } else if (firstDay.weekday == 6) {
      return StartingDayOfWeek.saturday;
    } else if (firstDay.weekday == 7) {
      return StartingDayOfWeek.sunday;
    }
  }

  DateTime _focusedDay;

  @override
  void initState() {
    super.initState();
    _firstDay = DateTime(DateTime.now().year, widget.month, 1);
    _lastDay = DateTime(DateTime.now().year, widget.month, getLastDay());
    _focusedDay = _firstDay;
  }

  @override
  Widget build(BuildContext context) {
    var firstDay = DateTime(DateTime.now().year, widget.month, 1);
    print("First Day: ${firstDay.weekday}");
    return TableCalendar(
      firstDay: _firstDay, //today - 3 months
      lastDay: _lastDay, //today + 3 months
      focusedDay: _focusedDay, //now - today
      calendarFormat: _calendarFormat, //week
      headerVisible: false,
      startingDayOfWeek: getStartingDayofTheWeek(),
      calendarBuilders: CalendarBuilders(
        dowBuilder: (context, day) => SizedBox(),
        disabledBuilder: (context, day, focusedDay) => SizedBox(),
        defaultBuilder: (context, date, focusedDay) {
          return Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 7),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: inactiveColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      // bottomLeft: Radius.circular(10),
                      // bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 7),
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
                      color: Colors.black,
                      fontSize: 8,
                    ),
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: inactiveColor,
                    borderRadius: BorderRadius.only(
                      //  topLeft: Radius.circular(10),
                      //   topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        selectedBuilder: (context, date, focusedDay) {
          return Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 7),
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
                      // bottomLeft: Radius.circular(10),
                      // bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 7),
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
                    borderRadius: BorderRadius.only(
                      //  topLeft: Radius.circular(10),
                      //   topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        todayBuilder: (context, date, focusedDay) {
          return Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 7),
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
                    // border: Border(
                    //   top: BorderSide(
                    //     color: Colors.white,
                    //     width: 1,
                    //   ),
                    // ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 7),
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
                    borderRadius: BorderRadius.only(
                      //  topLeft: Radius.circular(10),
                      //   topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
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
    );
  }
}
