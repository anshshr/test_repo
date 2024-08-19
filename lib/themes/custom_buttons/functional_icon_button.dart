import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

class FunctionIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;

  const FunctionIconButton({
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
        size: 20,
        color: colorScheme.onPrimary,
      ),
    );
  }
}
