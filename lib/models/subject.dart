import 'dart:io';

import 'package:school_planner/models/weekday.dart';
import 'package:uuid/uuid.dart';

class Subject {
  final String id = Uuid().v4();
  String name;
  String professor;
  File? backgroundImage;
  List<WeekDay> periodicity;
  late DateTime day;

  Subject(
      {this.backgroundImage,
      required this.name,
      required this.professor,
      required this.periodicity}) {
    // this.periodicity.sort((a, b) => a.dayOfWeek.compareTo(b.dayOfWeek));
  }

  String getNumberWithZero(int number) {
    return number < 10 ? '0$number' : '$number';
  }

  String getSubjectPeriodicity() {
    if (this.periodicity.isEmpty) return 'Sem descrição';
    List<String> period = this
        .periodicity
        .map(
          (e) =>
              '${e.dayName.substring(0, 3)} ${this.getNumberWithZero(e.occurrence.hour)}:${this.getNumberWithZero(e.occurrence.minute)}',
        )
        .toList();

    period = period.map((element) {
      if (period.last == element) return element;
      return element + ((period.indexOf(element) % 3 + 1) != 3 ? " / " : "\n");
    }).toList();

    return period.join();
  }
}
