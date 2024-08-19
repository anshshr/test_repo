import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

class GalleryView extends StatelessWidget {
  const GalleryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).appColors.onPrimary,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        child: Image.network(
          'https://live.staticflickr.com/65535/50344935577_1aa9d7bb4c_o.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
