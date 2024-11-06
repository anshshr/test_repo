import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

class GifIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;

  const GifIconButton({
    super.key,
    required this.onPressed,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).appColors;

    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        iconData,
        size: 34,
        color: colorScheme.onPrimary,
      ),
    );
  }
}
