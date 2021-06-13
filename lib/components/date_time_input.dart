import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:school_planner/theme/app_theme.dart';
import 'package:school_planner/utils/date/date.dart';
// import 'package:school_planner/utils/date/date.dart';

class CustomDateTimeInputField extends StatelessWidget {
  final String fieldName;
  final String label;
  final Function(DateTime? value) onChanged;

  CustomDateTimeInputField(
      {required this.fieldName, required this.onChanged, required this.label});

  @override
  Widget build(BuildContext context) {
    // final node = FocusScope.of(context);
    return FormBuilderDateTimePicker(
      name: this.fieldName,
      alwaysUse24HourFormat: true,
      cancelText: 'Cancelar',
      firstDate: DateTime.now(),
      initialTime: TimeOfDay.now(),
      format: DateFormat('H:m d/M/y'),
      onChanged: (value) => this.onChanged(value),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context, errorText: "Campo obrigatório"),
        (selectedTime) {
          if (DateHelper.dateIsGreater(DateTime.now(), selectedTime!))
            return "Esta data já passou";
          return null;
        }
      ]),
      decoration: standardInputDecoration(this.label),
    );
  }
}
