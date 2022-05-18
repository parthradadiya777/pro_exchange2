import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pro_exchange2/app/data/CarData.dart';
import 'package:pro_exchange2/app/modules/model/model/plot_land.dart';

class PlotStoreData {
  int p = 0;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List a = [];
  Future<String> Propertdata1(
      String type,
      String listed,
      String plotArea,
      String length,
      String breadth,
      String facing,
      String projectname,
      String Adtitle,
      String description,
      List<String> imgurl,
      String price,
      String sell,
      String uid1,
      String category,
      String location,
      String latitude,
      String searchKey,

      ) async {
    String res = 'Something error occured';
    try {
      PlotData plotData = PlotData(
          type: type,
          listed: listed,
          plotArea: plotArea,
          length: length,
          breadth: breadth,
          facing: facing,
          projectname: projectname,
          Adtitle: Adtitle,
          description: description,
          imgurl: imgurl,
          price: price,
          sell: sell,
          uid1: uid1,
          category: category,
          location: location,
          latitude: latitude,
          searchKey: searchKey

      );
      // HouseData houseData HouseData(, bedrooms, bathrooms, furnishing, construction, listed, superbuiltuparea, carpeetarea, maintenance, totalfloors, facing, projectname, Adtitle, description, sell, price, imgurl, uid);
      p++;

      _firestore
          .collection('products')
          .doc()
          .set(plotData.toJson());

      res = "Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
