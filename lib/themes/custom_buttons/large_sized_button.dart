import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

class LargeSizedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final CircleAvatar? circleAvatar;
  final Color? backgroundcolor;
  final Color? textcolor;

  const LargeSizedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.circleAvatar,
    this.backgroundcolor,
    this.textcolor

  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).appColors;
    final textTheme = Theme.of(context).textTheme;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundcolor ?? colorScheme.secondary,
        foregroundColor: colorScheme.onPrimary,
        minimumSize: const Size(0, 40),
        textStyle: textTheme.titleMedium,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          circleAvatar != null ? circleAvatar! : Container(),
          const SizedBox(width: 5),
          Text(text, style: TextStyle(color: textcolor)),
        ],
      ),
    );
  }
}
