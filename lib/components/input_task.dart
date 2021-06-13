import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:school_planner/components/date_time_input.dart';
import 'package:school_planner/components/elevated_button.dart';

import 'package:school_planner/components/bottom_sheet.dart';
import 'package:school_planner/components/text_input.dart';
import 'package:school_planner/controller/personal/controller.dart';
import 'package:school_planner/controller/personal/input.dart';
import 'package:school_planner/models/task.dart';
import 'package:school_planner/theme/app_theme.dart';
import 'package:uuid/uuid.dart';

class InputTask extends GetView<InputController> {
  final SchoolController schoolController;

  InputTask({required this.schoolController});

  void _onSubmit(BuildContext context) {
    this.schoolController.addTask(
          Task(
            name: controller.taskState.currentState!.fields['taskName']!.value,
            date: controller.taskState.currentState!.fields['taskDate']!.value,
            subjectId: controller
                .taskState.currentState!.fields['subjectsTaskChoice']!.value,
            id: Uuid().v4(),
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
            height: 400,
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
                      isLastInput: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: CustomDateTimeInputField(
                      fieldName: 'taskDate',
                      label: 'Data da tarefa',
                      onChanged: onDateValueChanged,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: FormBuilderDropdown(
                      name: 'subjectsTaskChoice',
                      allowClear: true,
                      items: schoolController.getUserSubjects().map(
                        (e) {
                          return DropdownMenuItem(
                            value: e.id,
                            child: Text(e.name),
                          );
                        },
                      ).toList(),
                      decoration: standardInputDecoration('Selecionar matéria'),
                      // onChanged: onDateValueChanged,
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: CustomElevatedButton(
                      isEnabled: controller.isTaskSubjectButtonEnabled,
                      label: 'Criar tarefa',
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
