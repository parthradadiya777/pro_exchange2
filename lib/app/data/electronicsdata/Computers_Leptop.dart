import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pro_exchange2/app/data/CarData.dart';
import 'package:pro_exchange2/app/modules/model/model/bikes.dart';
import 'package:pro_exchange2/app/modules/model/model/electronics/computers_Leptop.dart';
import 'package:pro_exchange2/app/modules/model/model/electronics/printer_moniter.dart';
import 'package:pro_exchange2/app/modules/model/model/furniture.dart';
import 'package:pro_exchange2/app/modules/model/model/plot_land.dart';

import '../../modules/model/model/electronics/Tv_Audio.dart';
import '../../modules/model/model/electronics/fridge.dart';

class Computer_leptopStorageData {
  int co = 0;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> Computer_leptopStorageData1(
      String Adtitle,
      String description,
      List<String> imgurl,
      String sell,
      String price,
      String uid1,
      String category,
      String location,
      String latitude,
      String searchKey,

      ) async {
    String res = 'Something error occured';
    try {
      Computers_leptopData computers_leptopData = Computers_leptopData(
          Adtitle: Adtitle,
          description: description,
          imgurl: imgurl,
          sell:sell,
          price: price,
          uid1: uid1,
          category: category,
          location:location,
          latitude:latitude,
          searchKey: searchKey

      );
      co++;

      _firestore
          .collection('products')
          .doc('Computer_leptop' + co.toString())
          .set(computers_leptopData.toJson());

      res = "Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
