import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Materials_build extends StatefulWidget {
  final String quantitiy;
  final String item;
  Materials_build({this.quantitiy,this.item});
  @override
  _Materials_buildState createState() => _Materials_buildState();
}

class _Materials_buildState extends State<Materials_build> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFEDECFF),
            borderRadius: BorderRadius.circular(5.sp),
          ),
          margin: EdgeInsets.only(right: 12.sp,top: 4.sp),
          padding: EdgeInsets.all(2.sp),
          child: Text(
            widget.quantitiy,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp
            ),),
        ),
        Text(widget.item,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12.sp
          ),),
      ],
    );
  }
}

