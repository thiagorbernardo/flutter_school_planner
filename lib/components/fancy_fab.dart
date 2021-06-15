import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school_planner/components/bottom_sheet.dart';
import 'package:school_planner/components/input_subject.dart';
import 'package:school_planner/components/input_task.dart';
import 'package:school_planner/components/list_item.dart';
import 'package:school_planner/controller/personal/controller.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class FancyFab extends GetView<SchoolController> {
  @override
  Widget build(BuildContext context) {
    void onAddTaskPressed() {
      showBarModalBottomSheet(
        context: context,
        barrierColor: Colors.black.withOpacity(0.8),
        builder: (context) => InputTask(
          schoolController: controller,
        ),
      );
    }

    void onAddSubjectPressed() {
      showBarModalBottomSheet(
        context: context,
        barrierColor: Colors.black.withOpacity(0.8),
        builder: (context) => InputSubject(
          schoolController: controller,
        ),
      );
    }

    List<Widget> _items = [
      ListItem('Adicionar matéria', FontAwesomeIcons.graduationCap,
          onAddSubjectPressed),
      Divider(),
      ListItem('Adicionar tarefa', FontAwesomeIcons.bookOpen, onAddTaskPressed),
      Divider(),
    ];

    void onButtonPressed(BuildContext context) {
      showBarModalBottomSheet(
        context: context,
        barrierColor: Colors.black.withOpacity(0.8),
        builder: (context) => CustomBottomSheet(
          items: _items,
          height: 200,
        ),
      );
    }

    return FloatingActionButton(
      // backgroundColor: Color(0xFFFFA400),
      elevation: 8,
      onPressed: () => onButtonPressed(context),
      child: FaIcon(
        FontAwesomeIcons.plus,
        size: 35,
      ),
    );
  }
}
