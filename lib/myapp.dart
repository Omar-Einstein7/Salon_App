import 'package:flutter/material.dart';
import 'package:salon_app/core/config/themes/app_theme.dart';
import 'package:salon_app/presentaion/home/screens/body_screen.dart';
import 'package:salon_app/presentaion/splash/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Salon app',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: BodyScreen(),
    );
  }
}
