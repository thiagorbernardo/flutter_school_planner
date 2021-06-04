import 'package:get/get.dart';
import 'package:school_planner/controller/personal/controller.dart';

import '../components/course_card.dart';
import '../components/custom_task.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class HomePage extends GetView<SchoolController> {
  // DateTimeRange calendarSelectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: Alignment(-0.85, -0.95),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5, 20, 0, 15),
                  child: AutoSizeText(
                    'Boa noite, Daniela!',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: DatePicker(
                  DateTime.now(),
                  locale: 'pt-BR',
                  height: 85,
                  dateTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: CustomTaskWidget(),
              ),
              Align(
                alignment: Alignment(-0.9, 0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                  child: Text(
                    'Minhas matérias',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(-0.6, 0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: CourseCardWidget(),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: CourseCardWidget(),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: CourseCardWidget(),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
