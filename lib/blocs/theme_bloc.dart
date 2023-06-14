import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_manager/settings/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ThemeEvent {}

class LightThemeEvent extends ThemeEvent {}

class DarkThemeEvent extends ThemeEvent {}

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(SharedPrefs().getTheme!) {
    on<LightThemeEvent>((event, emit) {
      emit(kLightTheme);
      SharedPrefs().setTheme = 'kLightTheme';

      // saveThemeToSP(kLightTheme);
    });
    on<DarkThemeEvent>((event, emit) {
      emit(kDarkTheme);
      SharedPrefs().setTheme = 'kDarkTheme';
      // saveThemeToSP(kDarkTheme);
    });
  }
}

class SharedPrefs {
  static late SharedPreferences _sharedPrefs;

  factory SharedPrefs() => SharedPrefs._internal();

  SharedPrefs._internal();

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  ThemeData? get getTheme {
    String? theme = _sharedPrefs.getString('savedTheme');
    return theme == null
        ? kLightTheme
        : theme == 'kLightTheme'
            ? kLightTheme
            : kDarkTheme;
  }

  set setTheme(String? value) {
    _sharedPrefs.setString(
        'savedTheme', value!); // Using selectedThemeIndex from constant
  }
}
