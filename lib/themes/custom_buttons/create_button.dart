import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

class CreateButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;

  const CreateButton({
    super.key,
    required this.onPressed,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).appColors;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.secondary,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: colorScheme.onPrimary,
          minimumSize: const Size(0, 40),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: onPressed,
        icon: Icon(iconData),
      ),
    );
  }
}
