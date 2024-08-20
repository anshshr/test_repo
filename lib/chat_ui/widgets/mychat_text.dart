import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

class MyChatText extends StatelessWidget {
  const MyChatText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize
              .min, // Ensures the Row takes only as much space as needed
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.amber,
            ),
            SizedBox(width: 10), // Add space between the avatar and text
            Flexible(
              child: Container(
                color: Theme.of(context).appColors.primary,
                child: Text(
                  'Hello',
                  style: TextStyle(
                      color: Theme.of(context).appColors.onPrimary,
                      fontSize:
                          Theme.of(context).textTheme.bodyLarge!.fontSize),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
