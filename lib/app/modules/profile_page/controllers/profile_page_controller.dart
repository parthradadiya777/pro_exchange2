import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_exchange2/app/modules/home/controllers/home_controller.dart';

import '../edit_profile/views/edit_profile_view.dart';

class ProfilePageController extends GetxController {
  //TODO: Implement ProfilePageController
  HomeController homeController = Get.find<HomeController>();
   User? user;

  final count = 0.obs;
bool change1 = false;
  bool change2 = false;
  bool change3 = false;
  bool change4 = false;

  @override
  void onInit() {
    super.onInit();
    //user = Get.arguments;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;


void loggout()async{
  await homeController.googleSignIn!.disconnect();
  await homeController.firebaseAuth.signOut();
}



}


