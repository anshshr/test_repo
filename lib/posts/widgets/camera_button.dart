import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

class CameraButton extends StatelessWidget {
  const CameraButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(35),
        ),
        border: Border.all(
          width: 10,
          color: Theme.of(context).appColors.onPrimary.withOpacity(.5),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).appColors.onPrimary,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
      ),
    );
  }
}
