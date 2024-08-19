import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

//TODO 1: Create a custom tab element widget
// SingleChildScrollView(
//   scrollDirection: Axis.horizontal,
//   child: Row(
//     children: [
//       CustomTabElement(
//         iconData: Icons.home,
//         text: 'Home',
//         isSelected: true,
//         onTap: () {},
//       ),
// )

class CustomTabElement extends StatelessWidget {
  final IconData iconData;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomTabElement({
    required this.iconData,
    required this.text,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: isSelected
                ? context.theme.appColors.primary
                : Colors.transparent,
            border: Border.all(
              color: isSelected
                  ? context.theme.appColors.accent1
                  : Colors.transparent,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
            child: Row(
              children: [
                Icon(
                  iconData,
                  size: 22,
                  color: isSelected
                      ? context.theme.appColors.onPrimary
                      : context.theme.appColors.accent1,
                ),
                const SizedBox(width: 5),
                Text(text,
                    style: isSelected == true
                        ? Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: context.theme.appColors.onPrimary)
                        : Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: context.theme.appColors.accent1,
                            )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
