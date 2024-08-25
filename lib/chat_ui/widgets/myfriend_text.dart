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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).appColors.surface,
                    border: Border.all(
                        color: Theme.of(context).appColors.secondary),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Fine, how are you? and how is everythi goig just went to the gym and the rest is fine and we can now move on',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(context).appColors.onPrimary,
                            )),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  'https://cdn-icons-png.flaticon.com/512/3577/3577402.png'),
              backgroundColor: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}
