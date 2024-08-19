// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    darkTheme: AppTheme.dark,
    theme: AppTheme.light,
    themeMode: ThemeMode.dark, // change this to light and dark theme 

  ));
}

