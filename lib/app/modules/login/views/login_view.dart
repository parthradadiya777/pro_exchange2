import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_exchange2/app/modules/home/controllers/home_controller.dart';
import 'package:pro_exchange2/app/modules/login/views/phone_view.dart';
import 'package:pro_exchange2/app/modules/signUp_page/views/auth_file.dart';
import 'package:pro_exchange2/app/routes/app_pages.dart';
import 'package:resize/resize.dart';
import '../../../../Colors/Colors.dart';
import '../../home/views/home_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => LoginController());

    return Resize(builder: (){
      return Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: AppBar(
        //   title: Text('Login'),
        //   centerTitle: true,
        // ),
        body: SafeArea(
          child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints:
                  BoxConstraints(minHeight: viewportConstraints.maxHeight),
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
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      'V L X',
                                      style: TextStyle(
                                        color: white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
                                        child: Text(
                                          'Verified onLine Xchange',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: textColor),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 60.vw,
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child:
                                        Text('eXchange your products with trust'),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              height: 200,
                              width: 70.vw,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: controller.email,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.mail_outline,color: textColor,),
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
                                      hintText: 'Email',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: controller.password,
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.key_outlined,color: textColor,),
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
                                        hintText: 'Password'),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.done),
                                      Expanded(
                                        child: MaterialButton(
                                          onPressed: () async {
                                            controller.logginauth();
                                          },
                                          child: Container(

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
                                                  child: Text('Sign In',
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
                            ),
                            SizedBox(height: 10,),
                            Container(
                              height:30,
                              width: 80.vw,
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Row(
                                  children: [
                                    Text('Dont have an Account?'),
                                    SizedBox(width: 10,),
                                    InkWell(
                                      onTap: (){
                                        Get.toNamed(Routes.SIGN_UP_PAGE);
                                      },
                                      child: Text('Sign Up',style: TextStyle(
                                          color: textColor,
                                          fontSize: 20
                                      ),),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              height: 120,
                              width: 90.vw,
                              child: Column(
                                children: [
                                  MaterialButton(
                                    onPressed: () {
                                      controller.logingoogle();
                                    },
                                    child: Row(
                                      children: [
                                        FittedBox(
                                          fit: BoxFit.fitHeight,
                                          child: ClipRRect(
                                              child: Image.asset(
                                                'assets/google.png',
                                                height: 50,
                                                width: 80,
                                              )),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 0),
                                          width: 50.vw,
                                          height: 12.vw,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: textColor),
                                            borderRadius: BorderRadius.circular(15,),color:textColor,),
                                          child: Center(
                                            child: Container(
                                              width: 35.vw,
                                              child: FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Text('Sign In With Google',
                                                  style: TextStyle(
                                                    color: white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // MaterialButton(
                                  //   onPressed: () {
                                  //     controller.logingoogle();
                                  //   },
                                  //   child: Container(
                                  //     alignment: Alignment.center,
                                  //     height: MediaQuery.of(context).size.height * 0.06,
                                  //     width: MediaQuery.of(context).size.width,
                                  //     decoration: BoxDecoration(
                                  //         border: Border.all(color: Colors.blueGrey),
                                  //         borderRadius: BorderRadius.circular(10)),
                                  //     child: Row(
                                  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  //       children: [
                                  //         ClipRRect(
                                  //             child: Image.asset(
                                  //               'assets/google.png',
                                  //               height: 50,
                                  //               width: 80,
                                  //             )),
                                  //         Center(
                                  //           child: Container(
                                  //             //color: Colors.yellow,
                                  //             //height: 100,
                                  //             width:
                                  //             MediaQuery.of(context).size.width * 0.47,
                                  //             child: Text(
                                  //               'Sign Up with Google',
                                  //               style: TextStyle(
                                  //                   color: Colors.blueGrey,
                                  //                   fontWeight: FontWeight.bold,
                                  //                   fontSize: 15),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                  SizedBox(height: 10,),
                                  MaterialButton(
                                    onPressed: () {
                                      Get.to(()=> PhoneView());
                                    },
                                    child: Row(
                                      children: [
                                        FittedBox(
                                          fit: BoxFit.fitHeight,
                                          child:  ClipRRect(
                                              child: Image.asset(
                                                'assets/phone.png',
                                                height: 40,
                                                width: 80,
                                              )),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 0),
                                          width: 50.vw,
                                          height: 12.vw,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: textColor),
                                            borderRadius: BorderRadius.circular(15,),color: textColor,),

                                          child: Center(
                                            child: Container(
                                              width: 35.vw,

                                              child: FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Text('Sign In With Phone',
                                                  style: TextStyle(
                                                    color: white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // MaterialButton(
                                  //   onPressed: () {},
                                  //   child: Container(
                                  //     alignment: Alignment.center,
                                  //     height: MediaQuery.of(context).size.height * 0.06,
                                  //     width: MediaQuery.of(context).size.width,
                                  //     decoration: BoxDecoration(
                                  //         border: Border.all(),
                                  //         borderRadius: BorderRadius.circular(10)),
                                  //     child: Row(
                                  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  //       children: [
                                  //         ClipRRect(
                                  //             child: Image.asset(
                                  //               'assets/phone.png',
                                  //               height: 50,
                                  //               width: 80,
                                  //             )),
                                  //         Center(
                                  //           child: Container(
                                  //             //color: Colors.yellow,
                                  //             //height: 100,
                                  //             width:
                                  //             MediaQuery.of(context).size.width * 0.47,
                                  //             child: Text(
                                  //               'Continue with the Mobile',
                                  //               style: TextStyle(
                                  //                   color: Colors.black,
                                  //                   fontWeight: FontWeight.bold,
                                  //                   fontSize: 15),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),


                                  // Container(
                                  //   alignment: Alignment.bottomCenter,
                                  //   height: 10.vh,
                                  //   width: MediaQuery.of(context).size.width * 0.86,
                                  //   //   color: Colors.yellow,
                                  //   child: Text(
                                  //       'By Proceeding you also agree to the Term of Service and Privacy Policy',
                                  //       textAlign: TextAlign.center),
                                  // ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(

                              height:30,
                              width: 70.vw,
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:CrossAxisAlignment.center ,
                                      children: [
                                        Text('By Proceeding you also agree to '),
                                        Text(' the Term of Service and Privacy Policy'),
                                      ],
                                    ),


                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20,)
                          ]),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        // body: SingleChildScrollView(

        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Column(children: [
        //       SizedBox(
        //         height: MediaQuery.of(context).size.height * 0.08,
        //       ),
        //       Column(
        //         children: [
        //           RichText(
        //               text: TextSpan(children: [
        //                 TextSpan(
        //                     text: 'Pro Exchange',
        //                     style: TextStyle(
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: 20,
        //                         color: Colors.black)),
        //               ])),
        //           Text('Exchange your products with other here',
        //               style: TextStyle(color: Colors.black)),
        //         ],
        //       ),
        //       SizedBox(
        //         height: MediaQuery.of(context).size.height * 0.08,
        //       ),
        //       Container(
        //         margin: EdgeInsets.all(10),
        //         //  padding: EdgeInsets.all(10),
        //         height: MediaQuery.of(context).size.height * 0.19,
        //         width: MediaQuery.of(context).size.width,
        //         //color: Colors.yellow,
        //         child: Column(
        //           children: [
        //             TextFormField(
        //               controller: controller.email,
        //               decoration: InputDecoration(
        //                   border: OutlineInputBorder(
        //                       borderRadius: BorderRadius.circular(10)),
        //                   hintText: 'Email'),
        //             ),
        //             SizedBox(
        //               height: MediaQuery.of(context).size.height * 0.01,
        //             ),
        //             TextFormField(
        //               controller: controller.password,
        //               decoration: InputDecoration(
        //                   border: OutlineInputBorder(
        //                       borderRadius: BorderRadius.circular(10)),
        //                   hintText: 'Password'),
        //             ),
        //           ],
        //         ),
        //       ),
        //       MaterialButton(
        //         onPressed: () async{
        //           controller.logginauth();
        //         },
        //
        //
        //         child: Container(
        //           alignment: Alignment.center,
        //           height: MediaQuery.of(context).size.height * 0.06,
        //           width: MediaQuery.of(context).size.width,
        //           decoration: BoxDecoration(
        //               border: Border.all(),
        //               borderRadius: BorderRadius.circular(10)),
        //           child: Text(
        //             'Login',
        //             style: TextStyle(
        //                 color: Colors.black,
        //                 fontWeight: FontWeight.bold,
        //                 fontSize: 20),
        //           ),
        //         ),
        //       ),
        //       SizedBox(
        //         height: 20,
        //       ),
        //       RichText(text: TextSpan(
        //           children: [
        //             TextSpan(
        //                 text: 'Don\'t have an Account',
        //                 style: TextStyle(color: Colors.black)
        //
        //             ),
        //             TextSpan(
        //                 text: ' Sign Up',
        //                 style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),
        //                 recognizer: TapGestureRecognizer()..onTap =(){
        //                   Get.toNamed(Routes.SIGN_UP_PAGE);
        //                 }
        //             )
        //           ]
        //       )),
        //
        //       SizedBox(
        //         height: 20,
        //       ),
        //       MaterialButton(
        //         onPressed: () {
        //           controller.logingoogle();
        //         },
        //         child: Container(
        //           alignment: Alignment.center,
        //           height: MediaQuery.of(context).size.height * 0.06,
        //           width: MediaQuery.of(context).size.width,
        //           decoration: BoxDecoration(
        //               border: Border.all(),
        //               borderRadius: BorderRadius.circular(10)),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceAround,
        //             children: [
        //               ClipRRect(
        //                   child: Image.asset(
        //                     'assets/google.png',
        //                     height: 50,
        //                     width: 80,
        //                   )),
        //               Center(
        //                 child: Container(
        //                   //color: Colors.yellow,
        //                   //height: 100,
        //                   width: MediaQuery.of(context).size.width * 0.47,
        //                   child: Text(
        //                     'Continue with the Google',
        //                     style: TextStyle(
        //                         color: Colors.black,
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: 15),
        //                   ),
        //                 ),
        //               ),
        //
        //             ],
        //           ),
        //         ),
        //       ),
        //       SizedBox(
        //         height: 20,
        //       ),
        //       MaterialButton(
        //         onPressed: () {
        //           Get.to(()=> PhoneView());
        //         },
        //         child: Container(
        //           alignment: Alignment.center,
        //           height: MediaQuery.of(context).size.height * 0.06,
        //           width: MediaQuery.of(context).size.width,
        //           decoration: BoxDecoration(
        //               border: Border.all(),
        //               borderRadius: BorderRadius.circular(10)),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceAround,
        //             children: [
        //               ClipRRect(
        //                   child: Image.asset(
        //                     'assets/phone.png',
        //                     height: 50,
        //                     width: 80,
        //                   )),
        //               Center(
        //                 child: Container(
        //                   //color: Colors.yellow,
        //                   //height: 100,
        //                   width: MediaQuery.of(context).size.width * 0.47,
        //                   child: Text(
        //                     'Continue with the Mobile',
        //                     style: TextStyle(
        //                         color: Colors.black,
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: 15),
        //                   ),
        //                 ),
        //               ),
        //
        //             ],
        //           ),
        //         ),
        //       ),
        //       Container(
        //         alignment: Alignment.bottomCenter,
        //         height: MediaQuery.of(context).size.height * 0.1,
        //         width: MediaQuery.of(context).size.width * 0.86,
        //         //   color: Colors.yellow,
        //         child: Text(
        //             'By Proceeding you also agree to the Term of Service and Privacy Policy',
        //             textAlign: TextAlign.center),
        //       ),
        //     ]),
        //   ),
        // ),


      );
    },

    );
  }
}
