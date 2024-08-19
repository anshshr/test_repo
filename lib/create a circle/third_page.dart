import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';
import 'package:wagwan_work_testing/themes/custom_buttons/large_sized_button.dart';

class ThirdPage extends StatefulWidget {
  final PageController pageController;

  ThirdPage({super.key, required this.pageController});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appColors.surface,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              if (widget.pageController.hasClients) {
                widget.pageController.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text(
          'Create a Circle',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).appColors.onPrimary),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).appColors.surface,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 47).copyWith(top: 20),
            child: Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                    'https://miro.medium.com/v2/resize:fit:640/format:webp/1*1X5Pq4k6KVsj_ivXOSYIow.jpeg'),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          LargeSizedButton(
            onPressed: () {
            Future<XFile?> file = ImagePicker().pickImage(source: ImageSource.gallery);
            },
            text: 'Choose an Image',
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'or',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).appColors.onPrimary),
          ),
          SizedBox(
            height: 10,
          ),
          LargeSizedButton(
            onPressed: () {},
            text: 'GIF',
          ),
          SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.center,
            child: InkWell(
              child: Icon(
                Icons.arrow_forward,
                size: 30,
                color: Theme.of(context).appColors.onPrimary,
              ),
              onTap: () {
                if (widget.pageController.hasClients) {
                  widget.pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
