// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:wagwan/core/themes/app_theme.dart';
import 'package:wagwan/modules/chat/widgets/friend_block.dart';

class FriendsList extends StatelessWidget {
  FriendsList({super.key});
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget squareDots() {
      return Padding(
        padding: const EdgeInsets.only(right: 3.0, top: 4),
        child: Container(
          height: 3,
          width: 3,
          decoration: BoxDecoration(
              color: Theme.of(context).appColors.tertiary,
              shape: BoxShape.rectangle),
        ),
      );
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.primary,
        border: Border.all(color: Theme.of(context).appColors.secondary),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  squareDots(),
                  squareDots(),
                  squareDots(),
                  squareDots(),
                  squareDots(),
                  squareDots(),
                  squareDots(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Center(
                child: Text('Chat',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        color: Theme.of(context).appColors.onPrimary)),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TextField(
                controller: searchController,
                textAlign: TextAlign.center,
                decoration:
                    const InputDecoration(hintText: 'Search for people'),
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 20,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.77,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return const FriendBlock();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
