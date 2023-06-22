import 'package:flutter/material.dart';
class AppTheme {
  static final kDarkTheme = ThemeData().copyWith(
    appBarTheme: const AppBarTheme(color: Color(0xFF161618)),
    colorScheme: const ColorScheme(
        primary: Colors.white,
        onPrimary: Colors.black,
        secondary: Colors.black,
        onSecondary: Colors.grey,
        error: Colors.red,
        onError: Colors.white,
        background: Color(0xFF1E1F25),
        onBackground: Colors.white,
        brightness: Brightness.dark,
        onSurface: Colors.white,
        surface: Colors.black),
    iconTheme: const IconThemeData(color: Colors.white),
    useMaterial3: true,
  );

  static final kLightTheme = ThemeData().copyWith(
    appBarTheme: const AppBarTheme(color: Color(0xFFF7F6F2)),
    colorScheme: const ColorScheme(
        primary: Color(0xFF007AFF),
        onPrimary: Colors.white,
        secondary: Colors.grey,
        onSecondary: Colors.black,
        error: Colors.red,
        onError: Colors.white,
        background: Colors.white,
        onBackground: Colors.black,
        brightness: Brightness.light,
        onSurface: Colors.black,
        surface: Colors.white),
    iconTheme: const IconThemeData(color: Colors.black),
    useMaterial3: true,
  );
}