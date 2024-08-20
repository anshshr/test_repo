import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/liked_by/widgets/people_details.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

class LikedList extends StatelessWidget {
  const LikedList({super.key});

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
            shape: BoxShape.rectangle,
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              squareDots(),
              squareDots(),
              squareDots(),
              squareDots(),
              squareDots(),
              squareDots(),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 153,
              ),
              Text(
                'Likes',
                style: TextStyle(
                  color: Theme.of(context).appColors.onPrimary,
                  fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                ),
              ),
              SizedBox(
                width: 90,
              ),

              // no of likes
              Text(
                '20 likes',
                style: TextStyle(
                  color: Theme.of(context).appColors.accent1,
                  fontSize: Theme.of(context).textTheme.labelLarge!.fontSize,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 15,
            itemBuilder: (context, index) {
              return PeopleDetails(
                image_url:
                    'https://media.istockphoto.com/id/1332100919/vector/man-icon-black-icon-person-symbol.jpg?s=612x612&w=0&k=20&c=AVVJkvxQQCuBhawHrUhDRTCeNQ3Jgt0K1tXjJsFy1eg=',
                name: 'Adith Reddy ',
                description_text: 'Forbes 30 under 30',
              );
            },
          ),
        ],
      ),
    );
  }
}
