


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mara/enums/view_state.dart';
import 'package:mara/models/base_view_model.dart';

import 'package:provider/provider.dart';

class LecturaProvider extends BaseViewModal {


  // String lecturaSubTitle ="";
  // String lecturaImage;
  // String lecturaDescription = "";
  // String lecturaVideoURL="";
  // bool isVideo=false;
  //
   bool value=false;
  //
  // /// Constructor of Canto
  //
  // LecturaProvider() {
  //   getCantoData();
  //
  //
  // }
  //
  //
  // void getCantoData()
  // async {
  //   setState(ViewState.busy);
  //   try {
  //     // _controller = VideoPlayerController.network("https://firebasestorage.googleapis.com/v0/b/mara-f8247.appspot.com/o/demo_video.mp4?alt=media&token=4d198059-2ed5-4f73-95c1-473cff7d6e77");
  //     final snapshot = await FirebaseFirestore.instance.collection('Publicaciones').doc("01022022").get();
  //     print('snap : ${snapshot.data()}');
  //     var data = snapshot.data();
  //     lecturaSubTitle = data['Lectura Subtitulo'];
  //     lecturaImage = data['Lectura Imagen'];
  //     lecturaDescription = data['Lectura'];
  //     isVideo = data['Canto Video'];
  //     lecturaVideoURL = data['Canto URL'];
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