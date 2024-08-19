// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

class UserDetails extends StatelessWidget {
  final String image_url;
  final String name;
  final String time_posed;

  const UserDetails({
    Key? key,
    required this.image_url,
    required this.name,
    required this.time_posed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //profile photo of post owner
        CircleAvatar(radius: 25, backgroundImage: NetworkImage(
            // 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/3f01db52-f675-48dc-9c91-f245d99f1486/d2nqynw-af694fd2-e1ba-4e9c-badb-630a48474599.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzNmMDFkYjUyLWY2NzUtNDhkYy05YzkxLWYyNDVkOTlmMTQ4NlwvZDJucXludy1hZjY5NGZkMi1lMWJhLTRlOWMtYmFkYi02MzBhNDg0NzQ1OTkuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.59_LN0TnrsDrVLS266jLpfZZfte_OZeNGkNQFJzgQCM'),
            image_url)),
        //name of post owner
        Padding(
          padding: const EdgeInsets.only(left: 5, top: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                // 'Ansh Shrivastav',
                name,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Theme.of(context).appColors.onPrimary),
              ),
              //time of post
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Text(
                  // '12 days ago',
                  time_posed,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).appColors.accent1,
                      ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
