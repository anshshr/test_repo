import 'package:flutter/material.dart';

class FriendChatText extends StatelessWidget {
  const FriendChatText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,  // Aligns the message to the right
      child: Row(
        mainAxisSize: MainAxisSize.min,  // Ensures the Row takes only as much space as needed
        children: [
           Flexible(
            child: Text(
              'Fine, how are you?',
              style: TextStyle(color: Colors.blue),
              
            ),
          ),
          SizedBox(width: 10),  // Add space between the avatar and text

          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue,
          ),
         
        ],
      ),
    );
  }
}
