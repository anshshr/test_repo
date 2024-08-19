import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

class SavedView extends StatelessWidget {
  const SavedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: 40,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/icons/default_pfp.jpg'),
                    ),
                    const SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Anonymous',
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: context.theme.appColors.onPrimary,
                            )),
                        Text('1h ago',
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: context.theme.appColors.accent1,
                            )),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Caption',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: context.theme.appColors.onPrimary,
                      )),
                ),
                const SizedBox(height: 5),
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.network(
                    'https://w0.peakpx.com/wallpaper/40/935/HD-wallpaper-nature-beautiful.jpg'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
