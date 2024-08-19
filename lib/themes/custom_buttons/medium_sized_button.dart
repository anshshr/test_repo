import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

class MediumSizedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const MediumSizedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).appColors;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: colorScheme.onPrimary,
        backgroundColor: colorScheme.onSurface,
        minimumSize: const Size(0, 30),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: context.theme.appColors.onPrimary),
        ),
      ),
    );
  }
}
