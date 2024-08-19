import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/blocs/theme_bloc/theme_event.dart';
import 'package:wagwan_work_testing/themes/blocs/theme_bloc/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(SystemThemeState(Brightness.light)) {
    on<SystemThemeChanged>(_onSystemThemeChanged);
    on<ToggleThemeEvent>(_onToggleTheme);
  }

  void _onSystemThemeChanged(
      SystemThemeChanged event, Emitter<ThemeState> emit) {
    emit(SystemThemeState(event.brightness));
  }

  void _onToggleTheme(ToggleThemeEvent event, Emitter<ThemeState> emit) {
    if (state is LightThemeState) {
      emit(DarkThemeState());
    } else if (state is DarkThemeState) {
      emit(LightThemeState());
    } else if (state is SystemThemeState) {
      if ((state as SystemThemeState).brightness == Brightness.light) {
        emit(DarkThemeState());
      } else {
        emit(LightThemeState());
      }
    }
  }
}
