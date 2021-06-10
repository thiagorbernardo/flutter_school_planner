import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_planner/models/subject.dart';
import 'package:school_planner/theme/app_theme.dart';

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
              subject.backgroundImage != null
                  ? Image.file(
                      subject.backgroundImage!,
                      width: double.infinity,
                      height: 120,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      height: 120,
                      color: shrinePink50,
                      child: AutoSizeText(
                        subject.name,
                        maxLines: 4,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.aBeeZee(fontSize: 16),
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
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
                child: AutoSizeText(
                  'Professor(a): ${subject.professor}',
                  maxLines: 1,
                  minFontSize: 10,
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
