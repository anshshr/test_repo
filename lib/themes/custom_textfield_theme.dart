import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_colors_extension.dart';

InputDecorationTheme inputDecorationTheme(AppColorsExtension ace) {
  return InputDecorationTheme(
    hintStyle: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        height: 1.4,
        color: ace.accent1),
    fillColor: ace.surface,
    isCollapsed: true,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: ace.onSurface, // replace color scheme  with appColors
        width: 1,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: ace.error, // replace color scheme  with appColors
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: ace.secondary, // replace color scheme  with appColors
        width: 1,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: ace.secondary, // replace color scheme  with appColors
        width: 1,
      ),
    ),
    contentPadding:
        const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
  );
}
