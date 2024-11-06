import 'package:flutter/material.dart';
import 'package:wagwan/core/themes/app_theme.dart';
import 'package:wagwan/modules/chat/widgets/chat_textfield.dart';
import 'package:wagwan/modules/chat/widgets/mychat_text.dart';
import 'package:wagwan/modules/chat/widgets/myfriend_text.dart';

class ChatPage extends StatelessWidget {
  final String name;
  final String imageurl;
  ChatPage({
    super.key,
    required this.name,
    required this.imageurl,
  });

 final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).appColors.primary,
        appBar: AppBar(
          backgroundColor: Theme.of(context).appColors.surface,
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(imageurl),
                radius: 14,
              ),
             const SizedBox(width: 7),
              Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).appColors.onPrimary),
              ),
            ],
          ),
          leading: InkWell(
            onTap: () {},
            child: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).appColors.onPrimary,
            ),
          ),
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: 40,
              itemBuilder: (context, index) {
                return (index % 2 == 0) ? const FriendChatText() :  const MyChatText();
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ChatTextfield(controller: controller)
            ),
          ],
        ),
      ),
    );
  }
}
