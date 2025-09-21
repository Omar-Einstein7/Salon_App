import 'package:flutter/material.dart';

class AppTheme {
  // Brand Colors
  static const Color primaryOrange = Color(0xFFFF9800);
  static const Color secondaryOrange = Color(0xFFFFB74D);
  static const Color darkBackground = Color(0xFF0E1015);
  static const Color darkSurface = Color(0xFF202126);
  
  static const LinearGradient mainGradient = LinearGradient(
    colors: [primaryOrange, Color.fromARGB(255, 255, 204, 128)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Typography
  static const TextStyle _baseTextStyle = TextStyle(
    fontFamily: 'Roboto',
    letterSpacing: 0.5,
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: primaryOrange,
    scaffoldBackgroundColor: Color(0xfffafafa),
    colorScheme: const ColorScheme.light(
      primary: primaryOrange,
      secondary: secondaryOrange,
      surface: Colors.white,
      error: Color(0xFFD32F2F),
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onBackground: Colors.black,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: Colors.black, size: 24),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
    ),
    cardTheme: CardThemeData(
      color: Colors.grey,
      elevation: 3,
      shadowColor: Colors.black.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: _baseTextStyle.copyWith(fontSize: 57, fontWeight: FontWeight.w400),
      displayMedium: _baseTextStyle.copyWith(fontSize: 45, fontWeight: FontWeight.w400),
      displaySmall: _baseTextStyle.copyWith(fontSize: 36, fontWeight: FontWeight.w400),
      headlineLarge: _baseTextStyle.copyWith(fontSize: 32, fontWeight: FontWeight.w600),
      headlineMedium: _baseTextStyle.copyWith(fontSize: 28, fontWeight: FontWeight.w600),
      headlineSmall: _baseTextStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w600),
      titleLarge: _baseTextStyle.copyWith(fontSize: 22, fontWeight: FontWeight.w600),
      titleMedium: _baseTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
      titleSmall: _baseTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
      bodyLarge: _baseTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
      bodyMedium: _baseTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
      bodySmall: _baseTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w400),
      labelLarge: _baseTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
      labelMedium: _baseTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w500),
      labelSmall: _baseTextStyle.copyWith(fontSize: 11, fontWeight: FontWeight.w500),
    ).apply(
      bodyColor: Colors.black87,
      displayColor: Colors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: primaryOrange,
    scaffoldBackgroundColor: darkBackground,
    colorScheme: ColorScheme.dark(
      primary: primaryOrange,
      secondary: secondaryOrange,
      surface: darkSurface,
      background: darkBackground,
      error: const Color(0xFFEF5350),
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.white,
      onBackground: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color.fromARGB(255, 24, 27, 34),
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white, size: 24),
      titleTextStyle: _baseTextStyle.copyWith(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
    ),
    cardTheme: CardThemeData(
      color: darkBackground,
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: _baseTextStyle.copyWith(fontSize: 57, fontWeight: FontWeight.w400),
      displayMedium: _baseTextStyle.copyWith(fontSize: 45, fontWeight: FontWeight.w400),
      displaySmall: _baseTextStyle.copyWith(fontSize: 36, fontWeight: FontWeight.w400),
      headlineLarge: _baseTextStyle.copyWith(fontSize: 32, fontWeight: FontWeight.w600),
      headlineMedium: _baseTextStyle.copyWith(fontSize: 28, fontWeight: FontWeight.w600),
      headlineSmall: _baseTextStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w600),
      titleLarge: _baseTextStyle.copyWith(fontSize: 22, fontWeight: FontWeight.w600),
      titleMedium: _baseTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
      titleSmall: _baseTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
      bodyLarge: _baseTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
      bodyMedium: _baseTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
      bodySmall: _baseTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w400),
      labelLarge: _baseTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
      labelMedium: _baseTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w500),
      labelSmall: _baseTextStyle.copyWith(fontSize: 11, fontWeight: FontWeight.w500),
    ).apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryOrange,
        foregroundColor: primaryOrange,
        elevation: 4,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
