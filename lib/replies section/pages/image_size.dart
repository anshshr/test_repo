import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//calculates the dimension of image to find whether it is a portrait or landscape

Future<bool> isImagePortrait(String imageUrl) async {
  final Image image = Image.network(imageUrl);
  final Completer<Size> completer = Completer<Size>();

  image.image.resolve(ImageConfiguration()).addListener(
    ImageStreamListener((ImageInfo info, bool _) {
      final Size imageSize = Size(
        info.image.width.toDouble(),
        info.image.height.toDouble(),
      );
      completer.complete(imageSize);
    }),
  );

  final Size size = await completer.future;

  return size.height > size.width;
}
