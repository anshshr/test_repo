// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wagwan_work_testing/create%20a%20circle/blocs/bloc/public_private_bloc.dart';
import 'package:wagwan_work_testing/create%20a%20circle/blocs/switchbloc/switch_bloc.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';
import 'package:wagwan_work_testing/themes/custom_buttons/large_sized_button.dart';

class FirstPage extends StatelessWidget {
  final PageController pageController;
   FirstPage({super.key, required this.pageController});

  String Titletext1 = 'Do you want to Create a Channel';

  String Titletext2 = "You're Creating a Channel";

  String Descriptiontext1 =
      'Big Organisations with multiple parts of the community, which have a need to create internal teams and groups.';

  String Descriptiontext2 =
      'Make multiple Small Circles under one Channel. You can manage and create multiple groups for people to converse and share based on topics and interests.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appColors.surface,
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        title: Text(
          'Create',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).appColors.onPrimary),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).appColors.surface,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'We eate small circles of friends, topical groups; share your lives with people who listen.',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Theme.of(context).appColors.onPrimary),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            // button for public and private
            BlocBuilder<PublicPrivateBloc, PublicPrivateState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    LargeSizedButton(
                      textcolor: state.props[0] as bool
                          ? Theme.of(context).appColors.primary
                          : null,
                      backgroundcolor: state.props[0] as bool
                          ? Theme.of(context).appColors.onPrimary
                          : null,
                      onPressed: () {
                        if (state.props[0] == false) {
                          context
                              .read<PublicPrivateBloc>()
                              .add(isPublicSelected());
                        } 
                      },
                      text: 'Public',
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    LargeSizedButton(
                        textcolor: state.props[1] == true
                            ? Theme.of(context).appColors.primary
                            : null,
                        backgroundcolor: state.props[1] == true
                            ? Theme.of(context).appColors.onPrimary
                            : null,
                        onPressed: () {
                          if (state.props[1] == false) {
                            context
                                .read<PublicPrivateBloc>()
                                .add(isPrivateSelected());
                          } 
                        },
                        text: 'Private'),
                  ],
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            // container for channel creation
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BlocBuilder<SwitchBloc, SwitchState>(
                builder: (context, state) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 60).copyWith(top: 20),
                    height: 325,
                    width: 600,
                    decoration: BoxDecoration(
                      color: state.props[0] as bool
                          ? Theme.of(context).appColors.accent3
                          : Theme.of(context).appColors.primary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          state.props[0] as bool ? Titletext2 : Titletext1,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(height: 1.3)
                              .copyWith(
                                  color: Theme.of(context).appColors.onPrimary),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          state.props[0] as bool
                              ? Descriptiontext2
                              : Descriptiontext1,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Theme.of(context).appColors.onPrimary),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        // toggle the switch
                        CupertinoSwitch(
                          value: state.props[0] as bool,
                          onChanged: (bool value) {
                            if (value == true) {
                              context.read<SwitchBloc>().add(switchDisabled());
                            } else {
                              context.read<SwitchBloc>().add(switchEnabled());
                            }
                          },
                          activeColor: Theme.of(context).appColors.tertiary,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),

            // button for next page
            Padding(
              padding: const EdgeInsets.only(top: 87),
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
    );
  }
}
