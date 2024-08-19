import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wagwan_work_testing/widgets/tags_container.dart';

class CircleItem extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;

  CircleItem({
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  State<CircleItem> createState() => _CircleItemState();
}

class _CircleItemState extends State<CircleItem> {
  bool is_joined = false;

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
                radius: 40,
                backgroundImage: NetworkImage(widget.imagePath),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget.description,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 15),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          // Example tags
                          custom_container('funny'),
                          SizedBox(width: 5),
                          custom_container('vibes'),
                          SizedBox(width: 5),
                          custom_container('stupid shit'),
                          SizedBox(width: 5),
                        ],
                      ),
                    ),
                    SizedBox(height: 18),
                    InkWell(
                      onTap: () {
                        setState(() {
                          is_joined = !is_joined;
                        });
                      },
                      child: Container(
                        height: 33,
                        width: 250,
                        child: Center(
                          child: Text(
                            is_joined == false ? 'Join' : 'Joined',
                            style: TextStyle(
                              fontSize: 17.5,
                              fontWeight: FontWeight.bold,
                              color: is_joined == false
                                  ? Colors.white70
                                  : Colors.black87,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: is_joined == false
                              ? Colors.black87
                              : Colors.white,
                          border: Border.all(color: Colors.black87, width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.grey,
          thickness: 0.2,
        ),
      ],
    );
  }
}
