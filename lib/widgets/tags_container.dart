import 'package:flutter/material.dart';

Widget custom_container(String data) {
  return IntrinsicWidth(
    child: Container(
      height: 30,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Center(
            child: Text(
          data,
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
        )),
      ),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.transparent)),
    ),
  );
}
