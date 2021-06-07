import 'package:get/get.dart';
import 'package:school_planner/models/subject.dart';
import 'package:school_planner/models/task.dart';
import 'package:school_planner/models/user.dart';
import 'package:uuid/uuid.dart';

class SchoolController extends GetxController {
  Uuid _uuid = Uuid();
  DateTime time = DateTime.now();
  User user = User(name: 'Thiago');
  List<Subject> subjects = [
    // Subject('https://picsum.photos/seed/789/300', 'Cálculo 2', 'Daniela')
  ];
  List<Task> tasks = [
    // Task(name: 'Prova de Química E-302', date: DateTime.now())
  ];

  String getGreeting() {
    String greeting;
    if (this.time.hour > 17 || this.time.hour < 6)
      greeting = 'Boa Noite';
    else if (this.time.hour < 12)
      greeting = 'Bom dia';
    else
      greeting = 'Boa Tarde';

    return '$greeting, ${user.name}';
  }

  String getHowManyTasks() {
    if (this.tasks.length == 1)
      return 'Próxima tarefa';
    else if (this.tasks.length <= 3)
      return 'Próximas ${this.tasks.length} tarefas';
    else
      return 'Próximas 3 tarefas';
  }

  List<Task> getThreeTasks() {
    return this.tasks.length > 3 ? this.tasks.sublist(0, 3) : this.tasks;
  }

  void addSubject(Subject subject) {
    subject.id = this._uuid.v4();

    this.subjects.add(subject);
    this.update();
  }

  void addTask(Task task) {
    task.id = this._uuid.v4();

    this.tasks.add(task);
    this.update();
  }
}
