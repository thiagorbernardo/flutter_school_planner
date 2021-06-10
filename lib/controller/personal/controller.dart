import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_planner/controller/database.dart';
import 'package:school_planner/models/subject.dart';
import 'package:school_planner/models/task.dart';
import 'package:school_planner/models/user.dart';
import 'package:school_planner/models/weekday.dart';

class SchoolController extends GetxController {
  LocalDatabase localDatabase = new LocalDatabase();
  DateTime time = DateTime.now();
  User user = new User(name: 'Thiago');

  void getMock() {
    List<WeekDay> x = [
      new WeekDay('Domingo', 7),
      new WeekDay('Sábado', 6),
      new WeekDay('Sexta', 5),
      new WeekDay('Quinta', 4),
      new WeekDay('Quarta', 3),
      new WeekDay('Terça', 2),
      new WeekDay('Segunda', 1),
    ];
    x.forEach((element) {
      element.setOccurrence(TimeOfDay.now());
    });

    for (var i = 0; i < 1; i++) {
      this.user.subjects.add(
            Subject(
              // backgroundImage: new File(
              //   '/data/user/0/com.example.school_planner/cache/image_picker9154556286543736499.jpg',
              // ),
              name: 'Análise de Sitemas Lineares e Geometria Geometria $i',
              professor: 'Ana Cristina Barreiras Kochem Vendramin',
              periodicity: x,
            ),
          );
    }
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
    if (this.user.tasks.length == 1)
      return 'Próxima tarefa';
    else if (this.user.tasks.length <= 3)
      return 'Próximas ${this.user.tasks.length} tarefas';
    else
      return 'Próximas 3 tarefas';
  }

  List<Task> getThreeTasks() {
    return this.user.tasks.length > 3
        ? this.user.tasks.sublist(0, 3)
        : this.user.tasks;
  }

  void addSubject(Subject subject) {
    this.user.subjects.add(subject);
    this.update();
  }

  void addTask(Task task) {
    this.user.tasks.add(task);
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

  void test() {
    new LocalDatabase().openBox();
  }

  List<Subject> getUserSubjects() {
    return this.user.subjects;
  }

  List<Task> getUserTasks() {
    return this.user.tasks;
  }

  bool isSubjectsEmpty() => this.user.subjects.isEmpty;

  bool isTasksEmpty() => this.user.tasks.isEmpty;
}
