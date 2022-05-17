import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pro_exchange2/app/modules/add_data_page/car/controllers/car_controller.dart';

class CarData  {
  final String brand;
  final String model;
  final String drop;
  final String year;
  final String state;
  final String km;
  final String toggle;
  final String price;
  final List<String> imgurl;
  final String uid;
  final String address;
  final String category;
  final String sell;
  final String location;
  final String latitude;
  final String searchKey;

  CarData({required this.brand,
    required this.model,
    required this.drop,
    required this.year,
    required this.state,
    required this.km,
    required this.toggle,
    required this.price,
    required this.imgurl,
    required this.uid,
    required this.address,
    required this.category,
    required this.sell,
    required this.location,
    required this.latitude,
    required this.searchKey,








  });

  static CarData fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return CarData(
      brand: snapshot["brand"],
      model: snapshot["model"],
      drop: snapshot["drop"],
      year: snapshot["year"],
      state: snapshot["state"],
      km: snapshot["km"],
      toggle: snapshot['toggle'],
      price: snapshot['price'],
      imgurl: snapshot['imgurl'],
      uid: snapshot['uid'],
      address: snapshot['address'],
      category: snapshot['category'],
      sell: snapshot['sell'],
      location: snapshot['location'],
      latitude: snapshot['latitude'],
      searchKey: snapshot['searchKey'],



    );
  }

  Map<String, dynamic> toJson() =>
      {
        "brand": brand,
        "model": model,
        "drop": drop,
        "year": year,
        "state": state,
        "km": km,
        "toggle":toggle,
        "price":price,
        "imgurl":imgurl,
        "uid":uid,
        "address":address,
        "category":category,
        "sell":sell,
        "location":location,
        "latitude":latitude,
        "searchKey":searchKey,

      };
}