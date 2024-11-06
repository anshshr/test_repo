import 'package:flutter/material.dart';

TextTheme getTextTheme() {
      return const TextTheme(
            displayLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.w600,height: 1, letterSpacing: 0.6,fontFamily: 'PP Mori'),
            titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w600,height: 1.4,letterSpacing: 0.6, fontFamily: 'PP Mori'),
            titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,height: 1.4, letterSpacing: 0.4,fontFamily: 'PP Mori'),
            titleSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,height: 1.4, letterSpacing: 0.4,fontFamily: 'PP Mori'),
            bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,height: 1.4,letterSpacing: 0.3,fontFamily: 'PP Mori'),
            bodyMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, height: 1.5, letterSpacing: 0.3, fontFamily: 'PP Mori'),
            bodySmall: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, height: 1.5, letterSpacing: 0.3,fontFamily: 'PP Mori'),
            labelLarge: TextStyle(fontSize: 12, fontWeight: FontWeight.w600,height: 1.3, letterSpacing: 0.2, fontFamily: 'PP Mori'),
            labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w600,height: 1.3, letterSpacing: 0.2, fontFamily: 'PP Mori'),
      );
}