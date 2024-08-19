import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

class Headline extends StatelessWidget {
  const Headline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 15, left: 10),
          child: CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu2whjzwoBz71waeE07wh1L_sfjpdm6IIf7g&s'),
          ),
        ),
        const SizedBox(width: 7),
        Align(
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Doe',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: context.theme.appColors.onPrimary,
                    ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                'hello there',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: context.theme.appColors.accent1,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
