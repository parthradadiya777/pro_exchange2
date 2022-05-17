import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SearchPageController extends GetxController {
  //TODO: Implement SearchPageController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;


  Future getData(String collection) async{

   final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
   QuerySnapshot snapshot  = await firebaseFirestore.collection(collection).get();
   return snapshot.docs;
  }
  Future queryData(String queryString)async{

    return FirebaseFirestore.instance.collection('products').where('category',isEqualTo: queryString).get();
  }
}
