import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

class FriendChatText extends StatelessWidget {
  const FriendChatText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, top: 10),
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Container(
                color: Theme.of(context).appColors.primary,
                child: Text(
                  'Fine, how are you?',
                ),
              ),
            ),
            SizedBox(width: 10),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
