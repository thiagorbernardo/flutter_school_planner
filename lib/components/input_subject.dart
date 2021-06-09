import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:school_planner/components/elevated_button.dart';
import 'package:weekday_selector/weekday_selector.dart';

import 'package:school_planner/components/bottom_sheet.dart';
import 'package:school_planner/components/text_input.dart';
import 'package:school_planner/controller/personal/controller.dart';
import 'package:school_planner/controller/personal/input.dart';
import 'package:school_planner/models/subject.dart';
import 'package:school_planner/theme/app_theme.dart';

class InputSubject extends GetView<InputController> {
  final SchoolController schoolController;

  InputSubject({required this.schoolController});

  void _onSubmit(BuildContext context) {
    this.schoolController.addSubject(
          Subject(
            backgroundImage: controller.image,
            name: controller
                .subjectState.currentState!.fields['subjectName']!.value,
            professor: controller
                .subjectState.currentState!.fields['professorName']!.value,
            periodicity: controller.getSelectedWeekDays(),
          ),
        );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    void onValueChanged(String? value) {
      controller.subjectState.currentState!.save();
      controller.checkInputSubjectValidations();
    }

    void _onWeekDaySelected(int day) async {
      await controller.toggleWeekDay(day, context);

      controller.checkInputSubjectValidations();
    }

    return GetBuilder<InputController>(
      init: InputController(),
      initState: (_) {},
      builder: (_) {
        return BarBottomSheet(
          child: CustomBottomSheet(
            height: 500,
            items: [],
            customWidget: FormBuilder(
              key: controller.subjectState,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: CustomInputTextField(
                      fieldName: 'subjectName',
                      hint: 'Matemática, Física, História...',
                      label: 'Nome da matéria',
                      onChanged: onValueChanged,
                      onSubmitted: () => FocusScope.of(context).nextFocus(),
                      maxLength: 55,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: CustomInputTextField(
                      fieldName: 'professorName',
                      hint: 'Thiago...',
                      label: 'Nome do professor',
                      onChanged: onValueChanged,
                      onSubmitted: () => FocusScope.of(context).nextFocus(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: ElevatedButton.icon(
                      icon: FaIcon(controller.userHasSelectedImage
                          ? FontAwesomeIcons.check
                          : FontAwesomeIcons.solidImages),
                      onPressed: () => controller.getImage(),
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(1),
                        backgroundColor:
                            MaterialStateProperty.all(shrinePink100),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(
                          Size(double.infinity, 50),
                        ),
                      ),
                      label: Text(
                        'Escolher imagem de fundo',
                        style: GoogleFonts.aBeeZee(),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Dias da semana',
                      style: GoogleFonts.aBeeZee(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: WeekdaySelector(
                      onChanged: (day) {
                        _onWeekDaySelected(day);
                      },
                      elevation: 2,
                      selectedFillColor: shrinePink100,
                      values: controller.getWeekDaysValues(),
                      firstDayOfWeek: DateTime.sunday,
                      shortWeekdays: controller.getWeekDaysNames(),
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: CustomElevatedButton(
                      isEnabled: controller.isCreateSubjectButtonEnabled,
                      label: 'Criar matéria',
                      onSubmit: (context) => this._onSubmit(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
