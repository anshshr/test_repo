import 'package:flutter/material.dart';
import 'package:wagwan/core/themes/app_theme.dart';

class MyChatText extends StatelessWidget {
  const MyChatText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
          const  CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  'https://cdn-icons-png.freepik.com/512/3656/3656988.png'),
              backgroundColor: Colors.green,
            ),
           const SizedBox(width: 10),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).appColors.surface,
                    border: Border.all(
                        color: Theme.of(context).appColors.secondary),
                    borderRadius:const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Hello, how are you? I am fine, thank you. How are you doing today? i am doing great. How about you? so far so good. I am glad to hear that now lets go to the park and have some fun. I am in, lets go.',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(context).appColors.onPrimary,
                            )),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
