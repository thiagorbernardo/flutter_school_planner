import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_planner/utils/extensions/map.dart';
class InputController extends GetxController {
  GlobalKey<FormBuilderState> subjectState = GlobalKey<FormBuilderState>();

  bool isCreateSubjectButtonEnabled = false;
  bool userHasSelectedImage = false;

  late File image;
  final picker = ImagePicker();

  Map<String, bool> weekDays = {
    'Domingo': false, // Sunday
    'Segunda': false, // Monday
    'Terça': false, // Tuesday
    'Quarta': false, // Wednesday
    'Quinta': false, // Thursday
    'Sexta': false, // Friday
    'Sábado': false, // Saturday
  };

  Future getImage() async {
    final pickedFile = await this.picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      this.image = File(pickedFile.path);
      this.userHasSelectedImage = true;
    } else {
      print('No image selected.');
    }

    this.update();
  }

  void checkValidations() {
    bool stateIsNull = subjectState.currentState?.validate() == null;
    if (!stateIsNull)
      isCreateSubjectButtonEnabled =
          subjectState.currentState!.validate() && this.userHasSelectedImage;

    this.update();
  }

  void toggleWeekDay(int day) {
    int dayToSearch = day != 7 ? day : 0;

    this.weekDays.update(this.weekDays.keyAt(dayToSearch), (value) => !value);

    this.update();
  }

  List<String> getWeekDaysNames() {
    return this.weekDays.keys.map((e) => e.substring(0, 1)).toList();
  }

  List<bool> getWeekDaysValues() {
    return this.weekDays.values.toList();
  }
}
