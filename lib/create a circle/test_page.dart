import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wagwan_work_testing/create%20a%20circle/blocs/bloc/public_private_bloc.dart';
import 'package:wagwan_work_testing/create%20a%20circle/blocs/color_picker/color_picker_bloc.dart';
import 'package:wagwan_work_testing/create%20a%20circle/blocs/switchbloc/switch_bloc.dart';
import 'package:wagwan_work_testing/create%20a%20circle/page_navigation.dart';
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
      BlocProvider(
        create: (context) => ColorPickerBloc(),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TestPage(),
      theme: AppTheme.dark,
    ),
  ));
}

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.holiday_village),
          label: 'Home',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.holiday_village), label: 'byr'),
        BottomNavigationBarItem(icon: Icon(Icons.holiday_village), label: 'so'),
      ]),
      appBar: AppBar(
        title: Text('just for test'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PageNavigation()));
            },
            child: Text('go to create a circle')),
      ),
    );
  }
}
