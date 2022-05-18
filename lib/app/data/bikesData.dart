import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pro_exchange2/app/data/CarData.dart';
import 'package:pro_exchange2/app/modules/model/model/bikes.dart';
import 'package:pro_exchange2/app/modules/model/model/furniture.dart';
import 'package:pro_exchange2/app/modules/model/model/plot_land.dart';

class BikesStoreData {
  int b = 0;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> BikesData1(
    String brand,
    String year,
    String km,
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
      BikesData bikesData = BikesData(
          brand: brand,
          year: year,
          km: km,
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
      b++;

      _firestore
          .collection('products')
          .doc()
          .set(bikesData.toJson());

      res = "Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
