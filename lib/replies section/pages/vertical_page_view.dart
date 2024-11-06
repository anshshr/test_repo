import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/replies%20section/pages/inital_page.dart';
import 'package:wagwan_work_testing/replies%20section/pages/replies.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: vertical_scroll(),
    darkTheme: AppTheme.dark,
    theme: AppTheme.light,
    themeMode: ThemeMode.dark,
  ));
}

class vertical_scroll extends StatelessWidget {
  vertical_scroll({super.key});
  final PageController pagecontroller = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pagecontroller,
      scrollDirection: Axis.vertical,
      children: [
        InitalPage(
          pageController: pagecontroller,
        ),
        Replies(
          pageController: pagecontroller,
        ),
      ],
    );
  }
}
