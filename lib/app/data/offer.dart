import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pro_exchange2/app/data/CarData.dart';
import 'package:pro_exchange2/app/modules/model/model/bikes.dart';
import 'package:pro_exchange2/app/modules/model/model/furniture.dart';
import 'package:pro_exchange2/app/modules/model/model/offer.dart';
import 'package:pro_exchange2/app/modules/model/model/plot_land.dart';

import '../modules/model/model/BecomeVerifier.dart';

class MakeofferStoreData {
  int ofeer = 0;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> MakeofferStoreData1(
      String offer,
      String time
      ) async {
    String res = 'Something error occured';
    try {
      MakeofferData makeofferData = MakeofferData(offer: offer,time:time );

      ofeer++;

      _firestore
          .collection('offer')
          .doc()
          .set(makeofferData.toJson());

      res = "Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
