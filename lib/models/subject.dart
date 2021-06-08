import 'dart:io';

import 'package:school_planner/models/weekday.dart';
import 'package:uuid/uuid.dart';

class Subject {
  late String id;
  String name;
  String professor;
  File backgroundImage;
  List<WeekDay> periodicity;
  late DateTime day;

  Subject(
      {required this.backgroundImage,
      required this.name,
      required this.professor,
      required this.periodicity}) {
    this.id = Uuid().v4();
  }
}
