import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pro_exchange2/app/modules/home/bindings/home_binding.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options:
           FirebaseOptions(
              appId: '1:985396840281:android:59bf14a71073478016ae48',
              messagingSenderId: '985396840281',
              projectId: 'proexchange-d35f1',
              apiKey: 'AIzaSyBbzFr0MWDy68pbVpZ-0xhi4PC83f7FAq8',
      //  storageBucket: "proexchange.appspot.com",
      )
  );

  HomeBinding().dependencies();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,

    ),
  );
}
