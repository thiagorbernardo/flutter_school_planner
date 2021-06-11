import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_planner/controller/local_database.dart';
import 'package:school_planner/routes/app_pages.dart';
import 'package:school_planner/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDatabase.initDb();
  runApp(
    GetMaterialApp(
      initialRoute: '/home',
      defaultTransition: Transition.native,
      locale: Get.deviceLocale,
      fallbackLocale: Locale('pt', 'BR'),
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
      theme: buildShrineTheme(),
      title: 'School Planner',
    ),
  );
}
