import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/widgets/friends_item.dart';

class FriendsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: TextField(
            decoration: InputDecoration(
                hintText: 'Search for your Inner Circle',
                fillColor: Colors.grey[200],
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.black87, width: 1)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none),
                contentPadding: EdgeInsets.symmetric(horizontal: 2)),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return FriendItem(
              name: 'name',
              description:
                  'Small groups of different funny categories of things',
              imageurl:
                  'https://images.pexels.com/photos/3844788/pexels-photo-3844788.jpeg?cs=srgb&dl=pexels-didsss-3844788.jpg&fm=jpg', //random image url from internet
            );
          },
        ))
      ],
    );
  }
}
