import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pro_exchange2/app/modules/add_data_page/car/controllers/car_controller.dart';

class Computers_leptopData  {
  final String Adtitle;
  final String description;
  final List<String> imgurl;
  final String price;
  final String sell;
  final String uid1;
  final String category;
  final String location;
  final String latitude;
  final String searchKey;


  Computers_leptopData({
    required this.Adtitle,
    required this.description,
    required this.imgurl,
    required this.price,
    required this.sell,
    required this.uid1,
    required this.category,
    required this.location,
    required this.latitude,
    required this.searchKey,

  });

  static Computers_leptopData fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Computers_leptopData(
      Adtitle: snapshot['Adtitle'],
      description: snapshot['description'],
      imgurl: snapshot['imgurl'],
      price: snapshot['price'],
      sell: snapshot['sell'],
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
        "price":price,
        "sell":sell,
        "uid1":uid1,
        "category":category,
        "location":location,
        "latitude":latitude,
        "searchKey":searchKey,

      };
}