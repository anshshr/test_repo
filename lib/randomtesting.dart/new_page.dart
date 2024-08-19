import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

class NewPage extends StatefulWidget  {
   NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).appColors.secondary),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.89,
        width: MediaQuery.of(context).size.width,
        child: TabBar(
          tabs: [
            Text('people'),
            Text('settings'),
            Text('media'),
            Text('saved')
          ],
        ));
  }
}
