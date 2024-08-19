import 'package:flutter/material.dart';

TextTheme getTextTheme() {
      return const TextTheme(
            displayLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.w600,height: 1),
            titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w600,height: 1),
            titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,height: 1),
            titleSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,height: 1),
            bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,height: 1.4),
            bodyMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, height: 1.4),
            bodySmall: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, height: 1.4),
            labelLarge: TextStyle(fontSize: 12, fontWeight: FontWeight.w600,height: 1),
            labelSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,height: 1),
      );
}