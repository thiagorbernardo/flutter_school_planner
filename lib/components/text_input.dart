import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:school_planner/theme/app_theme.dart';

class CustomInputTextField extends StatelessWidget {
  final String fieldName;
  final String hint;
  final String label;
  final Function(String? value) onChanged;

  CustomInputTextField({
    required this.fieldName,
    required this.hint,
    required this.label,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: this.fieldName,
      maxLength: 25,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context, errorText: "Campo obrigatório"),
        FormBuilderValidators.minLength(context, 3,
            errorText: "Mínimo 3 caracteres"),
      ]),
      cursorColor: Colors.black,
      onChanged: (value) => this.onChanged(value),
      // onSubmitted: (value) => print('end with $value'),
      decoration: InputDecoration(
        hintText: this.hint,
        hintStyle: inputHintStyle,
        labelText: this.label,
        // errorText: 'ESTÁ ERRADP',
        labelStyle: inputLabelStyle,
        focusedBorder: inputTextBorderStyle,
        border: inputTextBorderStyle,
      ),
    );
  }
}
