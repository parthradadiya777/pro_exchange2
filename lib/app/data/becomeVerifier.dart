import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pro_exchange2/app/data/CarData.dart';
import 'package:pro_exchange2/app/modules/model/model/bikes.dart';
import 'package:pro_exchange2/app/modules/model/model/furniture.dart';
import 'package:pro_exchange2/app/modules/model/model/plot_land.dart';

import '../modules/model/model/BecomeVerifier.dart';

class BecomeVerifierStoreData {
  int become = 0;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> BecomeVeriferData1(
    String name,
    String age,
    String address,
    String phoneNumber,
    String company,
    String companydetails,
    String category_list,
    String experience,
    String email,
    List<String> imgurl,
    String uid1,
    String category,
    String location,
    String latitude,
    String searchKey,
  ) async {
    String res = 'Something error occured';
    try {
      BecomeVerifierData becomeVerifierData = BecomeVerifierData(
          name: name,
          age: age,
          address: address,
          phoneNumber: phoneNumber,
          company: company,
          companydetails: companydetails,
          category_list: category,
          experience: experience,
          email: email,
          imgurl: imgurl,
          uid1: uid1,
          category: category_list,
          location: location,
          latitude: latitude,
          searchKey: searchKey);
      become++;

      _firestore
          .collection('Verifier')
          .doc()
          .set(becomeVerifierData.toJson());

      res = "Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
