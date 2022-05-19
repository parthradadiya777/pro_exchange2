import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

import '../modules/model/model/houseData.dart';

class HouseStoreData {
  int h =0;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List a = [];
  Future<String> HouseData1(
      String type,
      String bedrooms,
      String bathrooms,
      String furnishing,
      String construction,
      String listed,
      String superbuiltuparea,
      String carpeetarea,
      String maintenance,
      String totalfloors,
      String facing,
      String projectname,
      String Adtitle,
      String description,
      String sell,
      String price,
      List<String> imgurl,
      String uid1,
      String house,
          String location,
  String latitude,
      String searchKey,


      ) async {
    String res = 'Something error occured';
    try {
      HouseData houseData = HouseData(
          type: type,
          bedrooms: bedrooms,
          bathrooms: bathrooms,
          furnishing: furnishing,
          construction: construction,
          listed: listed,
          superbuiltuparea: superbuiltuparea,
          carpeetarea: carpeetarea,
          maintenance: maintenance,
          totalfloors: totalfloors,
          facing: facing,
          projectname: projectname,
          Adtitle: Adtitle,
          description: description,
          sell: sell,
          price: price,
          imgurl: imgurl,
          uid1:uid1,
          category: house,
  location: location,
  latitude: latitude,
          searchKey: searchKey


      );
      // HouseData houseData HouseData(, bedrooms, bathrooms, furnishing, construction, listed, superbuiltuparea, carpeetarea, maintenance, totalfloors, facing, projectname, Adtitle, description, sell, price, imgurl, uid);
      h++;

      _firestore
          .collection('products')
          .doc()
          .set(
          houseData.toJson()
      );

      String uid = Uuid().v1();

      res = "Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}