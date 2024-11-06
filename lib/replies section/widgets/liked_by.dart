// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:wagwan_work_testing/themes/app_theme.dart';

class LikedBy extends StatelessWidget {
  String name;
  LikedBy({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Liked By:  ',
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: Theme.of(context).appColors.onPrimary),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 2),
          child: Icon(
            Icons.favorite,
            size: 10,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Text(
              name ,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: Theme.of(context).appColors.onPrimary),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
