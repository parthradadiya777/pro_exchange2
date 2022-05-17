import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pro_exchange2/app/modules/add_data_page/car/controllers/car_controller.dart';

class HouseData  {
  final String type;
  final String bedrooms;
  final String bathrooms;
  final String furnishing;
  final String construction;
  final String listed;
  final String superbuiltuparea;
  final String carpeetarea;
  final String maintenance;
  final String totalfloors;
  final String facing;
  final String projectname;
  final String Adtitle;
  final String description;
  final String sell;
  final String price;
  final List<String> imgurl;
  final String uid1;
  final String category;
  final String location;
  final String latitude;
  final String searchKey;





  HouseData({required this.type,
    required this.bedrooms,
    required this.bathrooms,
    required this.furnishing,
    required this.construction,
    required this.listed,
    required this.superbuiltuparea,
    required this.carpeetarea,
    required this.maintenance,
    required this.totalfloors,
    required this.facing,
    required this.projectname,
    required this.Adtitle,
    required this.description,
    required this.sell,
    required this.price,
    required this.imgurl,
    required this.uid1,
    required this.category,
    required this.location,
    required this.latitude,
    required this.searchKey,






  });

  static HouseData fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return HouseData(
      type: snapshot["type"],
      bedrooms: snapshot["bedrooms"],
      bathrooms: snapshot["bathrooms"],
      furnishing: snapshot["furnishing"],
      construction: snapshot["construction"],
      listed: snapshot["listed"],
      superbuiltuparea: snapshot['superbuiltuparea'],
      carpeetarea: snapshot['carpeetarea'],
      maintenance: snapshot['maintenance'],
      totalfloors: snapshot['totalfloors'],
      facing: snapshot['facing'],
      projectname: snapshot['projectname'],
      Adtitle: snapshot['Adtitle'],
      description: snapshot['description'],
      sell: snapshot['sell'],
      price: snapshot['price'],
      imgurl: snapshot['imgurl'],
      uid1: snapshot['uid1'],
      category: snapshot['category'],
      location: snapshot['location'],
      latitude: snapshot['latitude'],
      searchKey: snapshot['searchKey'],

    );
  }

  Map<String, dynamic> toJson() =>
      {
        "type": type,
        "bedrooms": bedrooms,
        "bathrooms": bathrooms,
        "furnishing": furnishing,
        "construction": construction,
        "listed": listed,
        "superbuiltuparea": superbuiltuparea,
        "carpeetarea": carpeetarea,
        "maintenance":maintenance,
        "totalfloors":totalfloors,
        "facing":facing,
        "projectname":projectname,
        "Adtitle":Adtitle,
        "description":description,
        "sell":sell,
        "price":price,
        "imgurl":imgurl,
        "uid1":uid1,
        "category":category,
        "location":location,
        "latitude":latitude,
        "searchKey":searchKey,







      };
}