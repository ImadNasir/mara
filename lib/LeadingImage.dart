import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeadingImage extends StatefulWidget {
  final String imagelink;
 LeadingImage({ this.imagelink});

  @override
  _LeadingImageState createState() => _LeadingImageState();
}

class _LeadingImageState extends State<LeadingImage> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24.h,
      backgroundColor: Color(0xFF2D2AF6),
      child: CircleAvatar(
          radius: 21.h,
          backgroundColor: Colors.white,
          child: Image.asset(widget.imagelink,
            height: 25.h,)
      ),
    );
  }
}
