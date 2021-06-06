import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school_planner/components/fancy_fab.dart';
import 'package:school_planner/controller/personal/controller.dart';
import 'package:lottie/lottie.dart';

import '../components/course_card.dart';
import '../components/custom_task.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class HomePage extends GetView<SchoolController> {
  int i = 1;
  int _bottomNavIndex = 0;

  Widget getTasksWidgets() {
    return GetBuilder<SchoolController>(
      init: SchoolController(),
      initState: (_) {},
      builder: (_) {
        return controller.tasks.length > 0
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                    child: Text(
                      controller.getHowManyTasks(),
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Color(0xFF616161),
                      ),
                    ),
                  ),
                  Column(
                    children: controller.getThreeTasks().map(
                      (e) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: CustomTaskWidget(e),
                        );
                      },
                    ).toList(),
                  )
                ],
              )
            : SizedBox.shrink();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FancyFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [
          FontAwesomeIcons.home,
          FontAwesomeIcons.calendarAlt,
          FontAwesomeIcons.userGraduate,
          FontAwesomeIcons.bars,
        ],
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) => (_bottomNavIndex = index),
        //other params
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 20, 0, 15),
                child: AutoSizeText(
                  controller.getGreeting(),
                  // 'Boa noite, Thiago!',
                  textAlign: TextAlign.start,
                  //GoogleFonts.aBeeZee
                  style: GoogleFonts.aBeeZee(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.9,
                      color: Color(0xFF141414)),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: DatePicker(
                  DateTime.now(),
                  locale: 'pt-BR',
                  height: 85,
                  dateTextStyle: GoogleFonts.aBeeZee(
                      fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    this.getTasksWidgets(),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                      child: Text(
                        'Minhas matérias',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Color(0xFF616161),
                        ),
                      ),
                    ),
                    GetBuilder<SchoolController>(
                      init: SchoolController(),
                      initState: (_) {},
                      builder: (_) {
                        return Padding(
                            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: controller.subjects.isNotEmpty
                                ? SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: controller.subjects.map(
                                          (e) {
                                            return Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 15, 0),
                                              child: CourseCardWidget(e),
                                            );
                                          },
                                        ).toList()))
                                : Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      AutoSizeText(
                                        'Oops, parece que você ainda não adicionou suas matérias!',
                                        style: GoogleFonts.aBeeZee(
                                          fontSize: 22,
                                        ),
                                      ),
                                      Lottie.asset(
                                        'assets/lottie/student-waiting.json',
                                        repeat: true,
                                        reverse: false,
                                        animate: true,
                                      ),
                                      AutoSizeText(
                                        'Não perca tempo!',
                                        style: GoogleFonts.aBeeZee(
                                          fontSize: 22,
                                        ),
                                      ),
                                    ],
                                  ));
                      },
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
