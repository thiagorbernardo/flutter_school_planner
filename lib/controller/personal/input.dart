
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_planner/models/weekday.dart';

class InputController extends GetxController {
  GlobalKey<FormBuilderState> subjectState = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> taskState = GlobalKey<FormBuilderState>();

  bool isCreateSubjectButtonEnabled = false;
  bool isTaskSubjectButtonEnabled = false;
  bool userHasSelectedImage = false;

  String? image;
  final picker = ImagePicker();

  TimeOfDay firstSelectedTIme = TimeOfDay.now();

  List<WeekDay> weekDays = [
    WeekDay('Domingo', DateTime.sunday),
    WeekDay('Segunda', DateTime.monday),
    WeekDay('Terça', DateTime.tuesday),
    WeekDay('Quarta', DateTime.wednesday),
    WeekDay('Quinta', DateTime.thursday),
    WeekDay('Sexta', DateTime.friday),
    WeekDay('Sábado', DateTime.saturday),
  ];

  Future<void> getImage() async {
    final pickedFile = await this.picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      //TODO: Checar quando a imagem é apagada
      this.image = pickedFile.path;
      this.userHasSelectedImage = true;

      this.checkInputSubjectValidations();
    } else {
      print('No image selected.');
    }
  }

  void checkInputSubjectValidations() {
    bool stateIsNull = this.subjectState.currentState?.validate() == null;
    if (!stateIsNull)
      this.isCreateSubjectButtonEnabled = subjectState.currentState!.validate();

    this.update();
  }

  void checkInputTaskValidations() {
    bool stateIsNull = this.taskState.currentState?.validate() == null;
    if (!stateIsNull)
      this.isTaskSubjectButtonEnabled = taskState.currentState!.validate();

    this.update();
  }

  Future<bool> toggleWeekDay(int day, BuildContext inputContext) async {
    int dayToSearch = day != 7 ? day : 0;
    bool isSelected = false;
    TimeOfDay? selectedTime;

    if (!this.weekDays[dayToSearch].isSelected) {
      selectedTime = await showTimePicker(
        context: inputContext,
        initialTime: firstSelectedTIme,
      );
    } else
      this.weekDays[dayToSearch].toggleSelection();

    if (selectedTime != null) {
      this.weekDays[dayToSearch].toggleSelection();
      this.weekDays[dayToSearch].occurrence = selectedTime;
      firstSelectedTIme = selectedTime;

      isSelected = true;
    }

    this.update();

    return isSelected;
  }

  List<String> getWeekDaysNames() {
    return this.weekDays.map((e) => e.dayName.substring(0, 1)).toList();
  }

  List<bool> getWeekDaysValues() {
    return this.weekDays.map((e) => e.isSelected).toList();
  }

  List<WeekDay> getSelectedWeekDays() {
    return this.weekDays.where((day) => day.isSelected).toList();
  }
}
