import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

class LikedList extends StatelessWidget {
  const LikedList({super.key});

  @override
  Widget build(BuildContext context) {
    Widget squareDots() {
      return Padding(
        padding: const EdgeInsets.only(right: 3.0, top: 4),
        child: Container(
          height: 3,
          width: 3,
          decoration: BoxDecoration(
              color: Theme.of(context).appColors.tertiary,
              shape: BoxShape.rectangle),
        ),
      );
    }
  return Container(color: Colors.amber,);
//     return Container(
//       height: 400,
//       width: double.infinity,
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               squareDots(),
//               squareDots(),
//               squareDots(),
//               squareDots(),
//               squareDots(),
//               squareDots(),
//             ],
//           ),
//           Row(
//             children: [
//               Text(
//                 'Likes',
//                 style: TextStyle(color: Theme.of(context).appColors.onPrimary)
//                     .copyWith(
//                         fontSize: Theme.of(context)
//                             .textTheme
//                             .displayLarge!
//                             .fontSize),
//               ),
//               //number reprsenting the likes count
//             ],
//           ),
//           // Expanded(
//           //   child: ListView.builder(
//           //     itemCount: 15,
//           //     itemBuilder: (context, index) {
//           //       return PeopleDetails(
//           //           image_url:
//           //               'https://media.istockphoto.com/id/1332100919/vector/man-icon-black-icon-person-symbol.jpg?s=612x612&w=0&k=20&c=AVVJkvxQQCuBhawHrUhDRTCeNQ3Jgt0K1tXjJsFy1eg=',
//           //           name: 'Deepak patro',
//           //           description_text: 'Forbes 30 under 30 soon');
//           //     },
//           //   ),
//           // )
//         ],
//       ),
//     );
//   }
// }
  }
}
