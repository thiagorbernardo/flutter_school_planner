import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:school_planner/components/custom_task.dart';
import 'package:school_planner/controller/personal/controller.dart';
import 'package:school_planner/models/subject.dart';
import 'package:school_planner/theme/app_theme.dart';
import 'package:school_planner/utils/date/date.dart';
import 'package:weekday_selector/weekday_selector.dart';

class CourseDetailsPage extends GetView<SchoolController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Subject subject;

  CourseDetailsPage() {
    this.subject = controller.user.getSubjectById(Get.parameters['id']!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                height: 200,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.dstATop),
                    image: AssetImage('assets/images/background_subject.jpg'),
                  ),
                ),
                child: Text(
                  this.subject.name,
                  // "aaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaaaaaaaa",
                  style: screenTitle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            IconButton(
              onPressed: () async {
                Navigator.pop(context);
              },
              icon: FaIcon(
                FontAwesomeIcons.arrowLeft,
                size: 28,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 190),
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15), bottom: Radius.zero),
                child: Container(
                  // height: 150,
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Professor: ${this.subject.professor}",
                        style: screenText,
                      ),
                      subject.periodicity.isNotEmpty
                          ? Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                "Horários:",
                                style: screenText,
                              ),
                            )
                          : SizedBox.shrink(),
                      ...this.subject.periodicity.map(
                            (e) => Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                "${e.dayName} às ${DateHelper.formatDateWithZero(e.occurrence)}",
                                style: screenText,
                              ),
                            ),
                          ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
