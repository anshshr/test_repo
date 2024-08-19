import 'package:flutter/material.dart';

class HomeCircleUi extends StatefulWidget {
  final String name;
  final String imageurl;

  HomeCircleUi({
    required this.name,
    required this.imageurl,
  });

  @override
  State<HomeCircleUi> createState() => _HomeCircleUiState();
}

class _HomeCircleUiState extends State<HomeCircleUi> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 45,
            backgroundImage: NetworkImage(widget.imageurl),
          ),
          SizedBox(height: 8,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              widget.name,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis),
                  textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ),
          
        ],
      ),
    );
  }
}
