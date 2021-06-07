import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class InputController extends GetxController {
  GlobalKey<FormBuilderState> subjectState = GlobalKey<FormBuilderState>();
  bool isCreateSubjectButtonEnabled = false;

  void checkValidations() {
    bool stateIsNull = subjectState.currentState?.validate() == null;
    if (!stateIsNull)
      isCreateSubjectButtonEnabled = subjectState.currentState!.validate();

    this.update();
  }
}
