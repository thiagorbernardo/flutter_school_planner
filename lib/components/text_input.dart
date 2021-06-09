import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:school_planner/theme/app_theme.dart';

class CustomInputTextField extends StatelessWidget {
  final String fieldName;
  final String hint;
  final String label;
  final Function(String? value) onChanged;
  final Function onSubmitted;
  final int? maxLength;

  CustomInputTextField({
    required this.fieldName,
    required this.hint,
    required this.label,
    required this.onChanged,
    required this.onSubmitted,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    // final node = FocusScope.of(context);
    return FormBuilderTextField(
      name: this.fieldName,
      maxLength: this.maxLength != null ? this.maxLength :  25,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context, errorText: "Campo obrigatório"),
        FormBuilderValidators.minLength(context, 3,
            errorText: "Mínimo 3 caracteres"),
      ]),
      cursorColor: Colors.black,
      onChanged: (value) => this.onChanged(value),
      // onSubmitted: (_) {
      //   // onSubmitted();
      //   print("finish");

      //   // print(node.hasFocus);
      // },
      decoration: InputDecoration(
        hintText: this.hint,
        hintStyle: inputHintStyle,
        labelText: this.label,
        labelStyle: inputLabelStyle,
        focusedBorder: inputTextBorderStyle,
        border: inputTextBorderStyle,
      ),
    );
  }
}
