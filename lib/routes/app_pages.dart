import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_planner/controller/personal/bind.dart';
import 'package:school_planner/pages/course_details_page.dart';
import 'package:school_planner/pages/home_page.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.HOME,
        page: () => HomePage(),
        binding: SchoolPlannerBind()),
    GetPage(
        name: Routes.COURSE_DETAILS,
        page: () => CourseDetailsPage(),
        binding: SchoolPlannerBind()),
  ];
}
