import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/chat_ui/pages/friends_list.dart';
import 'package:wagwan_work_testing/chat_ui/widgets/chat_block.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    darkTheme: AppTheme.dark,
    theme: AppTheme.light,
    themeMode: ThemeMode.dark,
    home: ChatList(),
    // change this to light and dark theme
  ));
}

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  Future openFriendsList(BuildContext context) async {
    await showModalBottomSheet(
      backgroundColor: Theme.of(context).appColors.primary,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FriendsList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appColors.surface,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).appColors.surface,
        title: Text('My Chats',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: Theme.of(context).appColors.onPrimary)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Theme.of(context).appColors.tertiary,
                  borderRadius: BorderRadius.circular(30)),
              child: InkWell(
                onTap: () async {
                  await openFriendsList(context);
                },
                child: Icon(
                  Icons.add,
                  size: 25,
                  color: Theme.of(context).appColors.onPrimary,
                ),
              ),
            ),
          )
        ],
      ),

      //conatins the list of all the people with whom we had done the chat

      body: ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ChatBlock();
        },
      ),
    );
  }
}
