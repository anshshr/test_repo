import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

class SmallestSizedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const SmallestSizedButton({
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
        textStyle: Theme.of(context).textTheme.labelLarge,
        backgroundColor: colorScheme.secondary,
        foregroundColor: colorScheme.onPrimary,
        minimumSize: const Size(0, 24),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(text),
      ),
    );
  }
}
