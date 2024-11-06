import 'package:flutter/material.dart';
import 'package:wagwan/core/themes/app_theme.dart';

class CreateChannelButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData icons;

  const CreateChannelButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icons,
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
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icons,
              color: Theme.of(context).appColors.onPrimary,
              size: 25,
            ),
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
