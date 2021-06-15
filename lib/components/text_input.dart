import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:school_planner/theme/app_theme.dart';

class CustomInputTextField extends StatelessWidget {
  final String fieldName;
  final String hint;
  final String label;
  final Function(String? value) onChanged;
  final int? maxLength;
  final bool isName;
  final bool isLastInput;

  CustomInputTextField(
      {required this.fieldName,
      required this.hint,
      required this.label,
      required this.onChanged,
      this.maxLength,
      this.isName = false,
      this.isLastInput = false});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      textInputAction:
          this.isLastInput ? TextInputAction.done : TextInputAction.next,
      name: this.fieldName,
      maxLength: this.maxLength != null ? this.maxLength : 25,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context, errorText: "Campo obrigatório"),
        FormBuilderValidators.minLength(context, 3,
            errorText: "Mínimo 3 caracteres"),
      ]),
      cursorColor: Colors.black,
      keyboardType: TextInputType.name,
      textCapitalization:
          this.isName ? TextCapitalization.words : TextCapitalization.sentences,
      onChanged: (value) => this.onChanged(value),
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
