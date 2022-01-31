


import 'package:flutter/material.dart';

Widget getLoader(BuildContext context, Widget child, ImageChunkEvent loadingProgress,)
{
  if (loadingProgress == null) return child;
  return Center(
    child: CircularProgressIndicator(
      color: Colors.red,
      // value: loadingProgress.expectedTotalBytes != null ?
      // loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
    ),
  );
}