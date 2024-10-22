import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackcreditapp/features/task/screens/home.dart';
import 'package:trackcreditapp/utilities/general_bindings.dart';
import 'package:trackcreditapp/utilities/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),
      themeMode: ThemeMode.system,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      home: const HomePage(),
    );
  }
}
