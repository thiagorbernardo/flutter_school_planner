import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school_planner/components/bottom_sheet.dart';
import 'package:school_planner/controller/personal/controller.dart';
import 'package:school_planner/models/subject.dart';
import 'package:school_planner/models/task.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class FancyFab extends GetView<SchoolController> {
  final AnimateIconController fabController = AnimateIconController();

  @override
  Widget build(BuildContext context) {
    int i = 1;
    return FloatingActionButton(
      // backgroundColor: Color(0xFFFFA400),
      elevation: 8,
      onPressed: () {},
      child: AnimateIcons(
        startIcon: FontAwesomeIcons.plus,
        endIcon: FontAwesomeIcons.times,
        controller: fabController,
        size: 35,
        onStartIconPress: () {
          controller.addSubject(
            Subject(
              backgroundImage: 'https://picsum.photos/seed/789/300',
              name: 'Cálculo $i',
              professor: 'Daniela',
            ),
          );
          controller.addTask(
            Task(
              name: 'Prova ${i++} de Matemática',
              date: DateTime.now(),
            ),
          );
          showBarModalBottomSheet(
            context: context,
            // barrierColor: Colors.transparent,
            builder: (context) => CustomBottomSheet()
          );
          return true;
        },
        onEndIconPress: () {
          print("Clicked on Close Icon");
          return true;
        },
        duration: Duration(milliseconds: 500),
        startIconColor: Color(0xFF442B2D),
        endIconColor: Color(0xFF442B2D),
        clockwise: false,
      ),
    );
  }
}
