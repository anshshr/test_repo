import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/widgets/circle_item.dart';

class CirclesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'What topics do you like?',
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
              itemCount: 10,
              itemBuilder: (context, index) {
                return CircleItem(
                  imagePath:
                      'https://images.pexels.com/photos/3844788/pexels-photo-3844788.jpeg?cs=srgb&dl=pexels-didsss-3844788.jpg&fm=jpg', //random iamge url
                  title: 'just funny things of the world happening around me',
                  description:
                      'Small groups of different funny categories of things',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
