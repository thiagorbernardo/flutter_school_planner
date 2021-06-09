import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:school_planner/controller/personal/input.dart';
import 'package:school_planner/theme/app_theme.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function(BuildContext context) onSubmit;
  final String label;
  final bool isEnabled;

  CustomElevatedButton(
      {required this.onSubmit, required this.isEnabled, required this.label});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InputController>(
      init: InputController(),
      initState: (_) {},
      builder: (_) {
        return ElevatedButton.icon(
          onPressed: this.isEnabled ? () => this.onSubmit(context) : null,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              this.isEnabled ? shrinePink100 : Colors.grey,
            ),
            shape: MaterialStateProperty.all(
              StadiumBorder(),
            ),
            minimumSize: MaterialStateProperty.all(
              Size(double.minPositive, 50),
            ),
          ),
          icon: FaIcon(
            this.isEnabled ? FontAwesomeIcons.check : FontAwesomeIcons.times,
          ),
          label: Text(
            this.isEnabled ? this.label : 'Preencha os campos obrigatórios',
            style:
                GoogleFonts.aBeeZee(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        );
      },
    );
  }
}
