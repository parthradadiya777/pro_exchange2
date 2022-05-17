import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../modules/model/model/electronics/camera.dart';


class CameraStorageData {
  int ca = 0;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> CameraStorageData1(
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
      CameraData cameraData = CameraData(
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
      ca++;

      _firestore
          .collection('products')
          .doc('Camera' + ca.toString())
          .set(cameraData.toJson());

      res = "Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
