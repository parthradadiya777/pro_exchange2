import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pro_exchange2/app/routes/app_pages.dart';

import '../../signUp_page/views/auth_file.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  RxInt selectedindex = 1.obs;
  RxInt count = 0.obs;

   GoogleSignIn? googleSignIn;
  var isSignin = false.obs;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;



  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async{
    super.onReady();

    googleSignIn = GoogleSignIn();
   // ever(isSignin, handleAuthChnage);
    isSignin.value = await firebaseAuth.currentUser != null;
    firebaseAuth.authStateChanges().listen((event) {
      isSignin.value = event!=null;

    });
  }
  void signOut() async{
   await AuthMethod().signOut();
  }

  @override
  void onClose() {}

  void increment() => count.value++;


  // void handleAuthChnage(isLoggin) {
  //   if (isLoggin) {
  //     Get.offAllNamed(Routes.HOME, arguments: firebaseAuth.currentUser);
  //   }
  //   else {
  //       Get.offAllNamed(Routes.LOGIN);
  //   }
  // }


}