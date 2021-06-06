import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school_planner/components/bottom_sheet.dart';
import 'package:school_planner/controller/personal/controller.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class FancyFab extends GetView<SchoolController> {
  final AnimateIconController fabController = AnimateIconController();

  void onButtonPressed(BuildContext context) {
    showBarModalBottomSheet(
        context: context,
        barrierColor: Colors.black.withOpacity(0.8),
        builder: (context) => CustomBottomSheet());
  }

  @override
  Widget build(BuildContext context) {
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
