import 'package:flutter/material.dart';
import 'package:trackcreditapp/utilities/constans/colors.dart';

class AppFloatingActionButtonTheme {
  AppFloatingActionButtonTheme._();
  //LightTheme
  static const lightFloatingActionButton = FloatingActionButtonThemeData(
    backgroundColor: AppColors.lightFloatingActionButton,
    sizeConstraints: BoxConstraints(minHeight: 70, minWidth: 70),
    iconSize: 30,
    shape: CircleBorder(),
  );

  //Dark Theme
  static const darkFloatingActionButton = FloatingActionButtonThemeData(
    backgroundColor: AppColors.darkFloatingActionButton,
    sizeConstraints: BoxConstraints(minHeight: 70, minWidth: 70),
    iconSize: 30,
    shape: CircleBorder(),
  );
}
