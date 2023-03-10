import 'package:flutter/material.dart';
import 'package:school_planner/utils/string/string.dart';

class DateHelper {
  static bool dateIsGreater(DateTime a, DateTime b) =>
      a.millisecondsSinceEpoch > b.millisecondsSinceEpoch;
  static String formatDateWithZero(TimeOfDay time) =>
      "${StringHelper.getNumberWithZero(time.hour)}:${StringHelper.getNumberWithZero(time.minute)}";
}
