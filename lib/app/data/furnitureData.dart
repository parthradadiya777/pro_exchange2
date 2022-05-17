import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pro_exchange2/app/data/CarData.dart';
import 'package:pro_exchange2/app/modules/model/model/furniture.dart';
import 'package:pro_exchange2/app/modules/model/model/plot_land.dart';

class FurnitureStoreData {
  int f = 0;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List a = [];
  Future<String> furnitureData1(
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
      FurnitureData furnitureData = FurnitureData(
          Adtitle: Adtitle,
          description: description,
          imgurl: imgurl,
          sell: sell,
          price: price,
          uid1: uid1,
          category: category,
          location: location,
          latitude: latitude,
          searchKey: searchKey

      );
      f++;

      _firestore
          .collection('products')
          .doc('furniture' + f.toString())
          .set(furnitureData.toJson());

      res = "Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
