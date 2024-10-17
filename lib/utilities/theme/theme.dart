//Light Theme
import 'package:flutter/material.dart';
import 'package:trackcreditapp/utilities/theme/custom_themes.dart/appbar.dart';
import 'package:trackcreditapp/utilities/theme/custom_themes.dart/elevated_button.dart';
import 'package:trackcreditapp/utilities/theme/custom_themes.dart/text.dart';
import 'package:trackcreditapp/utilities/theme/custom_themes.dart/text_field.dart';

//Light Theme
class AppThemes {
  AppThemes._();
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: AppTextTheme.ligthTextTheme,
      appBarTheme: AppAppBarTheme.lightAppBarTheme,
      elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
      inputDecorationTheme: AppTextFieldTheme.lightTextFieldTheme);

  //Dark Theme
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: const Color.fromARGB(5, 0, 0, 0),
      textTheme: AppTextTheme.darkTextTheme,
      appBarTheme: AppAppBarTheme.darkAppBarTheme,
      elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
      inputDecorationTheme: AppTextFieldTheme.darkTextFieldTheme);
}
