import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:school_planner/components/date_time_input.dart';
import 'package:weekday_selector/weekday_selector.dart';

import 'package:school_planner/components/bottom_sheet.dart';
import 'package:school_planner/components/text_input.dart';
import 'package:school_planner/controller/personal/controller.dart';
import 'package:school_planner/controller/personal/input.dart';
import 'package:school_planner/models/task.dart';
import 'package:school_planner/theme/app_theme.dart';

class InputTask extends GetView<InputController> {
  final SchoolController schoolController;

  InputTask({required this.schoolController});

  void _onSubmit(BuildContext context) {
    this.schoolController.addTask(
          Task(
            name: controller.taskState.currentState!.fields['taskName']!.value,
            date: controller.taskState.currentState!.fields['taskDate']!.value,
          ),
        );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    void onTextValueChanged(String? value) {
      controller.taskState.currentState!.save();
      controller.checkInputTaskValidations();
    }

    void onDateValueChanged(DateTime? value) {
      controller.taskState.currentState!.save();
      controller.checkInputTaskValidations();

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
              key: controller.taskState,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: CustomInputTextField(
                      fieldName: 'taskName',
                      hint: 'Prova de Matemática, Atividade de Artes...',
                      label: 'Nome da tarefa',
                      onChanged: onTextValueChanged,
                      onSubmitted: () => FocusScope.of(context).nextFocus(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: CustomDateTimeInputField(
                      fieldName: 'taskDate',
                      label: 'Nome da tarefa',
                      onChanged: onDateValueChanged,
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: ElevatedButton.icon(
                      onPressed: () => this._onSubmit(context),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            controller.isTaskSubjectButtonEnabled
                                ? shrinePink100
                                : Colors.grey),
                        shape: MaterialStateProperty.all(StadiumBorder()),
                        minimumSize: MaterialStateProperty.all(
                            Size(double.minPositive, 50)),
                      ),
                      icon: FaIcon(
                        controller.isTaskSubjectButtonEnabled
                            ? FontAwesomeIcons.check
                            : FontAwesomeIcons.times,
                      ),
                      label: Text(
                        controller.isTaskSubjectButtonEnabled
                            ? 'Criar tarefa'
                            : 'Preencha todos os campos',
                        style: GoogleFonts.aBeeZee(fontSize: 15),
                      ),
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
