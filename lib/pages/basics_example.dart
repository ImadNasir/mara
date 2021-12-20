// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../utils.dart';

class TableBasicsExample extends StatefulWidget {
  @override
  _TableBasicsExampleState createState() => _TableBasicsExampleState();
}

class _TableBasicsExampleState extends State<TableBasicsExample> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay;
  bool isCustom = true;

  // CalendarController _calendarController = CalendarController();
  // Map<DateTime, List<EventsModel>> _events;
  // DateTime _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TableCalendar - Basics'),
      ),
      body: TableCalendar(
        headerVisible: false,
        startingDayOfWeek: StartingDayOfWeek.monday,
        calendarBuilders: CalendarBuilders(
          dowBuilder: (context, day) => SizedBox(),
          defaultBuilder: (context, date, focusedDay) {
            return Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    // margin: EdgeInsets.only(bottom: 13),
                    child: Container(
                      // height: 50,
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border(
                            top: BorderSide(
                              // width: 16.0,
                              color: Colors.blue,
                              // style:
                            ),
                          )
                          // borderRadius: BorderRadius.circular(5),
                          ),
                      // padding: EdgeInsets.all(5),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Container(
                      // height: 50,
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
                          color: Colors.blue,
                          border: Border(
                            top: BorderSide(
                              // width: 16.0,
                              color: Colors.blue,
                              // style:
                            ),
                          )
                          // borderRadius: BorderRadius.circular(5),
                          ),
                      // padding: EdgeInsets.all(5),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        firstDay: DateTime(
            DateTime.now().year, DateTime.now().month - 3, DateTime.now().day),
        lastDay: DateTime(
            DateTime.now().year, DateTime.now().month + 3, DateTime.now().day),
        focusedDay: _focusedDay,
        calendarFormat: CalendarFormat.week,
        selectedDayPredicate: (day) {
          // Use `selectedDayPredicate` to determine which day is currently selected.
          // If this returns true, then `day` will be marked as selected.
          // Using `isSameDay` is recommended to disregard
          // the time-part of compared DateTime objects.
          return isSameDay(_selectedDay, day);
        },
        calendarStyle: CalendarStyle(
          cellMargin: EdgeInsets.all(1),
          cellPadding: EdgeInsets.all(5),
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
      ),
    );
  }
}
