import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pro_exchange2/app/data/CarData.dart';
import 'package:pro_exchange2/app/modules/model/model/bikes.dart';
import 'package:pro_exchange2/app/modules/model/model/electronics/printer_moniter.dart';
import 'package:pro_exchange2/app/modules/model/model/furniture.dart';
import 'package:pro_exchange2/app/modules/model/model/plot_land.dart';

import '../../modules/model/model/electronics/washing_machine.dart';

class WashingStoreData {
  int w = 0;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> WashingStoreData1(
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
      WashingMachineData washingMachineData = WashingMachineData(

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
      w++;

      _firestore
          .collection('products')
          .doc('Washing_Machine' + w.toString())
          .set(washingMachineData.toJson());

      res = "Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
