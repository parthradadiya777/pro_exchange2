import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:pro_exchange2/app/modules/signUp_page/views/auth_file.dart';

import '../../login/views/login_view.dart';
import '../controllers/sign_up_page_controller.dart';

class SignUpPageView extends GetView<SignUpPageController> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('SignUp'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              height: 100,
              width: MediaQuery.of(context).size.width,
              //  color: Colors.yellow,
              child: Column(
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Pro Exchange',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black)),
                  ])),
                  Text('Exchange your products with other here',
                      style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              //  padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width,
              //color: Colors.yellow,
              child: Column(
                children: [
                  TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'User Name'),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Email'),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Password'),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  MaterialButton(
                    onPressed: () async {
                      //  Get.off(() => HomeView());
                      //     Get.to(HomeView());
                      await AuthMethod()
                          .signUpUser(
                              name: name.text,
                              email: email.text,
                              passsword: password.text)
                          .whenComplete(() => Get.to(LoginView()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: MediaQuery.of(context).size.height * 0.09,
                    width: MediaQuery.of(context).size.width * 1,
                    // color: Colors.yellow,
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Already have an Account?',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold)),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.off(LoginView());
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (_) => SignIn()));
                            },
                          text: '  Sign in',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ))
                    ])),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
