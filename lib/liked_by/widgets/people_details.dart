import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

class PeopleDetails extends StatelessWidget {
  final String image_url;
  final String name;
  final String? description_text;

  const PeopleDetails({
    Key? key,
    required this.image_url,
    required this.name,
    required this.description_text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      child: Row(
        crossAxisAlignment:
            description_text != null && description_text!.isNotEmpty
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
        children: <Widget>[
          // Profile picture
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(image_url),
          ),
          // Name and description
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment:
                  description_text != null && description_text!.isNotEmpty
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Theme.of(context).appColors.onPrimary),
                ),
                description_text != null && description_text!.isNotEmpty
                    ? Text(
                        description_text!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).appColors.accent1),
                      )
                    : SizedBox(
                        height: 10,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
