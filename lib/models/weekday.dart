import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'weekday.g.dart';

@HiveType(typeId: 3)
class WeekDay {
  @HiveField(0)
  bool isSelected = false;
  @HiveField(1)
  late TimeOfDay occurrence;
  @HiveField(2)
  String dayName;
  @HiveField(3)
  int dayOfWeek;

  WeekDay(this.dayName, this.dayOfWeek);

  void toggleSelection() {
    this.isSelected = !this.isSelected;
  }

  void setOccurrence(TimeOfDay occurrence) {
    this.occurrence = occurrence;
  }
}
