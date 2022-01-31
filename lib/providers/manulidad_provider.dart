





import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mara/enums/view_state.dart';
import 'package:mara/models/base_view_model.dart';

import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class ManulidadProvider extends BaseViewModal {


  // String instructions = "";
  // String munaldidSubTitle ="";
  // String munaldidMaterial ="";
  // String menuldidVideoURL="";
  // bool isVideo=false;

  bool value=false;


  /// Constructor of Canto

  // ManulidadProvider() {
  //
  //   getCantoData();
  //
  // }
  //
  //
  // void getCantoData()
  // async {
  //   setState(ViewState.busy);
  //   try {
  //     final snapshot = await FirebaseFirestore.instance.collection('Publicaciones').doc("01022022").get();
  //     print('snap : ${snapshot.data()}');
  //     var data = snapshot.data();
  //     // instructions= data['Manualidad Instrucciones'];
  //     // munaldidSubTitle = data['Manualidad Subtitulo'];
  //     // munaldidMaterial = data['Manualidad Material'];
  //     // isVideo = data['Manualidad Video'];
  //     // menuldidVideoURL = data['Manualidad URL'];
  //
  //
  //   } catch (e) {
  //     print('Exception :: $e');
  //   }
  //
  //   setState(ViewState.idle);
  //
  //
  //   notifyListeners();
  //
  // }


  void getValue()
  {
    value = !value;
    notifyListeners();
  }




}