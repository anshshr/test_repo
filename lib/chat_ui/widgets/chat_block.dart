// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:wagwan_work_testing/themes/app_theme.dart';

class ChatBlock extends StatelessWidget {
  final VoidCallback? ontap;
  ChatBlock({
    Key? key,
    this.ontap,
  }) : super(key: key);
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // profile photo
              CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/3844788/pexels-photo-3844788.jpeg?cs=srgb&dl=pexels-didsss-3844788.jpg&fm=jpg'),
              ),
              // name and message
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          "Deepansh Singh",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: Theme.of(context).appColors.onPrimary),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Flexible(
                          child: Text(
                            'Hi, How are you?',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                  color: Theme.of(context).appColors.accent1,
                                ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // time and next arrow
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 5),
                child: Column(
                  children: [
                    Text(
                      '${date.hour}:${date.minute}'.padLeft(2, '0'),
                      style:
                          TextStyle(color: Theme.of(context).appColors.accent1)
                              .copyWith(
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .fontSize),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5.0, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        //this will only be seen when there is an unread message as instructed by madhvik for @ani
                      },
                      child: Container(
                        height: 4,
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    InkWell(
                      onTap: ontap,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Theme.of(context).appColors.onPrimary,
                        size: 25,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 1,
            color: Theme.of(context).appColors.primary,
          ),
        ],
      ),
    );
  }
}
