import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_planner/models/subject.dart';
import 'package:school_planner/models/task.dart';
import 'package:uuid/uuid.dart';

class SchoolController extends GetxController {
  Uuid _uuid = Uuid();
  DateTime time = DateTime.now();
  List<Subject> subjects = [
    // Subject('https://picsum.photos/seed/789/300', 'Cálculo 2', 'Daniela')
  ];
  List<Task> tasks = [
    Task(name: 'Prova de Química E-302', date: DateTime.now())
  ];

  String getGreeting() {
    print(time);
    String greeting;
    if (this.time.hour > 17 || this.time.hour < 6)
      greeting = 'Boa Noite';
    else if (this.time.hour < 12)
      greeting = 'Bom dia';
    else
      greeting = 'Boa Tarde';

    return '$greeting, Thiago';
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
