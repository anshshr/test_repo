import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_colors.dart';
import 'package:wagwan_work_testing/themes/custom_textfield_theme.dart';
import 'package:wagwan_work_testing/themes/text_theme.dart';

import 'app_colors_extension.dart';

class AppTheme {
  static final light = ThemeData.light().copyWith(
    extensions: [
      lightAppColors,
    ],
    textTheme: getTextTheme(),
    inputDecorationTheme: inputDecorationTheme(lightAppColors),
  );

  static final dark = ThemeData.dark().copyWith(
    extensions: [
      darkAppColors,
    ],
    textTheme: getTextTheme(),
    inputDecorationTheme: inputDecorationTheme(darkAppColors),
  );
}

extension AppThemeExtension on ThemeData {
  /// Usage example: Theme.of(context).appColors;
  AppColorsExtension get appColors =>
      extension<AppColorsExtension>() ?? darkAppColors;
}

/// A more convenient way to get `ThemeData` from the `BuildContext`.
///
/// Usage example: `context.theme`.
extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
}
