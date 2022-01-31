

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mara/enums/view_state.dart';
import 'package:mara/providers/lectura_provider.dart';
import 'package:mara/widgets/loader.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Homepage.dart';

class Lectura extends StatelessWidget {
  String lecturaDis;
  String lecturaSubTitle;
  String lecturaImg;
  Lectura({this.lecturaDis,this.lecturaSubTitle,this.lecturaImg});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LecturaProvider(),
      child: Consumer<LecturaProvider>(builder: (ctx, model, child) {
        return Scaffold(
          body: ModalProgressHUD(
            inAsyncCall:model.state == ViewState.busy,
            opacity: 0.5,
            progressIndicator: CircularProgressIndicator(
              color: activeColor,
            ),
            child: Stack(
              children: [
                lecturaImg !=null || lecturaImg!=""
                    ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    'Assets/Images/lectura.jpg',
                    alignment: Alignment.topCenter,
                    width: double.infinity,
                  ),
                ):Container(
                  child: Image.network(
                    "${lecturaImg}",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    loadingBuilder:
                        (context, child, loadingProgress) {
                      return getLoader(
                          context, child, loadingProgress);
                    },
                    errorBuilder:
                        (BuildContext context, Object exception, _) {
                      return Center(
                        child: Text(
                            'loading.........'),
                      );
                    },
                  ),
                ) ,
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
                              builder: (context) => HomePage(),
                            ),
                          );
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
                            color: Colors.white60,
                          ),
                        ),
                      ),
                      title: Text(
                        "Lectura",
                        // widget.titleText,
                        style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      subtitle: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          // width: double.,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: activeColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: lecturaSubTitle==null || lecturaSubTitle==""?Text("subtitle"):Text(
                            lecturaSubTitle,
                            // widget.subtitle,
                            style: TextStyle(
                              // fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 11.sp,
                              // backgroundColor: Color(0xFF2D2AF6),
                            ),
                          ),
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
                              offset:
                              Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: InkWell(
                            onTap: () {
                              model.getValue();
                            },
                            child: CircleAvatar(
                              radius: 24.sp,
                              backgroundColor:
                              model.value ? Color(0xFF2D2AF6) : Colors.black26,
                              child: Icon(
                                Icons.check,
                                size: 30.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          title: Center(
                            child: Text(
                              "Lectura",
                              // widget.titleText,
                              style: TextStyle(
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            ),
                          ),
                          subtitle: Center(
                            child:  lecturaSubTitle==null || lecturaSubTitle==""?Text("subtitle"):Text(
                              lecturaSubTitle,
                              // widget.subtitle,
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
                        padding: EdgeInsets.only(
                            right: 28.w, left: 28.w, top: 10.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Container(
                                  child: Column(
                                    children: [
                                      // Text(
                                      //   'Proclama mi alma la grandeza del Señor,\n\n',
                                      //   style: TextStyle(
                                      //     fontSize: 15.sp,
                                      //     wordSpacing: 3.sp,
                                      //   ),
                                      //   textAlign: TextAlign.start,
                                      // ),
                                      lecturaDis==null || lecturaDis==""?Text("Decription"):Text(
                                        lecturaDis,
                                        // 'se alegra mi espíritu en Dios, mi salvador;\n Desde ahora me felicitarán todas las generaciones,\nsu nombre es santo, y su misericordia llega a sus fieles\n de generación en generaciónporque el Poderoso ha hec,\nDesde ahora me felicitarán todas las generaciones,\nsu nombre es santo, y su misericordia llega a sus fieles,\nsu nombre es santo, y su misericordia llega a sus fieles\n\nDesde ahora me felicitarán todas las generaciones,\nsu nombre es santo, y su misericordia llega a sus fieles,\nsu nombre es santo, y su misericordia llega a sus fieles\n de generación en generaciónporque el Poderoso ha hec,\nDesde ahora me felicitarán todas las generaciones,\nsu nombre es santo, y su misericordia llega a sus fieles',
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
          ),
        );
      }),
    );
  }
}
