import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mara/models/base_view_model.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'enums/view_state.dart';

class HomeScreenProvider extends BaseViewModal {



  String cantoSubTitle;
  String cantoDis;
  String cantoImg;
  String cantoVideoURl;
  bool cantoVideo=false;

  String lecturaDis;
  String lecturaSubTitle;
  String lecturaImg;

  String dibujoSubTitle;
  String dibujoVideoURL;


  String manualidadSubTitle;
  String manualidadInstruction;
  String manualidadMaterials;
  String manualidadVideoURl;
  bool manualidadVideo=false;


  VideoPlayerController controller;



  bool value=false;




  var now = new DateTime.now();
  var dateFormatter = new DateFormat('MMddyyyy');
  var dayFormatter = new DateFormat('dd');
  var monthFormatter = new DateFormat('MM');
  String getDate ;
  String getDay;
  String getMonth;





  /// Constructor of Canto

  HomeScreenProvider() {

    getCantoData();


  }


  void getCantoData()
  async {

    try {

      getDate = dateFormatter.format(now);
      getDay = dayFormatter.format(now);
      getMonth= monthFormatter.format(now);

      setState(ViewState.busy);


      final snapshot = await FirebaseFirestore.instance.collection('Publicaciones').doc(getDate).get();
      var data = snapshot.data();

      cantoSubTitle = data['Canto Subtitulo'];
      cantoDis=data['Canto'];
      cantoImg =data['Canto Imagen'];
      cantoVideoURl=data['Canto URL'];
      cantoVideo=data['Canto Video'];


      lecturaDis=data['Lectura'];
      lecturaSubTitle=data['Lectura Subtitulo'];
      lecturaImg=data['Lectura Imagen'];

      dibujoSubTitle=data['Dibujo Subtitulo'];
      dibujoVideoURL=data['Dibujo URL'];

      manualidadSubTitle = data['Lectura Subtitulo'];
      manualidadInstruction=data['Manualidad Instrucciones'];
      manualidadMaterials=data['Manualidad Material'];
      manualidadVideoURl=data['Manualidad URL'];
      manualidadVideo=data['Manualidad Video'];


      controller = VideoPlayerController.network(manualidadVideoURl);



    } catch (e) {
      print('Exception :: $e');
    }

    setState(ViewState.idle);
    notifyListeners();

  }


  void getValue()
  {
    value = !value;
    notifyListeners();
  }





























  int isActive = 1;
  int isMonth = 1;
  DateTime selectedDay;

  DateTime firstDay = DateTime(DateTime.now().year, 1, 1);

  DateTime lastDay = DateTime(DateTime.now().year, 1, 31);

  // firstDay = DateTime(DateTime.now().year, isMonth, 1);

  // lastDay = DateTime(DateTime.now().year, isMonth, getLastDay());

  // focusedDay = firstDay;

  getLastDay() {
    if (isMonth == 1) {
      return 31;
    } else if (isMonth == 2) {
      return 28;
    } else if (isMonth == 3) {
      return 31;
    } else if (isMonth == 4) {
      return 30;
    } else if (isMonth == 5) {
      return 31;
    } else if (isMonth == 6) {
      return 30;
    } else if (isMonth == 7) {
      return 31;
    } else if (isMonth == 8) {
      return 31;
    } else if (isMonth == 9) {
      return 30;
    } else if (isMonth == 10) {
      return 31;
    } else if (isMonth == 11) {
      return 30;
    } else if (isMonth == 12) {
      return 31;
    }
  }
}
