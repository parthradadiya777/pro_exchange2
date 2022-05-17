import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../modules/model/model/electronics/others.dart';

class OthersStorageData {
  int o = 0;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> OthersStorageData1(
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
      OthersData computers_leptopData = OthersData(
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
      o++;

      _firestore
          .collection('products')
          .doc('others' + o.toString())
          .set(computers_leptopData.toJson());

      res = "Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
