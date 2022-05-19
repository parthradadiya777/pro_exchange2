import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import '../modules/model/model/cardata.dart';
import '../modules/model/model/houseData.dart';

int l = 0;
class CarStoreData {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List a = [];
  Future<String> saveData(
      String brand,
      String model,
      String drop,
      String year,
      String state,
      String km,
      String toggle,
      String price,
      List<String> imageUrl,
      String uid,
      String address,
      String car,
      String sell,
      String location,
      String latitude,
      String searchKey,

      ) async {
    String res = 'Something error occured';
    try {
      CarData carData = CarData(
        brand: brand,
        model: model,
        drop: drop,
        year: year,
        state: state,
        km: km,
        toggle: toggle,
        price: price,
        imgurl: imageUrl,
        uid: uid,
          address: address,
        category: car,
        sell: sell,
          location: location,
        latitude: latitude,
          searchKey: searchKey

      );
      l++;
      _firestore
          .collection('products/car')
          .doc()
          .set(carData.toJson());
      res = "Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}



