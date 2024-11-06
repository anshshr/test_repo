import 'package:flutter/material.dart';
import 'package:wagwan/core/themes/app_theme.dart';

class HomeButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final CircleAvatar circleAvatar;

  const HomeButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.circleAvatar,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).appColors;
    final textTheme = Theme.of(context).textTheme;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: colorScheme.secondary,
        foregroundColor: colorScheme.secondary,
        minimumSize: const Size(0, 40),
        textStyle: textTheme.bodyLarge,
        padding: const EdgeInsets.only(right: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(right: 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            circleAvatar,
            const SizedBox(width: 5),
            Text(
              text,
              style:
                  textTheme.titleSmall!.copyWith(color: colorScheme.onPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
