import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Fixed Height Bottom Sheet Example')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Show Bottom Sheet'),
          ),
        ),
      ),
    );
  }
}
