import 'package:flutter/material.dart';

/// Brand palette lifted from the Pabeda Ship Construction Company website
/// (https://pabedashipconstruction.vercel.app) — see css/style.css :root.
class PabedaColors {
  PabedaColors._();

  static const primary = Color(0xFFFF3E41);
  static const secondary = Color(0xFF51CFED);
  static const light = Color(0xFFF8F2F0);
  static const dark = Color(0xFF060315);
}

ThemeData buildPabedaTheme() {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: PabedaColors.primary,
    primary: PabedaColors.primary,
    secondary: PabedaColors.secondary,
    surface: Colors.white,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: PabedaColors.light,
    fontFamily: 'Roboto',
    appBarTheme: const AppBarTheme(
      backgroundColor: PabedaColors.dark,
      foregroundColor: Colors.white,
      centerTitle: false,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w700,
        color: PabedaColors.dark,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w700,
        color: PabedaColors.dark,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.w700,
        color: PabedaColors.dark,
      ),
      bodyMedium: TextStyle(color: Color(0xFF4A4750), height: 1.5),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: PabedaColors.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: PabedaColors.dark,
      selectedItemColor: PabedaColors.primary,
      unselectedItemColor: Colors.white70,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),
  );
}
