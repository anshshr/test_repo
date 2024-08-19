import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/icons/default_pfp.jpg'),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'John Doe',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: context.theme.appColors.onPrimary,
                  ),
            ),
            Text(
              'hello there',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: context.theme.appColors.accent1,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
