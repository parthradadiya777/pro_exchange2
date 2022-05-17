import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: import_of_legacy_library_into_null_safe
// import 'package:keyboard_visibility/keyboard_visibility.dart';

class BottomNavigationBarController extends GetxController {
  late PageController pagecontroller;
  var currentindex = 0.obs;
  GlobalKey bottomNavigationKey = GlobalKey();
  RxBool keyboropen = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    pagecontroller = PageController();
    // KeyboardVisibilityNotification().addNewListener(onChange: (bool visible) {
    //   keyboropen = visible as RxBool;
    // });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pagecontroller.dispose();
  }

  void increment() => count.value++;
}
