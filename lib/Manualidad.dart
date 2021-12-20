import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mara/Homepage.dart';

import 'Material_build.dart';

class Manualidad extends StatefulWidget {
  @override
  _ManualidadState createState() => _ManualidadState();
}

class _ManualidadState extends State<Manualidad> {
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
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50.h),
                  height: 40.h,
                  width: double.infinity,
                  child: ListTile(
                    leading: TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.only(),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          // color: Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    title: Text(
                      'Manualidad',
                      style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w900,
                          color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 55.h, right: 20.w, left: 20.w),
                  width: double.infinity,
                  height: 217.h,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30.h)),
                  child: Stack(children: [
                    Image.asset(
                      'Assets/Images/s2.png',
                      fit: BoxFit.fill,
                      width: 367.w,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.play_circle_outline_outlined,
                        size: 70.sp,
                        color: Colors.white,
                      ),
                    )
                  ]),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.h, right: 30.w, left: 30.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
                  width: double.infinity,
                  height: 194.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.h),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.sp, horizontal: 10.sp),
                        decoration: BoxDecoration(
                            color: Color(0xFF2D2AF6),
                            borderRadius: BorderRadius.circular(8.sp)),
                        child: Text(
                          'Materiales',
                          style: TextStyle(
                              fontSize: 21.sp,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.sp, vertical: 7.sp),
                        child: Column(
                          children: [
                            Materials_build(
                              quantitiy: '1x',
                              item: 'Tigeras',
                            ),
                            Materials_build(
                              quantitiy: '2x',
                              item: 'Rollos de papel',
                            ),
                            Materials_build(
                              quantitiy: '1x',
                              item: 'Pintura Acrílica',
                            ),
                            Materials_build(
                              quantitiy: '1x',
                              item: 'Pincel',
                            ),
                            Materials_build(
                              quantitiy: '1x',
                              item: 'Rollo de cartón A4',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.h, right: 30.w, left: 30.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
                  width: double.infinity,
                  height: 248.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.h),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.sp, horizontal: 10.sp),
                        decoration: BoxDecoration(
                            color: Color(0xFF2D2AF6),
                            borderRadius: BorderRadius.circular(8.sp)),
                        child: Text(
                          'Intrucciones',
                          style: TextStyle(
                              fontSize: 21.sp,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                'Seguiremos con los relieves. Para hacerlo utilizaremos pasta de modelar o estuco, una espátula y una plantilla.La plantilla la podemos fijar con cinta de carrocero sobre la caja.\n\n En los huecos podemos poner el estuco, debemos aplicarlo intentando dejarlo en una capa lisa y homogénea. Dejamos secar y lijamos para quitar imperfecciones.Vamos a ir haciendo estos adornos por las distintas partes de la caja.También vamos a realizar una linea roja en la parte superior de la caja.\n\nPara ello vamos a poner tres tiras de cinta de carrocero una al lado de otra para finalmente retirar la central y pintarla con  una pintura roja burdeos. Una vez pintado podemos retirar las cintas.',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  wordSpacing: 3.sp,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
