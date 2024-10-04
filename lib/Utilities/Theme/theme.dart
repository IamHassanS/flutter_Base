import 'package:flutter/material.dart';
import 'theme.dart';
import 'package:my_first_flutter_app/Utilities/Theme/custom_themes/appbar_theme.dart';
import 'package:my_first_flutter_app/Utilities/Theme/custom_themes/bottom_sheet_theme.dart';
import 'package:my_first_flutter_app/Utilities/Theme/custom_themes/checkBox_theme.dart';
import 'package:my_first_flutter_app/Utilities/Theme/custom_themes/cip_theme.dart';
import 'package:my_first_flutter_app/Utilities/Theme/custom_themes/elevated_button_theme.dart';
import 'package:my_first_flutter_app/Utilities/Theme/custom_themes/outlined_button_theme.dart';
import 'package:my_first_flutter_app/Utilities/Theme/custom_themes/text_field_theme.dart';
import 'package:my_first_flutter_app/Utilities/Theme/custom_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: TChechBoxTheme.lightCheckBoxTheme,
    chipTheme: TChipTheme.lightChipTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFieldTheme.lightTextFieldTheme,
    textTheme: TTextTheme.lightTextTheme,

  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: TChechBoxTheme.darkCheckBoxTheme,
    chipTheme: TChipTheme.darkChipTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFieldTheme.darkTextFieldTheme,
    textTheme: TTextTheme.darkTextTheme,
  );
}