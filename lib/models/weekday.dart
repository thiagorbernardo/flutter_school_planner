import 'package:flutter/material.dart';

class WeekDay {
  bool isSelected = false;
  late TimeOfDay occurrence;
  String dayName;
  int dayOfWeek;

  WeekDay(this.dayName, this.dayOfWeek);

  void toggleSelection() {
    this.isSelected = !this.isSelected;
  }

  void setOccurrence(TimeOfDay occurrence) {
    this.occurrence = occurrence;
  }
}
