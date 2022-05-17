import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pro_exchange2/app/modules/add_data_page/car/controllers/car_controller.dart';

class FurnitureData  {
  final String Adtitle;
  final String description;
  final List<String> imgurl;
  final String sell;
  final String price;
  final String uid1;
  final String category;
  final String location;
  final String latitude;
  final String searchKey;





  FurnitureData({
    required this.Adtitle,
    required this.description,
    required this.imgurl,
    required this.sell,
    required this.price,
    required this.uid1,
    required this.category,
    required this.location,
    required this.latitude,
    required this.searchKey,





  });

  static FurnitureData fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return FurnitureData(
      Adtitle: snapshot['Adtitle'],
      description: snapshot['description'],
      imgurl: snapshot['imgurl'],
      sell: snapshot['sell'],
      price: snapshot['price'],
      uid1: snapshot['uid1'],
      category: snapshot['category'],
      location: snapshot['location'],
      latitude: snapshot['latitude'],
      searchKey: snapshot['searchKey'],


    );
  }

  Map<String, dynamic> toJson() =>
      {
        "Adtitle":Adtitle,
        "description":description,
        "imgurl":imgurl,
        "sell":sell,
        "price":price,
        "uid1":uid1,
        "category":category,
        "location":location,
        "latitude":latitude,
        "searchKey":searchKey,


      };
}