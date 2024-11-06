import 'package:flutter/material.dart';
import 'package:wagwan/core/themes/app_theme.dart';

class ChannelButtons extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;

  const ChannelButtons({
    super.key,
    required this.text,
    required this.onpressed
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).appColors.secondary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Theme.of(context).appColors.onPrimary),
        )),
      ),
    );
  }
}
