import 'package:flutter/material.dart';

class Task {
  late String id;

  String name;
  DateTime date;

  Task({required this.name, required this.date});

  String getDate() {
    return '${date.day}, ${date.month.toString().substring(0, 3)}';
  }

  String getTime() {
    return '${date.hour}:${date.minute}';
  }
}
