import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:wagwan/core/themes/app_theme.dart';
import 'package:wagwan/core/themes/custom_buttons/large_sized_button.dart';

Future<Color?> pickChannelColor(BuildContext context) async {
  Color selectedColor = Theme.of(context).appColors.tertiary;

  return await showModalBottomSheet<Color>(
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Select color',
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                    color: Theme.of(context).appColors.onPrimary,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ColorPicker(
              pickerAreaHeightPercent: 0.5,
              colorPickerWidth: 300,
              paletteType: PaletteType.hsv,
              pickerColor: selectedColor,
              onColorChanged: (value) {
                selectedColor = value;
              },
              displayThumbColor: true,
            ),
            const SizedBox(
              height: 10,
            ),
            LargeSizedButton(
              onPressed: () {
                Navigator.pop(context, selectedColor);
              },
              text: 'Select',
            ),
          ],
        ),
      );
    },
  );
}
