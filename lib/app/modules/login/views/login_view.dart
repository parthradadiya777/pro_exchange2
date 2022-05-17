import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_exchange2/app/modules/home/controllers/home_controller.dart';
import 'package:pro_exchange2/app/modules/login/views/phone_view.dart';
import 'package:pro_exchange2/app/modules/signUp_page/views/auth_file.dart';
import 'package:pro_exchange2/app/routes/app_pages.dart';
import '../../home/views/home_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => LoginController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Column(
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Container(
              margin: EdgeInsets.all(10),
              //  padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.19,
              width: MediaQuery.of(context).size.width,
              //color: Colors.yellow,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.email,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Email'),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  TextFormField(
                    controller: controller.password,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Password'),
                  ),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () async{
                    controller.logginauth();
              },


              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
           RichText(text: TextSpan(
             children: [
               TextSpan(
                 text: 'Don\'t have an Account',
                 style: TextStyle(color: Colors.black)

               ),
               TextSpan(
                 text: ' Sign Up',
                 style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),
                 recognizer: TapGestureRecognizer()..onTap =(){
                   Get.toNamed(Routes.SIGN_UP_PAGE);
                 }
               )
             ]
           )),

            SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                controller.logingoogle();
              },
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipRRect(
                        child: Image.asset(
                      'assets/google.png',
                      height: 50,
                      width: 80,
                    )),
                    Center(
                      child: Container(
                        //color: Colors.yellow,
                        //height: 100,
                        width: MediaQuery.of(context).size.width * 0.47,
                        child: Text(
                          'Continue with the Google',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                Get.to(()=> PhoneView());
              },
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipRRect(
                        child: Image.asset(
                          'assets/phone.png',
                          height: 50,
                          width: 80,
                        )),
                    Center(
                      child: Container(
                        //color: Colors.yellow,
                        //height: 100,
                        width: MediaQuery.of(context).size.width * 0.47,
                        child: Text(
                          'Continue with the Mobile',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.86,
           //   color: Colors.yellow,
              child: Text(
                  'By Proceeding you also agree to the Term of Service and Privacy Policy',
                  textAlign: TextAlign.center),
            ),
          ]),
        ),
      ),
    );
  }
}
