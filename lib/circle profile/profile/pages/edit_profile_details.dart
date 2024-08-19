import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';
import 'package:wagwan_work_testing/themes/custom_buttons/medium_sized_button.dart';


class EditProfileDetails extends StatelessWidget {
  const EditProfileDetails({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.appColors.surface,
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Edit Account',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: context.theme.appColors.onPrimary)),
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/icons/default_pfp.jpg'),
            ),
            Text('Edit Image',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: context.theme.appColors.tertiary)),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('Name',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: context.theme.appColors.onPrimary,
                      )),
            ),
            CustomTextfield(
              controller: controller,
              obscureText: false,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('Introduction',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: context.theme.appColors.onPrimary,
                      )),
            ),
            CustomTextfield(
              controller: controller,
              obscureText: false,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            MediumSizedButton(
              onPressed: () {},
              text: 'Confirm',
            ),
          ],
        ),
      ),
    );
  }
}
