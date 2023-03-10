import 'package:hive/hive.dart';

import 'package:school_planner/models/weekday.dart';
import 'package:school_planner/utils/string/string.dart';

part 'subject.g.dart';

@HiveType(typeId: 1)
class Subject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String professor;
  @HiveField(3)
  String? backgroundImage;
  @HiveField(4)
  List<WeekDay> periodicity;

  Subject({
    this.backgroundImage,
    required this.name,
    required this.professor,
    required this.periodicity,
    required this.id,
  });
  // this.periodicity.sort((a, b) => a.dayOfWeek.compareTo(b.dayOfWeek));

  String getSubjectPeriodicity() {
    if (this.periodicity.isEmpty) return 'Sem descrição';
    List<String> period = this
        .periodicity
        .map(
          (e) =>
              '${e.dayName.substring(0, 3)} ${StringHelper.getNumberWithZero(e.occurrence.hour)}:${StringHelper.getNumberWithZero(e.occurrence.minute)}',
        )
        .toList();

    period = period.map((element) {
      if (period.last == element) return element;
      return element + ((period.indexOf(element) % 3 + 1) != 3 ? " / " : "\n");
    }).toList();

    return period.join();
  }
}
