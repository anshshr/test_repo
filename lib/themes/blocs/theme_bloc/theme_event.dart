import 'dart:ui';

abstract class ThemeEvent {}

class ToggleThemeEvent extends ThemeEvent {}

class SystemThemeChanged extends ThemeEvent {
  final Brightness brightness;

  SystemThemeChanged(this.brightness);
}
