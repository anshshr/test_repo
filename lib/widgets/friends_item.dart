import 'package:flutter/material.dart';

class FriendItem extends StatefulWidget {
  final String name;
  final String description;
  final String imageurl;

  FriendItem({
    required this.name,
    required this.description,
    required this.imageurl,
  });

  @override
  State<FriendItem> createState() => _FriendItemState();
}

class _FriendItemState extends State<FriendItem> {
  bool is_joined = false;
  // Icon add_icon = Icon(Icons.add_circle)

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(widget.imageurl),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      widget.description,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    is_joined = !is_joined;
                  });
                },
                icon: Icon(
                  is_joined ? Icons.check_circle : Icons.add_circle,
                  size: 34,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
        
        Divider(
          color: Colors.grey, // Customize the color
          thickness: 0.2, // Customize the thickness
        ),
      ],
    );
  }
}
