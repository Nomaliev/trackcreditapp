import 'package:flutter/material.dart';

class AppElevatedButtonTheme {
  AppElevatedButtonTheme._();
  //Light Theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: const Color(0xff464646),
    disabledForegroundColor: Colors.grey,
    disabledBackgroundColor: Colors.grey,
    padding: const EdgeInsets.symmetric(vertical: 24),
    textStyle: const TextStyle(
        fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
  ));

  //Dark Theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.white,
    backgroundColor: const Color(0xffE6E6E6),
    disabledForegroundColor: Colors.grey,
    disabledBackgroundColor: Colors.grey,
    padding: const EdgeInsets.symmetric(vertical: 24),
    textStyle: const TextStyle(
        fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
  ));
}
