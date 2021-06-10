import 'package:school_planner/models/subject.dart';
import 'package:school_planner/models/task.dart';
import 'package:uuid/uuid.dart';

class User {
  final String id = Uuid().v4();
  String name;
  late String email;
  List<Subject> subjects = [];

  List<Task> tasks = [
    Task(name: 'Prova de Química E-302222', date: DateTime.now())
  ];

  User({required this.name});
}
