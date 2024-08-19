import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wagwan_work_testing/create%20profile%20of%20cirlce(new)/bloc/profile_tab_bloc.dart';
import 'package:wagwan_work_testing/create%20profile%20of%20cirlce(new)/bloc/profile_tab_event.dart';
import 'package:wagwan_work_testing/create%20profile%20of%20cirlce(new)/bloc/profile_tab_state.dart';
import 'package:wagwan_work_testing/create%20profile%20of%20cirlce(new)/custom_widgets/custom_tab_element.dart';
import 'package:wagwan_work_testing/create%20profile%20of%20cirlce(new)/pages/profile_headline/headline.dart';
import 'package:wagwan_work_testing/create%20profile%20of%20cirlce(new)/pages/tabs/media.dart';
import 'package:wagwan_work_testing/create%20profile%20of%20cirlce(new)/pages/tabs/people.dart';
import 'package:wagwan_work_testing/create%20profile%20of%20cirlce(new)/pages/tabs/saved.dart';
import 'package:wagwan_work_testing/create%20profile%20of%20cirlce(new)/pages/tabs/settings.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

class MainDragSheet extends StatefulWidget {
  const MainDragSheet({
    super.key,
  });

  @override
  State<MainDragSheet> createState() => _MainDragSheetState();
}

class _MainDragSheetState extends State<MainDragSheet>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileTabBloc, ProfileTabState>(
      builder: (context, state) {
        int selectedIndex = (state as TabState).selectedIndex;
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
          child: Scaffold(
            backgroundColor: Theme.of(context).appColors.primary,
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Headline(),
                  SizedBox(
                    height: 20,
                  ),
                  tabs(context, selectedIndex),
                  SizedBox(
                    height: 10,
                  ),
                  buildTabContent(selectedIndex)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildTabContent(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return People();
      case 1:
        return Media();
      case 2:
        return Saved();
      case 3:
        return Settings();

      default:
        return People();
    }
  }

  void _onTabSelected(BuildContext context, int index) {
    context.read<ProfileTabBloc>().add(TabSelected(index));
  }

  SingleChildScrollView tabs(BuildContext context, int selectedindex) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CustomTabElement(
            iconData: Icons.groups_rounded,
            text: 'People',
            isSelected: selectedindex == 0,
            onTap: () {
              setState(() {
                _onTabSelected(context, 0);
              });
            },
          ),
          CustomTabElement(
            iconData: Icons.perm_media,
            text: 'Media',
            isSelected: selectedindex == 1,
            onTap: () {
              setState(() {
                _onTabSelected(context, 1);
              });
            },
          ),
          CustomTabElement(
            iconData: Icons.downloading,
            text: 'Saved',
            isSelected: selectedindex == 2,
            onTap: () {
              setState(() {
                _onTabSelected(context, 2);
              });
            },
          ),
          CustomTabElement(
            iconData: Icons.settings,
            text: 'Settings',
            isSelected: selectedindex == 3,
            onTap: () {
              setState(() {
                _onTabSelected(context, 3);
              });
            },
          ),
        ],
      ),
    );
  }

}
