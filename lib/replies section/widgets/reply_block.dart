import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/replies%20section/widgets/liked_by.dart';
import 'package:wagwan_work_testing/replies%20section/widgets/user_details.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

class ReplyBlock extends StatelessWidget {
  final String commnet;
  final String name;
  ReplyBlock({super.key, required this.commnet, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Commented person info

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10)
                    .copyWith(top: 10),
                child: UserDetails(
                    image_url:
                        'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/3f01db52-f675-48dc-9c91-f245d99f1486/d2nqynw-af694fd2-e1ba-4e9c-badb-630a48474599.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzNmMDFkYjUyLWY2NzUtNDhkYy05YzkxLWYyNDVkOTlmMTQ4NlwvZDJucXludy1hZjY5NGZkMi1lMWJhLTRlOWMtYmFkYi02MzBhNDg0NzQ1OTkuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.59_LN0TnrsDrVLS266jLpfZZfte_OZeNGkNQFJzgQCM',
                    name: 'sotaru jujustu',
                    time_posed: '11 days ago'),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_outline,
                    color: Theme.of(context).appColors.accent1,
                    size: 20,
                  )),
            ],
          ),

          // Comment of person
          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 5, left: 10),
            child: Text(commnet,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).appColors.onPrimary)),
          ),
          //liked by text
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: LikedBy(name: 'madhvik nemani '),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Divider(
              color: Theme.of(context).appColors.secondary,
            ),
          )
        ],
      ),
    );
  }
}
