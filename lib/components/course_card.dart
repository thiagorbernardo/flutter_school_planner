import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_planner/controller/personal/controller.dart';
import 'package:school_planner/models/subject.dart';

class CourseCardWidget extends StatelessWidget {
  final Subject subject;

  CourseCardWidget(this.subject);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Get.toNamed('/course-details');
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 300,
        height: 280,
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Color(0xFFF5F5F5),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.file(
                subject.backgroundImage,
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Text(
                  subject.name,
                  style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2),
                ),
              ),
              // Spacer(),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: Text(
                  subject.getSubjectPeriodicity(),
                  textAlign: TextAlign.start,
                  style: GoogleFonts.roboto(letterSpacing: 0.5),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
                child: Text(
                  'Professor(a): ${subject.professor}',
                  style: GoogleFonts.roboto(
                    color: Color(0xFF9E9E9E),
                    letterSpacing: 1.1,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
