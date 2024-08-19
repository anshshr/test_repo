import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/replies%20section/pages/inital_page.dart';
import 'package:wagwan_work_testing/replies%20section/pages/replies.dart';
import 'package:wagwan_work_testing/themes/text_theme.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: vertical_scroll(),
    theme: ThemeData.dark().copyWith(textTheme: getTextTheme()),
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
        Replies(pageController: pagecontroller,
        ),
      ],
    );
  }
}
