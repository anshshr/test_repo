import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Switches(
                context,
                'Notifications',
                false,
                Icons.notifications,
                () {},
              ),
              Divider(
                color: context.theme.appColors.accent1.withOpacity(0.5),
                thickness: 1,
              ),
              Switches(
                context,
                'Leave Cirlce',
                false,
                Icons.logout,
                () {
                  
                },
              ),
              Divider(
                color: context.theme.appColors.accent1.withOpacity(0.5),
                thickness: 1,
              ),
            ],
          );
        }
  }

class Switches extends StatelessWidget {
  final String text;
  final bool value;
  final IconData icon;
  final VoidCallback onPressed;

  const Switches(
      BuildContext context, this.text, this.value, this.icon, this.onPressed,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: [
          Text(text,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: context.theme.appColors.onPrimary,
                  )),
          const Spacer(),
          IconButton(
            onPressed: onPressed,
            icon: Icon(icon, color: context.theme.appColors.onPrimary),
          )
        ],
      ),
    );
  }
}

 