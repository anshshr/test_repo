import 'package:flutter/material.dart';
import 'package:wagwan/core/themes/custom_buttons/upload_button.dart';

class ChatMedia extends StatelessWidget {
  const ChatMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: 10),
          UploadButton(onPressed: () {}, text: 'Image', iconData: Icons.image),
          const SizedBox(width: 10),
          UploadButton(
              onPressed: () {},
              text: 'Video',
              iconData: Icons.video_collection),
          const SizedBox(width: 10),
          UploadButton(
              onPressed: () {},
              text: 'Ask AI',
              iconData: Icons.circle_outlined),
          const SizedBox(width: 10),
          UploadButton(onPressed: () {}, text: 'Event', iconData: Icons.event),
          const SizedBox(width: 10),
          UploadButton(
              onPressed: () {}, text: 'Youtube', iconData: Icons.play_arrow),
          const SizedBox(width: 10),
          UploadButton(
              onPressed: () {}, text: 'Website', iconData: Icons.web_sharp),
          const SizedBox(width: 10),
          UploadButton(
              onPressed: () {}, text: 'Audio File', iconData: Icons.audiotrack),
          const SizedBox(width: 10),
          UploadButton(
              onPressed: () {}, text: 'PDF', iconData: Icons.picture_as_pdf),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
