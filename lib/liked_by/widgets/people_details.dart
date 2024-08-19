// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

class PeopleDetails extends StatelessWidget {
  final String image_url;
  final String name;
  final String description_text;

  const PeopleDetails({
    Key? key,
    required this.image_url,
    required this.name,
    required this.description_text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //profile
        CircleAvatar(radius: 25, backgroundImage: NetworkImage(image_url)),
        //name
        Padding(
          padding: const EdgeInsets.only(left: 5, top: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                fit: FlexFit.loose,
                child: Text(
                  name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Theme.of(context).appColors.onPrimary),
                ),
              ),
              //description text
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                    description_text,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).appColors.accent1,
                        ),
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
