import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {
  int isActive = 1;
  int isMonth = 1;
  DateTime selectedDay;

  DateTime firstDay = DateTime(DateTime.now().year, 1, 1);

  DateTime lastDay = DateTime(DateTime.now().year, 1, 31);

  // firstDay = DateTime(DateTime.now().year, isMonth, 1);

  // lastDay = DateTime(DateTime.now().year, isMonth, getLastDay());

  // focusedDay = firstDay;

  getLastDay() {
    if (isMonth == 1) {
      return 31;
    } else if (isMonth == 2) {
      return 28;
    } else if (isMonth == 3) {
      return 31;
    } else if (isMonth == 4) {
      return 30;
    } else if (isMonth == 5) {
      return 31;
    } else if (isMonth == 6) {
      return 30;
    } else if (isMonth == 7) {
      return 31;
    } else if (isMonth == 8) {
      return 31;
    } else if (isMonth == 9) {
      return 30;
    } else if (isMonth == 10) {
      return 31;
    } else if (isMonth == 11) {
      return 30;
    } else if (isMonth == 12) {
      return 31;
    }
  }
}
