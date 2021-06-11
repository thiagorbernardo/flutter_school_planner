import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:school_planner/controller/local_database.dart';
import 'package:school_planner/models/subject.dart';
import 'package:school_planner/models/task.dart';
import 'package:school_planner/models/user.dart';
import 'package:school_planner/models/weekday.dart';

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

  List<Task> getUserTasks() {
    return this.user.tasks;
  }

  bool isSubjectsEmpty() => this.user.subjects.isEmpty;

  bool isTasksEmpty() => this.user.tasks.isEmpty;
}
