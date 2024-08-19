import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

class CreateCircleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final CircleAvatar circleAvatar;

  const CreateCircleButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.circleAvatar,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).appColors;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: colorScheme.secondary,
          width: 1,
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          minimumSize: const Size(0, 40),
          textStyle: textTheme.bodyLarge,
          padding: const EdgeInsets.only(right: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            circleAvatar,
            const SizedBox(width: 5),
            Text(text),
          ],
        ),
      ),
    );
  }
}
