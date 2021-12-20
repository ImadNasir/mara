import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mara/Canto.dart';
import 'package:mara/Dibujo.dart';
import 'LeadingImage.dart';
import 'Manualidad.dart';
import 'calendar.dart';

const activeColor = Color(0xFF2D2AF6);
const inactiveColor = Color(0xFFEDECFF);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController controller;
  Animation flexAnimationStart2End;
  Animation flexAnimationEnd2Start;
  double maxHeight = 35.h;
  int duration = 500;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 30),
    );
    flexAnimationStart2End = Tween(begin: 1, end: 2).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.0, 1000.0)));
    flexAnimationEnd2Start = Tween(begin: 2, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.0, 1000.0)));
  }

// flexAnimation = Tween(begin: 1, end: 2).animate(CurvedAnimation(parent: controller, curve: Interval(0.0, 0.5)));

// In initState()
// controller = AnimationController(vsync: this, duration: Duration(seconds: 3));
  int isActive = 1;
  @override
  Widget build_cyclo(BuildContext context) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(
          top: 50.h,
          bottom: 10.h,
          left: 12.w,
          right: 12.w,
        ),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
                bottom: 10,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                "Hoy, Lun 15",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 28.sp,
                ),
              ),
            ),

            Row(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 5000),
                  child: Expanded(
                    flex: isActive == 1
                        ? flexAnimationEnd2Start.value
                        : flexAnimationStart2End.value,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: isActive == 1
                                ? EdgeInsets.zero
                                : EdgeInsets.only(right: 10.w),
                            child: CicloButton(
                              text: "Ciclo 1",
                              onPressed: () {
                                setState(() {
                                  isActive = 1;
                                });
                              },
                              isActive: isActive == 1 ? true : false,
                            ),
                          ),
                          // Container(
                          //   // height: 40.h,
                          //   // width: double.infinity,
                          //   padding: EdgeInsets.symmetric(
                          //       vertical: 7.h, horizontal: 15.w),
                          //   alignment: Alignment.center,
                          //   margin: EdgeInsets.only(
                          //     left: 5.w,
                          //     top: 5.h,
                          //     bottom: 5.w,
                          //   ),
                          //   child: Text(
                          //     'Ciclo 1',
                          //     style: TextStyle(
                          //       color: Colors.white,
                          //       fontSize: 18.sp,
                          //       fontWeight: FontWeight.w700,
                          //     ),
                          //   ),
                          //   decoration: BoxDecoration(
                          //       color: Color(0xFF2D2AF6),
                          //       borderRadius: BorderRadius.circular(15.h)),
                          // ),
                        ),
                        isActive == 1
                            ? Container(
                                padding: EdgeInsets.all(0.h),
                                margin: EdgeInsets.all(0.h),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 12.sp,
                                  color: Colors.black54,
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: isActive == 2
                      ? flexAnimationEnd2Start.value
                      : flexAnimationStart2End.value,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: isActive == 2
                              ? EdgeInsets.zero
                              : EdgeInsets.only(
                                  right: 8.0,
                                ),
                          child: CicloButton(
                            text: "Ciclo 2",
                            onPressed: () {
                              setState(() {
                                isActive = 2;
                              });
                            },
                            isActive: isActive == 2 ? true : false,
                          ),
                        ),
                      ),
                      isActive == 2
                          ? Container(
                              padding: EdgeInsets.all(0.h),
                              margin: EdgeInsets.all(0.h),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 12.sp,
                                color: Colors.black54,
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
                Expanded(
                  flex: isActive == 3
                      ? flexAnimationEnd2Start.value
                      : flexAnimationStart2End.value,
                  child: Row(
                    children: [
                      Expanded(
                        child: CicloButton(
                          text: "Ciclo 3",
                          onPressed: () {
                            setState(() {
                              isActive = 3;
                            });
                          },
                          isActive: isActive == 3 ? true : false,
                        ),
                      ),
                      isActive == 3
                          ? Container(
                              padding: EdgeInsets.all(0.h),
                              margin: EdgeInsets.all(0.h),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 12.sp,
                                color: Colors.black54,
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                  // Container(
                  //   margin: EdgeInsets.all(5.w),
                  //   width: 65.w,
                  //   padding: EdgeInsets.symmetric(vertical: 10.h),
                  //   alignment: Alignment.center,
                  //   child: Text(
                  //     'Ciclo 3',
                  //     style: TextStyle(
                  //         color: Colors.black,
                  //         fontSize: 11.sp,
                  //         fontWeight: FontWeight.w700),
                  //   ),
                  //   decoration: BoxDecoration(
                  //     color: Color(0xFFEDECFF),
                  //     borderRadius: BorderRadius.circular(
                  //       12.h,
                  //     ),
                  //   ),
                  // ),
                )
              ],
            ),
//--------- This is the Second Row, which shows months of the cycle-----//
            Row(
              children: [
                Container(
                  // duration: Duration(milliseconds: 500),
                  child: Expanded(
                    flex: isActive == 1 ? 2 : 1,
                    child: Container(
                      margin: EdgeInsets.only(left: 10.w),
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        // color: Colors.amber,
                        borderRadius: BorderRadius.circular(
                          12.h,
                        ),
                      ),
                      child: Stack(
                        // fit: StackFit.loose,
                        children: [
                          AnimatedContainer(
                            height: maxHeight,
                            duration: Duration(milliseconds: duration),
                            // curve: ,
                            child: MonthButton(
                              month: "Ene",
                              onPressed: () {},
                              isSelected: isActive == 1 ? true : false,
                            ),
                          ),
                          AnimatedContainer(
                            height: maxHeight,
                            duration: Duration(milliseconds: duration),
                            margin: isActive == 1
                                ? EdgeInsets.only(left: 40.w)
                                : EdgeInsets.only(left: 10.w),
                            child: MonthButton(
                              month: "Feb",
                              onPressed: () {},
                            ),
                          ),
                          AnimatedContainer(
                            height: maxHeight,
                            duration: Duration(milliseconds: duration),
                            margin: isActive == 1
                                ? EdgeInsets.only(left: 80.w)
                                : EdgeInsets.only(left: 20.w),
                            child: MonthButton(
                              month: "Mar",
                              onPressed: () {},
                            ),
                          ),
                          AnimatedContainer(
                            height: maxHeight,
                            duration: Duration(milliseconds: duration),
                            margin: isActive == 1
                                ? EdgeInsets.only(left: 120.w)
                                : EdgeInsets.only(left: 30.w),
                            child: MonthButton(
                              month: "Abr",
                              onPressed: () {},
                            ),
                          ),
                          // isActive == 1
                          //     ? Container(
                          //         padding: EdgeInsets.all(0.h),
                          //         margin: EdgeInsets.all(0.h),
                          //         child: Icon(
                          //           Icons.arrow_forward_ios,
                          //           size: 12.sp,
                          //           color: Colors.black54,
                          //         ),
                          //       )
                          //     : SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: isActive == 2 ? 2 : 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 10.w),
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      // color: Colors.amber,
                      borderRadius: BorderRadius.circular(
                        12.h,
                      ),
                    ),
                    child: Stack(
                      // mainAxisSize: MainAxisSize.min,
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AnimatedContainer(
                          height: maxHeight,
                          duration: Duration(milliseconds: duration),
                          child: MonthButton(
                            month: "May",
                            onPressed: () {},
                            isSelected: isActive == 2 ? true : false,
                          ),
                        ),
                        AnimatedContainer(
                          height: maxHeight,
                          duration: Duration(milliseconds: duration),
                          margin: isActive == 2
                              ? EdgeInsets.only(left: 45.w)
                              : EdgeInsets.only(left: 10.w),
                          child: MonthButton(
                            month: "Jun",
                            onPressed: () {},
                          ),
                        ),
                        AnimatedContainer(
                          height: maxHeight,
                          duration: Duration(milliseconds: duration),
                          margin: isActive == 2
                              ? EdgeInsets.only(left: 90.w)
                              : EdgeInsets.only(left: 20.w),
                          child: MonthButton(
                            month: "Jul",
                            onPressed: () {},
                          ),
                        ),
                        AnimatedContainer(
                          height: maxHeight,
                          duration: Duration(milliseconds: duration),
                          margin: isActive == 2
                              ? EdgeInsets.only(left: 135.w)
                              : EdgeInsets.only(left: 30.w),
                          child: MonthButton(
                            month: "Ago",
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: isActive == 3 ? 2 : 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 10.w),
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      // color: Colors.amber,
                      borderRadius: BorderRadius.circular(
                        12.h,
                      ),
                    ),
                    child: Stack(
                      // mainAxisSize: MainAxisSize.min,
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AnimatedContainer(
                          height: maxHeight,
                          duration: Duration(milliseconds: duration),
                          // margin: EdgeInsets.only(left: 40.w),
                          child: MonthButton(
                            month: "Sept",
                            onPressed: () {},
                            isSelected: isActive == 3 ? true : false,
                          ),
                        ),
                        AnimatedContainer(
                          height: maxHeight,
                          duration: Duration(milliseconds: duration),
                          margin: isActive == 3
                              ? EdgeInsets.only(left: 45.w)
                              : EdgeInsets.only(left: 10.w),
                          child: MonthButton(
                            month: "Oct",
                            onPressed: () {},
                          ),
                        ),
                        AnimatedContainer(
                          height: maxHeight,
                          duration: Duration(milliseconds: duration),
                          margin: isActive == 3
                              ? EdgeInsets.only(left: 90.w)
                              : EdgeInsets.only(left: 20.w),
                          child: MonthButton(
                            month: "Nov",
                            onPressed: () {},
                          ),
                        ),
                        AnimatedContainer(
                          height: maxHeight,
                          duration: Duration(milliseconds: duration),
                          margin: isActive == 3
                              ? EdgeInsets.only(left: 135.w)
                              : EdgeInsets.only(left: 30.w),
                          child: MonthButton(
                            month: "Dic",
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              height: 90.h,
              child: Calendar(),
            ),
            // SizedBox(
            //   height: 60.h,
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: ListView.builder(
            //           scrollDirection: Axis.horizontal,
            //           itemBuilder: (_, index) {
            //             return CalendarDay(
            //               day: "Lu",
            //               date: "${index + 1}",
            //               isSelected: index == 0 ? true : false,
            //             );
            //           },
            //           itemCount: 30,
            //         ),
            //       ),
            //       // CalendarDay(
            //       //   day: "Lun",
            //       //   date: "15",
            //       // ),
            //       // Container(
            //       //   margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 3.w),
            //       //   width: 46.w,
            //       //   padding: EdgeInsets.symmetric(vertical: 10.h),
            //       //   alignment: Alignment.center,
            //       //   child: Column(
            //       //     children: [
            //       //       Text(
            //       //         '16',
            //       //         style: TextStyle(
            //       //             color: Colors.black,
            //       //             fontSize: 17.sp,
            //       //             fontWeight: FontWeight.w700),
            //       //       ),
            //       //       Text(
            //       //         'Lun',
            //       //         style: TextStyle(
            //       //             color: Colors.black,
            //       //             fontSize: 6.sp,
            //       //             fontWeight: FontWeight.w700),
            //       //       ),
            //       //     ],
            //       //   ),
            //       //   decoration: BoxDecoration(
            //       //       color: Color(0xFFEDECFF),
            //       //       borderRadius: BorderRadius.circular(15.h)),
            //       // ),
            //       // Container(
            //       //   margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 3.w),
            //       //   width: 46.w,
            //       //   padding: EdgeInsets.symmetric(vertical: 10.h),
            //       //   alignment: Alignment.center,
            //       //   child: Column(
            //       //     children: [
            //       //       Text(
            //       //         '17',
            //       //         style: TextStyle(
            //       //             color: Colors.black,
            //       //             fontSize: 17.sp,
            //       //             fontWeight: FontWeight.w700),
            //       //       ),
            //       //       Text(
            //       //         'Lun',
            //       //         style: TextStyle(
            //       //             color: Colors.black,
            //       //             fontSize: 6.sp,
            //       //             fontWeight: FontWeight.w700),
            //       //       ),
            //       //     ],
            //       //   ),
            //       //   decoration: BoxDecoration(
            //       //       color: Color(0xFFEDECFF),
            //       //       borderRadius: BorderRadius.circular(15.h)),
            //       // ),
            //       // Container(
            //       //   margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 3.w),
            //       //   width: 46.w,
            //       //   padding: EdgeInsets.symmetric(vertical: 10.h),
            //       //   alignment: Alignment.center,
            //       //   child: Column(
            //       //     children: [
            //       //       Text(
            //       //         '18',
            //       //         style: TextStyle(
            //       //             color: Colors.black,
            //       //             fontSize: 17.sp,
            //       //             fontWeight: FontWeight.w700),
            //       //       ),
            //       //       Text(
            //       //         'Lun',
            //       //         style: TextStyle(
            //       //             color: Colors.black,
            //       //             fontSize: 6.sp,
            //       //             fontWeight: FontWeight.w700),
            //       //       ),
            //       //     ],
            //       //   ),
            //       //   decoration: BoxDecoration(
            //       //       color: Color(0xFFEDECFF),
            //       //       borderRadius: BorderRadius.circular(15.h)),
            //       // ),
            //       // Container(
            //       //   margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 3.w),
            //       //   width: 46.w,
            //       //   padding: EdgeInsets.symmetric(vertical: 10.h),
            //       //   alignment: Alignment.center,
            //       //   child: Container(
            //       //     child: Column(
            //       //       children: [
            //       //         Text(
            //       //           '19',
            //       //           style: TextStyle(
            //       //               color: Colors.black,
            //       //               fontSize: 17.sp,
            //       //               fontWeight: FontWeight.w700),
            //       //         ),
            //       //         Text(
            //       //           'Lun',
            //       //           style: TextStyle(
            //       //               color: Colors.black,
            //       //               fontSize: 6.sp,
            //       //               fontWeight: FontWeight.w700),
            //       //         ),
            //       //       ],
            //       //     ),
            //       //   ),
            //       //   decoration: BoxDecoration(
            //       //       color: Color(0xFFEDECFF),
            //       //       borderRadius: BorderRadius.circular(15.h)),
            //       // ),
            //       // Container(
            //       //   margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 3.w),
            //       //   width: 46.w,
            //       //   padding: EdgeInsets.symmetric(vertical: 10.h),
            //       //   alignment: Alignment.center,
            //       //   child: Column(
            //       //     children: [
            //       //       Text(
            //       //         '20',
            //       //         style: TextStyle(
            //       //             color: Colors.black,
            //       //             fontSize: 17.sp,
            //       //             fontWeight: FontWeight.w700),
            //       //       ),
            //       //       Text(
            //       //         'Lun',
            //       //         style: TextStyle(
            //       //             color: Colors.black,
            //       //             fontSize: 6.sp,
            //       //             fontWeight: FontWeight.w700),
            //       //       ),
            //       //     ],
            //       //   ),
            //       //   decoration: BoxDecoration(
            //       //     color: Color(0xFFEDECFF),
            //       //     borderRadius: BorderRadius.circular(15.h),
            //       //   ),
            //       // ),
            //       // Container(
            //       //   margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 3.w),
            //       //   width: 46.w,
            //       //   padding: EdgeInsets.symmetric(vertical: 10.h),
            //       //   alignment: Alignment.center,
            //       //   child: Column(
            //       //     children: [
            //       //       Text(
            //       //         '21',
            //       //         style: TextStyle(
            //       //             color: Colors.black,
            //       //             fontSize: 17.sp,
            //       //             fontWeight: FontWeight.w700),
            //       //       ),
            //       //       Text(
            //       //         'Lun',
            //       //         style: TextStyle(
            //       //             color: Colors.black,
            //       //             fontSize: 6.sp,
            //       //             fontWeight: FontWeight.w700),
            //       //       ),
            //       //     ],
            //       //   ),
            //       //   decoration: BoxDecoration(
            //       //     color: Color(0xFFEDECFF),
            //       //     borderRadius: BorderRadius.circular(15.h),
            //       //   ),
            //       // ),
            //     ],
            //   ),
            // ),

            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.only(top: 20.h, left: 10.w, bottom: 1.h),
              alignment: Alignment.centerLeft,
              child: Text(
                "Actividades de hoy",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 28.sp,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10.h,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                'Doctrina: Reconciliación - 14',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.h),
                      alignment: Alignment.centerLeft,
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Canto(
                                      imageli: 'Assets/Images/Canto.jpg',
                                      titleText: 'Canto',
                                      subtitle: 'Canto a la Virgen María')));
                        },
                        leading: LeadingImage(
                          imagelink: 'Assets/IconImage/karaoke.jpg',
                        ),
                        title: Text(
                          'Canto y oración',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 18.sp),
                        ),
                        subtitle: Text(
                          'Canto a la Virgen María | Ver. 22',
                          style: TextStyle(fontSize: 11.sp),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.h),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5.sp,
                            blurRadius: 7.sp,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      padding: EdgeInsets.all(5.h),
                      alignment: Alignment.centerLeft,
                      child: ListTile(
                        onTap: () {
                          //
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Canto(
                                        imageli: 'Assets/Images/lectura.jpg',
                                        titleText: 'Lectura',
                                        subtitle: 'Lectura del evangelio 23:46',
                                      )));
                        },
                        leading: LeadingImage(
                          imagelink: 'Assets/IconImage/reading-book.png',
                        ),
                        title: Text(
                          'Lectura',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 18.sp),
                        ),
                        subtitle: Text(
                          'Lectura del Evangelio 23:56',
                          style: TextStyle(fontSize: 11.sp),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.h),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5.sp,
                            blurRadius: 7.sp,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      padding: EdgeInsets.all(5.sp),
                      alignment: Alignment.centerLeft,
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dibujo()));
                        },
                        leading: LeadingImage(
                          imagelink: 'Assets/IconImage/color.png',
                        ),
                        title: Text(
                          'Dibujo',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 18.sp),
                        ),
                        subtitle: Text(
                          'Para colorear',
                          style: TextStyle(fontSize: 11.sp),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.h),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5.sp,
                            blurRadius: 7.sp,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      padding: EdgeInsets.all(5.h),
                      alignment: Alignment.centerLeft,
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Manualidad()));
                        },
                        leading: LeadingImage(
                          imagelink: 'Assets/IconImage/paper-crafts.png',
                        ),
                        title: Text(
                          'Manualidad',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 18.sp),
                        ),
                        subtitle: Text(
                          'Manualidad sencilla para todos',
                          style: TextStyle(fontSize: 11.sp),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.h),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5.sp,
                            blurRadius: 7.sp,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CalendarDay extends StatelessWidget {
  final String day;
  final String date;
  final String year;
  // final String dayOfWeek
  final bool isSelected;
  CalendarDay({this.day, this.date, this.year, this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 3.w),
      width: 46.w,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            date,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 17.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            day,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 6.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF2D2AF6) : Color(0xFFEDECFF),
        borderRadius: BorderRadius.circular(15.h),
      ),
    );
  }
}

class MonthButton extends StatelessWidget {
  final String month;
  final Function onPressed;
  bool isSelected;
  MonthButton({this.month, this.onPressed, this.isSelected = false});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.only(),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onPressed,
      child: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.all(10.h),
        child: Text(
          month,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 10.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF2D2AF6) : Color(0xFFEDECFF),
          border: Border.all(
            color: Colors.white,
            width: 1.h,
          ),
          borderRadius: BorderRadius.circular(12.h),
        ),
      ),
    );
  }
}

class CicloButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool isActive;
  CicloButton({this.text, this.onPressed, this.isActive});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.only(
          bottom: 8.h,
          // left: 10.h,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onPressed,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        padding: EdgeInsets.symmetric(vertical: 10.h),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black,
            fontSize: 11.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        decoration: BoxDecoration(
          color: isActive ? Color(0xFF2D2AF6) : Color(0xFFEDECFF),
          borderRadius: BorderRadius.circular(
            12.h,
          ),
        ),
      ),
    );
  }
}

// class MyPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint();
//     Path path = Path();

//     // Path number 1

//     paint.color = Color(0xff568c48);
//     path = Path();
//     path.lineTo(size.width * 0.48, size.height * 0.26);
//     path.cubicTo(size.width * 0.54, size.height * 0.15, size.width * 0.69,
//         size.height * 0.15, size.width * 0.75, size.height * 0.26);
//     path.cubicTo(size.width * 0.75, size.height * 0.26, size.width * 0.75,
//         size.height * 0.26, size.width * 0.75, size.height * 0.26);
//     path.cubicTo(size.width * 0.75, size.height * 0.26, size.width * 1.09,
//         size.height * 0.91, size.width * 1.09, size.height * 0.91);
//     path.cubicTo(size.width * 1.15, size.height * 1.03, size.width * 1.08,
//         size.height * 1.18, size.width * 0.96, size.height * 1.18);
//     path.cubicTo(size.width * 0.96, size.height * 1.18, size.width * 0.27,
//         size.height * 1.18, size.width * 0.27, size.height * 1.18);
//     path.cubicTo(size.width * 0.15, size.height * 1.18, size.width * 0.08,
//         size.height * 1.03, size.width * 0.14, size.height * 0.91);
//     path.cubicTo(size.width * 0.14, size.height * 0.91, size.width * 0.48,
//         size.height * 0.26, size.width * 0.48, size.height * 0.26);
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }
