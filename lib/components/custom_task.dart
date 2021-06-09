import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_planner/controller/personal/controller.dart';
import 'package:school_planner/models/task.dart';
import 'package:school_planner/theme/app_theme.dart';

class CustomTaskWidget extends GetView<SchoolController> {
  final Task task;

  CustomTaskWidget(this.task);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 0.2),
      ),
      child: Material(
        elevation: 8,
        color: Color(0xFFD8F1FE),
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.getDate(),
                      textAlign: TextAlign.start,
                      style: GoogleFonts.aBeeZee(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      task.getTime(),
                      textAlign: TextAlign.start,
                      style: GoogleFonts.aBeeZee(
                        color: Color(0xFF9E9E9E),
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  task.subjectId != null ?
                  Spacer(flex: 7,) : Spacer(flex: 1,),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: AutoSizeText(
                      task.name,
                      maxLines: 1,
                      minFontSize: 13,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.aBeeZee(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Spacer(flex: 1,),
                  task.subjectId != null
                      ? Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Text(
                            controller.getSubjectRelatedToTask(task.subjectId),
                            textAlign: TextAlign.start,
                            style: GoogleFonts.aBeeZee(
                              fontSize: 10,
                              color: Color(0xFF9E9E9E),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  task.subjectId != null ?
                  SizedBox(height: 10,) : SizedBox.shrink(),
                ],
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
                child: FaIcon(
                  FontAwesomeIcons.bookOpen,
                  color: strongDeppOrange,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
