import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mara/Homepage.dart';
class Dibujo extends StatefulWidget {
  @override
  _DibujoState createState() => _DibujoState();
}

class _DibujoState extends State<Dibujo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0xFFEDECFF),
          ),
          Container(
            margin: EdgeInsets.only(top: 470.h),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
            ),
          ),
          Container(
            color: Colors.white24,
            height: double.infinity,
            child: Container(
              margin: EdgeInsets.only(top: 50.h),
              height: 40.h,
              width: double.infinity,
              child: ListTile(
                leading: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child:Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.black54,
                  ),
                ),
                title: Text('Dibujo',
                  style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w900,
                      color: Colors.black
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 165.h,bottom: 160.h,left: 26.w,right: 26.w),
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              //color: Colors.white60,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.only(topLeft: Radius.circular(90.h))
            ),
            child: Stack(
               alignment: Alignment.topLeft,
              children: [
                Container(
                  width: double.infinity,
                  height: 50.h,
                  margin: EdgeInsets.only(left: 46.w),
                  color: Colors.white,
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: ClipPath(
                      clipper: MyPolygon(),
                      child: Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 5,
                            color: Colors.black12
                          )
                        ),
                      )
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: double.infinity,
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 50.h),
                  child: Image.asset('Assets/Images/Dibujo.png'),
                )
              ],
            )
          )
        ],
      ),
    );
  }
}
class MyPolygon extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addPolygon([
      Offset(50.w,0),
      Offset(50.w,70.h),
      Offset(0,70.h),
      Offset(0,50.h),

    ], true);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}