import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mara/Homepage.dart';

class Canto extends StatefulWidget {
  final String imageli;
  final String titleText;
  final String subtitle;
  Canto({this.imageli, this.titleText, this.subtitle});
  @override
  _CantoState createState() => _CantoState();
}

class _CantoState extends State<Canto> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              widget.imageli,
              alignment: Alignment.topCenter,
              width: double.infinity,
            ),
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
              margin: EdgeInsets.only(top: 40.h),
              height: 40.h,
              width: double.infinity,
              child: ListTile(
                leading: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.white60,
                  ),
                ),
                title: Text(
                  widget.titleText,
                  style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
                subtitle: Text(
                  widget.subtitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 13.sp,
                    backgroundColor: Color(0xFF2D2AF6),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: 290.h, bottom: 26.h, left: 26.w, right: 26.w),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.h),
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
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.h),
                        topLeft: Radius.circular(30.h)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: InkWell(
                      onTap: () {
                        setState(() {
                          _value = !_value;
                        });
                      },
                      child: CircleAvatar(
                        radius: 24.sp,
                        backgroundColor:
                            _value ? Color(0xFF2D2AF6) : Colors.black26,
                        child: Icon(
                          Icons.check,
                          size: 30.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    title: Center(
                      child: Text(
                        widget.titleText,
                        style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w900,
                            color: Colors.black),
                      ),
                    ),
                    subtitle: Center(
                      child: Text(
                        widget.subtitle,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 11.sp,
                          color: Color(0xFF2D2AF6),
                        ),
                      ),
                    ),
                    trailing: SizedBox(
                      width: 50.sp,
                    ),
                  ),
                ),
                Container(
                  height: 450.h,
                  padding: EdgeInsets.only(right: 28.w, left: 28.w, top: 10.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            child: Column(
                              children: [
                                Text(
                                  'Proclama mi alma la grandeza del Señor,\n\n',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    wordSpacing: 3.sp,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  'se alegra mi espíritu en Dios, mi salvador;\n Desde ahora me felicitarán todas las generaciones,\nsu nombre es santo, y su misericordia llega a sus fieles\n de generación en generaciónporque el Poderoso ha hec,\nDesde ahora me felicitarán todas las generaciones,\nsu nombre es santo, y su misericordia llega a sus fieles,\nsu nombre es santo, y su misericordia llega a sus fieles\n\nDesde ahora me felicitarán todas las generaciones,\nsu nombre es santo, y su misericordia llega a sus fieles,\nsu nombre es santo, y su misericordia llega a sus fieles\n de generación en generaciónporque el Poderoso ha hec,\nDesde ahora me felicitarán todas las generaciones,\nsu nombre es santo, y su misericordia llega a sus fieles',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    wordSpacing: 3.sp,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
