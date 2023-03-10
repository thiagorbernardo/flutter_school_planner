import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: _shrineColorScheme,
    toggleableActiveColor: shrinePink400,
    accentColor: shrineBrown900,
    primaryColor: shrinePink100,
    buttonColor: shrinePink100,
    scaffoldBackgroundColor: shrineBackgroundWhite,
    cardColor: shrineBackgroundWhite,
    errorColor: shrineErrorRed,
    buttonTheme: const ButtonThemeData(
      colorScheme: _shrineColorScheme,
      textTheme: ButtonTextTheme.normal,
    ),
    primaryIconTheme: _customIconTheme(base.iconTheme),
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
    iconTheme: _customIconTheme(base.iconTheme),
  );
}

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: shrineBrown900);
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base.copyWith(
    caption: base.caption!.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: defaultLetterSpacing,
    ),
    button: base.button!.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      letterSpacing: defaultLetterSpacing,
    ),
    subtitle1: base.subtitle1!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        letterSpacing: 0.3,
        fontFamily: GoogleFonts.roboto().fontFamily),
  );
}

const ColorScheme _shrineColorScheme = ColorScheme(
  primary: shrinePink300,
  primaryVariant: shrineBrown900,
  secondary: shrinePink50,
  secondaryVariant: shrineBrown900,
  surface: shrineSurfaceWhite,
  background: shrineBackgroundWhite,
  error: shrineErrorRed,
  onPrimary: shrineBrown900,
  onSecondary: shrineBrown900,
  onSurface: shrineBrown900,
  onBackground: shrineBrown900,
  onError: shrineSurfaceWhite,
  brightness: Brightness.light,
);

const Color shrinePink50 = Color(0xFFFEEAE6);
const Color shrinePink100 = Color(0xFFFEDBD0);
const Color shrinePink300 = Color(0xFFFBB8AC);
const Color shrinePink400 = Color(0xFFEAA4A4);

const Color shrineBrown900 = Color(0xFF442B2D);
const Color shrineBrown600 = Color(0xFF7D4F52);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;

const strongDeppOrange = Color(0xFFFFA400);

const defaultLetterSpacing = 0.03;

// Inputs
TextStyle inputHintStyle = GoogleFonts.aBeeZee(fontSize: 12);
TextStyle inputLabelStyle = GoogleFonts.aBeeZee(color: shrineBrown900);

OutlineInputBorder inputTextBorderStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(color: shrineBrown900),
);

InputDecoration standardInputDecoration(String label) => InputDecoration(
      hintStyle: inputHintStyle,
      labelStyle: inputLabelStyle,
      labelText: label,
      focusedBorder: inputTextBorderStyle,
      border: inputTextBorderStyle,
    );

BorderRadius cardBorderRadius = BorderRadius.circular(20);

// Screens

TextStyle screenTitle = GoogleFonts.aBeeZee(
  fontSize: 26,
  letterSpacing: 1.5,
  fontWeight: FontWeight.w500,
);

TextStyle screenText = GoogleFonts.aBeeZee(
  fontSize: 16,
  letterSpacing: 1.2,
);

TextStyle heading2 = GoogleFonts.aBeeZee(
  fontSize: 16,
  letterSpacing: 1.4,
  fontWeight: FontWeight.w500,
);
