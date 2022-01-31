import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mara/enums/view_state.dart';
import 'package:mara/models/base_view_model.dart';

import 'package:provider/provider.dart';

class CantoProvider extends BaseViewModal {




  // /// Constructor of Canto
  //
  // CantoProvider() {
  // getCantoData();
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
  //     var data = snapshot.data();;
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




}