// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/chat_ui/widgets/media_selector.dart';
import 'package:wagwan_work_testing/chat_ui/widgets/mychat_text.dart';
import 'package:wagwan_work_testing/chat_ui/widgets/myfriend_text.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

class ChatPage extends StatelessWidget {
  final String name;
  final String imageurl;
  ChatPage({
    Key? key,
    required this.name,
    required this.imageurl,
  }) : super(key: key);

  TextEditingController controller = TextEditingController();

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
              SizedBox(width: 7),
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
                return (index % 2 == 0) ? FriendChatText() : MyChatText();
              },
            ),
            // Align(
            //   alignment: Alignment.topCenter,
            //   child: Container(
            //     padding: EdgeInsets.only(left: 10, bottom: 5),
            //     color: Theme.of(context).appColors.surface,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         // IconButton(
            //         //   onPressed: () {
            //         //     //back to chat page
            //         //     Navigator.pop(context);
            //         //   },
            //         //   icon:
            //         // ),
            //         // CircleAvatar(
            //         //   backgroundImage: NetworkImage(imageurl),
            //         //   radius: 14,
            //         // ),
            //         // SizedBox(width: 7),
            //         // Text(
            //         //   name,
            //         //   style: Theme.of(context).textTheme.titleLarge!.copyWith(
            //         //       color: Theme.of(context).appColors.onPrimary),
            //         // ),
            //       ],
            //     ),
            //   ),
            // ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: context.theme.appColors.surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  border: Border(
                    top: BorderSide(
                      color: context.theme.appColors.secondary.withOpacity(0.7),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                        onTap: () async {
                          await mediaSelector(context);
                        },
                        child: Icon(Icons.add,
                            color: Theme.of(context).appColors.onPrimary)),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextField(
                          decoration: const InputDecoration(
                              hintText: 'Send a message',
                              border: InputBorder.none,
                              suffixIcon: Icon(
                                Icons.arrow_forward_sharp,
                              )),
                          controller: controller,
                          obscureText: false,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.newline,
                          maxLines: null,
                          onSubmitted: (value) {
                            //send to the person
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
