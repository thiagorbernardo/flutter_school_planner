import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_planner/controller/personal/controller.dart';
import 'package:school_planner/models/task.dart';

class CustomTaskWidget extends StatelessWidget {
  final Task task;

  CustomTaskWidget(this.task);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: EdgeInsets.only(right: 16),
      child: Material(
        elevation: 5,
        color: Color(0xFFD8F1FE),
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
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
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  task.name,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.aBeeZee(
                    fontSize: 16,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 18, 0),
                child: FaIcon(
                  FontAwesomeIcons.bookOpen,
                  color: Color(0xFFFFA400),
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
