import 'package:cloud_firestore/cloud_firestore.dart';

class BecomeVerifierData {
  final String name;
  final String age;
  final String address;
  final String phoneNumber;
  final String company;
  final String companydetails;
  final String category_list;
  final String experience;
  final String email;
  final List<String> imgurl;
  final String uid1;
  final String category;
  final String location;
  final String latitude;
  final String searchKey;


  BecomeVerifierData({
    required this.name,
    required this.age,
    required this.address,
    required this.phoneNumber,
    required this.company,
    required this.companydetails,
    required this.category_list,
    required this.experience,
    required this.email,
    required this.imgurl,
    required this.uid1,
    required this.category,
    required this.location,
    required this.latitude,
    required this.searchKey,

});

  static BecomeVerifierData fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String,dynamic>;

    return BecomeVerifierData(name: snapshot['name'],
        age: snapshot['age'],
        address: snapshot['address'],
        phoneNumber: snapshot['phoneNumber'],
        company: snapshot['company'],
        companydetails: snapshot['companydetails'],
      category_list: snapshot['category_list'],
      experience: snapshot['experience'],
        email: snapshot['email'],
        imgurl: snapshot['imgurl'],
      uid1: snapshot['uid1'],
      category: snapshot['category'],
      location: snapshot['location'],
      latitude: snapshot['latitude'],
      searchKey: snapshot['searchKey'],

    );
  }

  Map<String,dynamic> toJson() => {
    "name":name,
    "age":age,
    "address":address,
    "phoneNumber":phoneNumber,
    "company":company,
    "companydetails":companydetails,
    "category_list":category_list,
    "experience":experience,
    "email":email,
    "imgurl":imgurl,
    "uid1":uid1,
    "category":category,
    "location":location,
    "latitude":latitude,
    "searchKey":searchKey,
  };

}