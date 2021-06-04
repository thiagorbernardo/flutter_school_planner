import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register {
  late DateTime day;
  late int counter;

  Register(DateTime day, int counter) {
    this.day = day;
    this.counter = counter;
  }
}

class SchoolController extends GetxController {
  DateTime time = DateTime.now();
  List<Register> registers = [Register(DateTime.now(), 1)];

  void updateHour(TimeOfDay newTime) {
    this.time =
        DateTime(time.year, time.month, time.day, newTime.hour, newTime.minute);
    this.update();
  }

  void addRegister() {
    this.registers.add(Register(DateTime.now(), 1));
    this
        .registers
        .sort((Register a, Register b) => a.day.isBefore(b.day) ? 1 : -1);
    this.update();
  }

  Register getRegisterByIndex(int index) {
    return this.registers[index];
  }
}
