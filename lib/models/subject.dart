import 'dart:io';

class Subject {
  late String id;
  late String name;
  late String professor;
  File backgroundImage;
  late String periodicity;
  late DateTime day;

  Subject({
    required this.backgroundImage,
    required this.name,
    required this.professor,
  });
}
