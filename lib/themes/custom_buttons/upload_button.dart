import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

class UploadButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData iconData;

  const UploadButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).appColors;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: colorScheme.onSurface,
          width: 1,
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: colorScheme.onPrimary,
          backgroundColor: colorScheme.surface,
          minimumSize: const Size(0, 35),
          textStyle: textTheme.bodyLarge,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconData,
              color: colorScheme.onPrimary,
            ),
            const SizedBox(width: 5),
            Text(text),
          ],
        ),
      ),
    );
  }
}
