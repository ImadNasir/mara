import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mara/SplashScreen.dart';

import 'Homepage.dart';

void main() {
  runApp(ScreenUtilInit(
      designSize: Size(405, 866),
      builder: () => MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => SplashScreen(),
            'home': (context) => HomePage(),
          },
          debugShowCheckedModeBanner: false,
          title: 'Flutter_ScreenUtil',
          theme: ThemeData(
            fontFamily: 'Montserrat',
            primarySwatch: Colors.blue,
            textTheme: TextTheme(button: TextStyle(fontSize: 45.sp)),
          ),
          builder: (context, widget) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget,
            );
          })));
}
