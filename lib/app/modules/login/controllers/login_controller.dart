import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pro_exchange2/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../bottom_navigation_bar/views/bottom_navigation_bar_view.dart';
import '../../home/views/home_view.dart';
import '../../signUp_page/views/auth_file.dart';


class LoginController extends GetxController {
  //TODO: Implement LoginController

  HomeController homeController = Get.find<HomeController>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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


void logingoogle() async{
  CustomFullScreenDialog.showDialog();
  print('object');
  GoogleSignInAccount? googleSignInAccount = await homeController.googleSignIn?.signIn();
  print(googleSignInAccount);
  try {
    if(googleSignInAccount != null){
      GoogleSignInAuthentication? googleSignInAuthentication = await googleSignInAccount.authentication;
      OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken
      );
      await homeController.firebaseAuth.signInWithCredential(oAuthCredential);
      CustomFullScreenDialog.showDialog();

    }
    else{
      CustomFullScreenDialog.cancelDialog();
    }
  } on PlatformException catch(e) {
    print('platform excetion:' + e.toString());

    // TODO
  } catch (e){
    print(e.toString());
  }
  }
  void logginauth() async{
    String res = await AuthMethod().logginUser(email: email.text, passsword: password.text);
    if(res == 'Success'){
     //  Get.to(()=> BottomNavigationBarView());
      Get.off(BottomNavigationBarView());
      print(res);

    }else{
      print('something went worng');
      print(res);
    }
  }





}
class CustomFullScreenDialog {
  static void showDialog() {
    Get.dialog(
      WillPopScope(
        child: Container(
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.yellowAccent),
            ),
          ),
        ),
        onWillPop: () => Future.value(false),
      ),
      barrierDismissible: false,
      barrierColor: Color(0xff141A31).withOpacity(.3),
      useSafeArea: true,
    );
  }

  static void cancelDialog() {
    Get.back();
  }
}