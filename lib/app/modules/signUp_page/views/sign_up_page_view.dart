import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pro_exchange2/app/modules/home/views/home_view.dart';

import 'package:pro_exchange2/app/modules/signUp_page/views/auth_file.dart';
import 'package:resize/resize.dart';

import '../../../../Colors/Colors.dart';
import '../../login/views/login_view.dart';
import '../controllers/sign_up_page_controller.dart';

class SignUpPageView extends GetView<SignUpPageController> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Resize(
      builder: (){
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child:   LayoutBuilder(
              builder: (BuildContext context, BoxConstraints viewportConstraints){
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight
                    ),
                    child: IntrinsicHeight(
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Container(
                              width: 15.vh,
                              height: 15.vh,

                              decoration: BoxDecoration(
                                color: textColor,
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Container(
                                  child: FittedBox(
                                    fit:BoxFit.fitWidth,
                                    child: Text('V L X',
                                      style: TextStyle(
                                        color: white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),//120
                            SizedBox(height: 10,),//for logo and text
                            Container(
                              height: 80,
                              width: 80.vw,
                              //  color: Colors.yellow,
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 80.vw,
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text('Verified onLine Xchange',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: textColor,
                                          ),),
                                      ),
                                    ),
                                    Container(
                                      width: 60.vw,
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text('eXchange your products with trust'),
                                      ),
                                    )

                                  ],
                                ),
                              ),
                            ),//60
                            SizedBox(height: 10,),//for app name and tag  line
                            Container(
                              //  padding: EdgeInsets.all(10),
                              height:280,
                              width: 70.vw,
                              //color: Colors.yellow,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: name,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.person,color: textColor,),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),

                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                            color: textColor,
                                            width: 3,
                                          )
                                      ),
                                      hintText: 'User Name',

                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: email,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.email,color: Colors.blueGrey,),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                            color: textColor,
                                            width: 3,
                                          )
                                      ),
                                      hintText: 'Email',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: password,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.key),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15)),
                                      hintText: 'Password',
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                            color: textColor,
                                            width: 3,
                                          )
                                      ),
                                    ),
                                    obscureText: true,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.done,color: textColor,),
                                      Expanded(
                                        child: MaterialButton(
                                          onPressed: () async {
                                              Get.off(() => HomeView());
                                            //   Get.to(HomeView());
                                            await AuthMethod()
                                                .signUpUser(
                                                name: name.text,
                                                email: email.text,
                                                passsword: password.text)
                                                .whenComplete(() => Get.to(LoginView()));
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(right: 0),
                                            width: 35.vw,
                                            height: 12.vw,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: textColor),
                                              borderRadius: BorderRadius.circular(15,),color: textColor,),

                                            child: Center(
                                              child: Container(
                                                width: 15.vw,

                                                child: FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Text('Sign Up',
                                                    style: TextStyle(
                                                      color: white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),//300
                            SizedBox(height: 10,),
                            Container(

                              height: 30 ,
                              width: 80.vw,
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Row(
                                  children: [
                                    Text('Already have an Account?'),
                                    SizedBox(width: 10,),
                                    InkWell(
                                      onTap: (){
                                        Get.off(LoginView());
                                      },
                                      child: Text('Sign In',style: TextStyle(
                                          color: textColor,
                                          fontSize: 20
                                      ),),
                                    ),
                                  ],
                                ),
                              ),
                            ),//30
                            SizedBox(height: 20,)
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },

    );
    // return Scaffold(
    //   resizeToAvoidBottomInset: true,
    //   appBar: AppBar(
    //     title: Text('SignUp'),
    //     centerTitle: true,
    //   ),
    //   body: SingleChildScrollView(
    //     child: Column(
    //       children: [
    //         Container(
    //           margin: EdgeInsets.only(top: 50),
    //           height: 100,
    //           width: MediaQuery.of(context).size.width,
    //           //  color: Colors.yellow,
    //           child: Column(
    //             children: [
    //               RichText(
    //                   text: TextSpan(children: [
    //                 TextSpan(
    //                     text: 'Pro Exchange',
    //                     style: TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: 20,
    //                         color: Colors.black)),
    //               ])),
    //               Text('Exchange your products with other here',
    //                   style: TextStyle(color: Colors.black)),
    //             ],
    //           ),
    //         ),
    //         Container(
    //           margin: EdgeInsets.all(10),
    //           //  padding: EdgeInsets.all(10),
    //           height: MediaQuery.of(context).size.height * 0.45,
    //           width: MediaQuery.of(context).size.width,
    //           //color: Colors.yellow,
    //           child: Column(
    //             children: [
    //               TextFormField(
    //                 controller: name,
    //                 decoration: InputDecoration(
    //                     border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(10)),
    //                     hintText: 'User Name'),
    //               ),
    //               SizedBox(
    //                 height: MediaQuery.of(context).size.height * 0.01,
    //               ),
    //               TextFormField(
    //                 controller: email,
    //                 decoration: InputDecoration(
    //                     border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(10)),
    //                     hintText: 'Email'),
    //               ),
    //               SizedBox(
    //                 height: MediaQuery.of(context).size.height * 0.01,
    //               ),
    //               TextFormField(
    //                 controller: password,
    //                 decoration: InputDecoration(
    //                     border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(10)),
    //                     hintText: 'Password'),
    //               ),
    //               SizedBox(
    //                 height: MediaQuery.of(context).size.height * 0.09,
    //               ),
    //               MaterialButton(
    //                 onPressed: () async {
    //                   //  Get.off(() => HomeView());
    //                   //     Get.to(HomeView());
    //                   await AuthMethod()
    //                       .signUpUser(
    //                           name: name.text,
    //                           email: email.text,
    //                           passsword: password.text)
    //                       .whenComplete(() => Get.to(LoginView()));
    //                 },
    //                 child: Container(
    //                   alignment: Alignment.center,
    //                   height: MediaQuery.of(context).size.height * 0.06,
    //                   width: MediaQuery.of(context).size.width,
    //                   decoration: BoxDecoration(
    //                       border: Border.all(),
    //                       borderRadius: BorderRadius.circular(10)),
    //                   child: Text(
    //                     'Sign Up',
    //                     style: TextStyle(
    //                         color: Colors.black,
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: 20),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         Column(
    //           mainAxisAlignment: MainAxisAlignment.end,
    //           children: [
    //             Center(
    //               child: Container(
    //                 alignment: Alignment.bottomCenter,
    //                 height: MediaQuery.of(context).size.height * 0.09,
    //                 width: MediaQuery.of(context).size.width * 1,
    //                 // color: Colors.yellow,
    //                 child: RichText(
    //                     text: TextSpan(children: [
    //                   TextSpan(
    //                       text: 'Already have an Account?',
    //                       style: TextStyle(
    //                           color: Colors.grey, fontWeight: FontWeight.bold)),
    //                   TextSpan(
    //                       recognizer: TapGestureRecognizer()
    //                         ..onTap = () {
    //                           Get.off(LoginView());
    //                           // Navigator.push(
    //                           //     context,
    //                           //     MaterialPageRoute(
    //                           //         builder: (_) => SignIn()));
    //                         },
    //                       text: '  Sign in',
    //                       style: TextStyle(
    //                         fontSize: 25,
    //                         color: Colors.black,
    //                         fontWeight: FontWeight.bold,
    //                       ))
    //                 ])),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
