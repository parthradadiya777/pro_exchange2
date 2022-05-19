import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pro_exchange2/app/modules/bottom_navigation_bar/views/bottom_navigation_bar_view.dart';
import 'package:pro_exchange2/app/modules/home/views/home_view.dart';
import 'package:pro_exchange2/app/routes/app_pages.dart';

class AuthProvider {
  Future<bool> loginwithphone(
      BuildContext context, String phone, String name) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    TextEditingController otp = TextEditingController();

    await _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (AuthCredential credential) async {
          UserCredential result = await _auth.signInWithCredential(credential);
          Navigator.pop(context);
          User? user = result.user;
          if (user != null) {
            Get.offNamed(Routes.BOTTOM_NAVIGATION_BAR);
          } else {
            Fluttertoast.showToast(msg: 'user is not signed in');
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          Fluttertoast.showToast(msg: e.toString());
        },
        codeSent: (verificationcode, p) {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text('Enter OTP'),
                  content: Column(
                    children: [
                      TextField(
                        controller: otp,
                      ),
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () async {
                          final code = otp.text;
                          AuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: verificationcode,
                                  smsCode: code);
                          UserCredential result =
                              await _auth.signInWithCredential(credential);
                          User? user = result.user;
                          if (user != null) {
                            var uid = FirebaseAuth.instance.currentUser!.uid;
                            print('--------------------------' + uid);
                            await FirebaseFirestore.instance
                                .collection('user')
                                .doc(uid)
                                .set({
                              'name': name,
                              'number': phone,
                              'image': null,
                              'email': '',
                              'password': '',
                            });

                            Get.offNamed(Routes.BOTTOM_NAVIGATION_BAR);

                            print('success');
                          } else {
                            Fluttertoast.showToast(msg: 'error');
                          }
                        },
                        child: Text('verify'))
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: (id) {});

    return true;
  }
}
