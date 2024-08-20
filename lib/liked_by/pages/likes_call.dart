import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/liked_by/pages/liked_list.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    darkTheme: AppTheme.dark,
    theme: AppTheme.light,
    themeMode: ThemeMode.dark,
    home: LikesCall(),
  ));
}

class LikesCall extends StatelessWidget {
  const LikesCall({super.key});

  //so basically when we tap on the likes details this function  will give a botttom sheet to show the details, so use this while calling the likes on tap
  Future peopleLiked(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Theme.of(context).appColors.primary,
      context: context,
      builder: (context) {
        return LikedList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
            onTap: () {
              peopleLiked(context);
            },
            child: Text('people liked')),
      ),
      body: Center(
        child: Text('Likes'),
      ),
    );
  }
}
