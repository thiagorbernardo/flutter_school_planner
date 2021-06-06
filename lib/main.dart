import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_planner/routes/app_pages.dart';
import 'package:school_planner/theme/app_theme.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/home',
    defaultTransition: Transition.native,
    locale: Locale('pt', 'BR'),
    getPages: AppPages.pages,
    debugShowCheckedModeBanner: false,
    theme: buildShrineTheme(),
    title: 'School Planner',
  ));
}
