import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class InputController extends GetxController {
  GlobalKey<FormBuilderState> subjectState = GlobalKey<FormBuilderState>();
  bool isCreateSubjectButtonEnabled = false;
  late File image;
  bool userHasSelectedImage = false;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await this.picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      this.image = File(pickedFile.path);
      this.userHasSelectedImage = true;
    } else {
      print('No image selected.');
    }
  }

  void checkValidations() {
    bool stateIsNull = subjectState.currentState?.validate() == null;
    if (!stateIsNull)
      isCreateSubjectButtonEnabled = subjectState.currentState!.validate() && this.userHasSelectedImage;

    this.update();
  }
}
