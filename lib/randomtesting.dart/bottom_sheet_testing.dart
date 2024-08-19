import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/randomtesting.dart/new_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: t1(),
  ));
}

class t1 extends StatelessWidget {
  const t1({super.key});
  Future<void> open_bottom_sheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return NewPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('testing the widgets'),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () async {
                await open_bottom_sheet(context);
              },
              child: Text('open bottom sheet')),
        ));
  }
}
