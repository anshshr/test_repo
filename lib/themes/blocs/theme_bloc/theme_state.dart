import 'dart:ui';

abstract class ThemeState {}

class LightThemeState extends ThemeState {}

class DarkThemeState extends ThemeState {}

class SystemThemeState extends ThemeState {
  final Brightness brightness;

  SystemThemeState(this.brightness);
}
