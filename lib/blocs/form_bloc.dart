import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class FormEvent {}

class ShowFormEvent extends FormEvent {}

class AddFormEvent extends FormEvent {}

class HideFormEvent extends FormEvent {}

class ThemeBloc extends Bloc<FormEvent, bool> {
  ThemeBloc() : super(false) {
    on<ShowFormEvent>((event, emit) => emit(true));
    on<HideFormEvent>((event, emit) => emit(false));
  }
}


