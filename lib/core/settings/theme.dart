import 'package:flutter/material.dart';

final kDarkTheme = ThemeData().copyWith(
  appBarTheme: const AppBarTheme(color: Colors.black38),
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
final kLightTheme = ThemeData().copyWith(
  appBarTheme: const AppBarTheme(color: Colors.limeAccent),
  colorScheme: const ColorScheme(
      primary: Colors.black,
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
