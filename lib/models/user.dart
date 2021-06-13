import 'package:hive/hive.dart';
import 'package:school_planner/models/subject.dart';
import 'package:school_planner/models/task.dart';
import 'package:uuid/uuid.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final String id = Uuid().v4();
  @HiveField(1)
  String name;
  // @HiveField(2)
  // late String email;
  @HiveField(2)
  List<Subject> subjects = [];
  @HiveField(3)
  List<Task> tasks = [
    // Task(name: 'Prova de Química E-302222', date: DateTime.now())
  ];

  bool initialized = false;

  User({
    required this.name,
  });

  List<Task> getCurrentTasks() {
    return this
        .tasks
        .where((el) =>
            el.date.millisecondsSinceEpoch >
            DateTime.now().millisecondsSinceEpoch)
        .toList();
  }
}
