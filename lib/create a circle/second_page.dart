import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:wagwan_work_testing/create%20a%20circle/blocs/color_picker/color_picker_bloc.dart';
import 'package:wagwan_work_testing/create%20a%20circle/blocs/color_picker/color_picker_event.dart';
import 'package:wagwan_work_testing/create%20a%20circle/blocs/color_picker/color_picker_state.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';
import 'package:wagwan_work_testing/themes/custom_buttons/large_sized_button.dart';

class SecondPage extends StatelessWidget {
  final PageController pageController;
  SecondPage({super.key, required this.pageController});

  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController introductionController = TextEditingController();

  TextEditingController tagsController = TextEditingController();

  bool obscurePassword = true;

  List tags = [];

  @override
  Widget build(BuildContext context) {
    Future<void> pick_colour(BuildContext context) async {
      await showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Select color',
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodyLarge!.fontSize,
                        color: context.theme.appColors.onPrimary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocBuilder<ColorPickerBloc, ColorPickerState>(
                  builder: (context, state) {
                    Color currentColor = state is ColorUpdated
                        ? state.updatedColor
                        : Theme.of(context).appColors.tertiary;
                    return ColorPicker(
                      pickerAreaHeightPercent: 0.5,
                      colorPickerWidth: 300,
                      paletteType: PaletteType.hsv,
                      pickerColor: currentColor,
                      onColorChanged: (value) {
                        context
                            .read<ColorPickerBloc>()
                            .add(ColorSelected(value));
                      },
                      displayThumbColor: true,
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                LargeSizedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: 'Select')
              ],
            ),
          );
        },
      );
    }

    print('complte ui is building');
    return Scaffold(
      backgroundColor: Theme.of(context).appColors.surface,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              if (pageController.hasClients) {
                pageController.previousPage(
                  duration: Duration(milliseconds: 400),
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
          padding: const EdgeInsets.only(top: 20).copyWith(left: 15, right: 15),
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  'Name',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).appColors.onPrimary),
                ),
                SizedBox(
                  height: 7,
                ),
                TextField(
                    controller: nameController,
                    obscureText: false,
                    keyboardType: TextInputType.text),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Passcode',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).appColors.onPrimary),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: passwordController,
                  obscureText: obscurePassword,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    suffixIcon: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return IconButton(
                          onPressed: () {
                            obscurePassword = !obscurePassword;
                          },
                          icon: Padding(
                            padding: const EdgeInsets.only(right: 14.0),
                            child: Icon(
                              obscurePassword
                                  ? CupertinoIcons.eye
                                  : CupertinoIcons.eye_slash,
                              color: Theme.of(context).colorScheme.error,
                              size: 16,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Introduction',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).appColors.onPrimary),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration:
                        InputDecoration(hintText: 'You can keep it simple'),
                    controller: introductionController,
                    obscureText: false,
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Tags',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).appColors.onPrimary),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Try being Descriptive😊',
                    ),
                    controller: tagsController,
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    onSubmitted: (value) {
                      tags.add(value);
                      tagsController.clear();
                      print('starting to build');

                      (context as Element).markNeedsBuild();
                    }),
                Container(
                  height: 60,
                  child: Flexible(
                    fit: FlexFit.loose,
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: tags.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Chip(label: tags[index]),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 40,
                ),
                Align(
                    alignment: Alignment.center,
                    child: BlocBuilder<ColorPickerBloc, ColorPickerState>(
                      builder: (context, state) {
                        Color currentColor = state is ColorUpdated
                            ? (state).updatedColor
                            : Theme.of(context).appColors.tertiary;
                        return LargeSizedButton(
                            onPressed: () {
                              pick_colour(context);
                            },
                            text: 'Pick a Colour',
                            circleAvatar:
                                CircleAvatar(backgroundColor: currentColor));
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 140),
                  child: Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      child: Icon(
                        Icons.arrow_forward,
                        size: 30,
                        color: Theme.of(context).appColors.onPrimary,
                      ),
                      onTap: () {
                        if (pageController.hasClients) {
                          pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
