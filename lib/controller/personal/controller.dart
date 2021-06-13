import 'package:get/get.dart';
import 'package:school_planner/controller/local_database.dart';
import 'package:school_planner/models/subject.dart';
import 'package:school_planner/models/task.dart';
import 'package:school_planner/models/user.dart';

class SchoolController extends GetxController {
  LocalDatabase localDatabase = new LocalDatabase();
  DateTime time = DateTime.now();
  User user = User(name: '');

  SchoolController() {
    this.localDatabase.getUser('user').then((value) {
      value.initialized = true;
      this.user = value;
      this.update();
    });
    // this.localDatabase.deleteAll();
  }

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
    List<Task> currentTasks = this.user.getCurrentTasks();
    if (currentTasks.length == 1)
      return 'Próxima tarefa';
    else if (currentTasks.length <= 3)
      return 'Próximas ${currentTasks.length} tarefas';
    else
      return 'Próximas 3 tarefas';
  }

  List<Task> getThreeTasks() {
    List<Task> currentTasks = this.user.getCurrentTasks();
    return currentTasks.length > 3
        ? currentTasks.sublist(0, 3)
        : currentTasks;
  }

  void addSubject(Subject subject) async {
    this.user.subjects.add(subject);
    await localDatabase.saveUser('user', user);
    this.update();
  }

  void addTask(Task task) async {
    this.user.tasks.add(task);
    await localDatabase.saveUser('user', user);
    this.update();
  }

  String getSubjectRelatedToTask(String? subjectId) {
    String subj = this
        .user
        .subjects
        .firstWhere((element) => element.id == subjectId)
        .name;

    return subj.length > 40 ? subj.substring(0, 40) : subj;
  }

  List<Subject> getUserSubjects() {
    return this.user.subjects;
  }

  bool isSubjectsEmpty() => this.user.subjects.isEmpty;

  bool isTasksEmpty() => this.user.getCurrentTasks().isEmpty;
}
