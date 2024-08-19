import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wagwan_work_testing/create%20a%20circle/blocs/bloc/public_private_bloc.dart';
import 'package:wagwan_work_testing/create%20a%20circle/blocs/color_picker/color_picker_bloc.dart';
import 'package:wagwan_work_testing/create%20a%20circle/blocs/switchbloc/switch_bloc.dart';
import 'package:wagwan_work_testing/create%20a%20circle/first_page.dart';
import 'package:wagwan_work_testing/create%20a%20circle/foutrh_page.dart';
import 'package:wagwan_work_testing/create%20a%20circle/second_page.dart';
import 'package:wagwan_work_testing/create%20a%20circle/third_page.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => SwitchBloc(),
      ),
      BlocProvider(
        create: (context) => PublicPrivateBloc(),
      ),
      BlocProvider(create: (context) => ColorPickerBloc(),),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageNavigation(),
      theme: AppTheme.light,
    ),
  ));
}

class PageNavigation extends StatelessWidget {
  PageNavigation({super.key});
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      allowImplicitScrolling: true,
      children: [
        FirstPage(
          pageController: pageController,
        ),
        SecondPage(
          pageController: pageController,
        ),
        ThirdPage(pageController: pageController),
        FoutrhPage(pageController: pageController)
      ],
    );
  }
}
