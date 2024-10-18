import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:trackcreditapp/features/authentication/screens/loginpage/login_page.dart';
import 'package:trackcreditapp/utilities/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      home: const LoginPage(),
    );
  }
}
