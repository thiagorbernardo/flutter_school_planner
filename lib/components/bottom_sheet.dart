import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_planner/controller/personal/controller.dart';
import 'package:school_planner/theme/app_theme.dart';

class CustomBottomSheet extends GetView<SchoolController> {
  final List<Widget> items;
  final Widget? customWidget;
  final double height;
  final Color? backgroundColor;

  CustomBottomSheet(
      {required this.items,
      required this.height,
      this.backgroundColor,
      this.customWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      color: this.backgroundColor != null ? this.backgroundColor : Colors.white,
      child: this.customWidget != null
          ? Padding(
              padding: EdgeInsets.fromLTRB(25, 20, 25, 0),
              child: this.customWidget,
            )
          : ListView.builder(
              padding: EdgeInsets.fromLTRB(25, 20, 25, 0),
              itemCount: this.items.length,
              itemBuilder: (context, index) => this.items[index],
            ),
    );
  }
}
