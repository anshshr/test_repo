import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wagwan_work_testing/create%20profile%20of%20cirlce(new)/bloc/profile_tab_bloc.dart';
import 'package:wagwan_work_testing/create%20profile%20of%20cirlce(new)/main_drag_sheet.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ProfileTabBloc(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.dark,
      theme: AppTheme.light,
      themeMode: ThemeMode.dark,
      home: BottomSheet(),
    ),
  ));
}

class BottomSheet extends StatelessWidget {
  const BottomSheet({super.key});

  Future<void> show_bottom_sheet(BuildContext context) async {
    await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return SingleChildScrollView(child: MainDragSheet());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: TextButton(
              onPressed: () async {
                await show_bottom_sheet(context);
              },
              child: Text(
                  'Bottom Sheet')), // on tapping this text the bottom sheet gets apperared and contains cicle profile data us this on tap function wherever you wnat
          automaticallyImplyLeading: false),
    );
  }
}
