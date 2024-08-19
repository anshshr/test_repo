import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';
import 'package:wagwan_work_testing/themes/custom_buttons/large_sized_button.dart';

class FoutrhPage extends StatefulWidget {
  final PageController pageController;
  FoutrhPage({super.key, required this.pageController});

  @override
  State<FoutrhPage> createState() => _FoutrhPageState();
}

class _FoutrhPageState extends State<FoutrhPage> {
  TextEditingController instagramController = TextEditingController();

  TextEditingController LinkedinController = TextEditingController();

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: Column(
              children: <Widget>[
                Text('Preview',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Theme.of(context).appColors.accent1)),
                SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(
                      'https://media.istockphoto.com/id/1371301907/photo/friendly-young-man-wearing-denim-shirt.jpg?s=612x612&w=0&k=20&c=2KuVFEhKVdPstrmBo7m3pkaxiXkJMiJVUjelRxIcsoo='),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'NameTextfield',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Introtextfield(you can keep it simple)',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText : 'Instagram Profile',

                  ),
                      controller: instagramController,
                      obscureText: false,
                      keyboardType: TextInputType.text),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                    hintText : 'Linkedin Profile',

                    ),
                      controller: LinkedinController,
                      obscureText: false,
                      keyboardType: TextInputType.text),
                ),
                SizedBox(
                  height: 20,
                ),
                LargeSizedButton(onPressed: () {}, text: 'Create'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
