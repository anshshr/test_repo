import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/chat_ui/pages/chat_page.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';
import 'package:wagwan_work_testing/themes/custom_buttons/medium_sized_button.dart';

class FriendBlock extends StatelessWidget {
  const FriendBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.surface,
        border: Border.all(color: Theme.of(context).appColors.secondary),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          //circle avatar
          CircleAvatar(
            radius: 45,
            backgroundColor: Colors.amber,
            backgroundImage: NetworkImage(
                'https://images.pexels.com/photos/3844788/pexels-photo-3844788.jpeg?cs=srgb&dl=pexels-didsss-3844788.jpg&fm=jpg'),
          ),
          SizedBox(
            height: 10,
          ),

          //name
          Text('Tester 01',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).appColors.onPrimary)),
          SizedBox(
            height: 12,
          ),

          //chat button
          MediumSizedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(
                        name: 'Deepnader Singh',
                        imageurl:
                            'https://media.istockphoto.com/id/1332100919/vector/man-icon-black-icon-person-symbol.jpg?s=612x612&w=0&k=20&c=AVVJkvxQQCuBhawHrUhDRTCeNQ3Jgt0K1tXjJsFy1eg='),
                  ));
            },
            text: 'Message',
          )
        ],
      ),
    );
  }
}
