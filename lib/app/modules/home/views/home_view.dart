import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_exchange2/app/modules/category/flats/views/flats_view.dart';
import 'package:pro_exchange2/app/modules/home/details/views/details_view.dart';
import 'package:pro_exchange2/app/routes/app_pages.dart';
import 'package:resize/resize.dart';
import '../../../../Colors/Colors.dart';
import '../../buy_page/views/buy_page_view.dart';
import '../../category/electronicscategory/views/electronics_view.dart';
import '../../category/property/views/property_view.dart';
import '../../category/search_page/views/search_page_view.dart';
import '../../category/vehicles/views/vehicles_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isthere = true;
  @override
  Widget build(BuildContext context) {

    Get.put(HomeController());
    return Resize(builder: (){
      return  Scaffold(

          body: SafeArea(
            child: LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        Container(
                          color: backGround,
                          height: 180,
                          width: 100.vw,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0, top: 10),
                                child: Text(
                                  'Categories',
                                  style: TextStyle(
                                      color:textColor ,
                                      fontSize: MediaQuery.of(context).size.height * 0.025,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                height: 100,
                                width: 100.vw,
                                decoration: BoxDecoration(
                                  //color: Colors.amber,
                                ),
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: backGround,
                                            border: Border.all(color: textColor,width: 4),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          margin: EdgeInsets.all(10),
                                          //   padding: EdgeInsets.all(10),
                                          height: 50,
                                          width: 50,
                                          child: IconButton(
                                              onPressed: () {
                                                Get.to(() => FlatsView());
                                              },
                                              icon: Icon(Icons.home,color: textColor,)),
                                        ),
                                        Text('Flats',style: TextStyle(fontWeight: FontWeight.bold,color: textColor),),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: backGround,
                                            border: Border.all(color: textColor,width: 4),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          margin: EdgeInsets.all(10),
                                          //   padding: EdgeInsets.all(10),
                                          height: 50,
                                          width: 50,
                                          child: IconButton(
                                              onPressed: () {
                                                Get.to(() => VehiclesView());
                                              },
                                              icon: Icon(Icons.pedal_bike,color: textColor,)),
                                        ),
                                        Text('Vehicles',style: TextStyle(fontWeight: FontWeight.bold,color: textColor),),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: backGround,
                                            border: Border.all(color: textColor,width: 4),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          margin: EdgeInsets.all(10),
                                          //   padding: EdgeInsets.all(10),
                                          height: 50,
                                          width: 50,
                                          child: IconButton(
                                              onPressed: () {
                                                Get.to(() => ElectronicsView());
                                              },
                                              icon: Icon(Icons.electrical_services_sharp,color: textColor,)),
                                        ),
                                        Text('electonics',style: TextStyle(fontWeight: FontWeight.bold,color: textColor),),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: backGround,
                                            border: Border.all(color: textColor,width: 4),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          margin: EdgeInsets.all(10),
                                          //   padding: EdgeInsets.all(10),
                                          height: 50,
                                          width: 50,
                                          child: IconButton(
                                              onPressed: () {
                                                Get.to(() => PropertyItemView());
                                              },
                                              icon: Icon(Icons.bedroom_child_outlined,color: textColor,)),
                                        ),
                                        Text('property',style: TextStyle(fontWeight: FontWeight.bold,color: textColor),),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: backGround,
                                            border: Border.all(color: textColor,width: 4),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          margin: EdgeInsets.all(10),
                                          //   padding: EdgeInsets.all(10),
                                          height: 50,
                                          width: 50,
                                          child: IconButton(
                                              onPressed: () {
                                                // Get.toNamed(Routes.SEARCH_PAGE);
                                                Get.to(()=> SearchPageView());
                                              },
                                              icon: Icon(Icons.search,color: textColor,)),
                                        ),
                                        Text('Search',style: TextStyle(fontWeight: FontWeight.bold,color: textColor),),
                                      ],
                                    ),
                                    // Column(
                                    //   children: [
                                    //     Container(
                                    //       decoration: BoxDecoration(
                                    //         color: Colors.white,
                                    //         border:
                                    //         Border.all(color: Colors.blue),
                                    //         borderRadius:
                                    //         BorderRadius.circular(10),
                                    //       ),
                                    //       margin: EdgeInsets.all(10),
                                    //       //   padding: EdgeInsets.all(10),
                                    //       height: 50,
                                    //       width: 50,
                                    //       child: IconButton(
                                    //           onPressed: () {
                                    //             Get.to(() => FlatsView());
                                    //           },
                                    //           icon: Icon(Icons.home)),
                                    //     ),
                                    //     Text('Flats'),
                                    //   ],
                                    // ),
                                    // Column(
                                    //   children: [
                                    //     Container(
                                    //       decoration: BoxDecoration(
                                    //         color: Colors.white,
                                    //         border:
                                    //         Border.all(color: Colors.blue),
                                    //         borderRadius:
                                    //         BorderRadius.circular(10),
                                    //       ),
                                    //       margin: EdgeInsets.all(10),
                                    //       height: 50,
                                    //       width: 50,
                                    //       child: IconButton(
                                    //           onPressed: () {
                                    //             Get.to(() => VehiclesView());
                                    //           },
                                    //           icon: Icon(Icons.pedal_bike)),
                                    //     ),
                                    //     Text('Vehicles'),
                                    //   ],
                                    // ),
                                    // Column(
                                    //   children: [
                                    //     Container(
                                    //       decoration: BoxDecoration(
                                    //         color: Colors.white,
                                    //         border:
                                    //         Border.all(color: Colors.blue),
                                    //         borderRadius:
                                    //         BorderRadius.circular(10),
                                    //       ),
                                    //       margin: EdgeInsets.all(10),
                                    //       height: 50,
                                    //       width: 50,
                                    //       child: IconButton(
                                    //           onPressed: () {
                                    //             Get.to(() => ElectronicsView());
                                    //           },
                                    //           icon: Icon(Icons
                                    //               .electrical_services_sharp)),
                                    //     ),
                                    //     Text('electonics'),
                                    //   ],
                                    // ),
                                    // Column(
                                    //   children: [
                                    //     Container(
                                    //       decoration: BoxDecoration(
                                    //         color: Colors.white,
                                    //         border:
                                    //         Border.all(color: Colors.blue),
                                    //         borderRadius:
                                    //         BorderRadius.circular(10),
                                    //       ),
                                    //       margin: EdgeInsets.all(10),
                                    //       height: 50,
                                    //       width: 50,
                                    //       child: IconButton(
                                    //           onPressed: () {
                                    //             Get.to(() => PropertyItemView());
                                    //           },
                                    //           icon: Icon(
                                    //               Icons.bedroom_child_outlined)),
                                    //     ),
                                    //     Text('property'),
                                    //   ],
                                    // ),
                                    // Column(
                                    //   children: [
                                    //     Container(
                                    //       decoration: BoxDecoration(
                                    //         color: Colors.white,
                                    //         border:
                                    //         Border.all(color: Colors.blue),
                                    //         borderRadius:
                                    //         BorderRadius.circular(10),
                                    //       ),
                                    //       margin: EdgeInsets.all(10),
                                    //       //   padding: EdgeInsets.all(10),
                                    //       height: 50,
                                    //       width: 50,
                                    //       child: IconButton(
                                    //           onPressed: () {
                                    //             Get.to(()=> SearchPageView());
                                    //           },
                                    //           icon: Icon(Icons.search)),
                                    //     ),
                                    //     Text('Search'),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                              // Container(
                              //   decoration: BoxDecoration(
                              //       border: Border.all(
                              //         color: Colors.black87,
                              //       )),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       Expanded(
                              //         child: Container(
                              //           alignment: Alignment.center,
                              //           height: 30,
                              //           decoration: BoxDecoration(
                              //             //  color: Colors.pink,
                              //             border: Border.all(color: Colors.black87),
                              //             borderRadius: BorderRadius.circular(1),
                              //           ),
                              //           child: MaterialButton(
                              //             onPressed: () {
                              //               Get.to(BuyPageView());
                              //             },
                              //             child: Text('Buy'),
                              //           ),
                              //         ),
                              //       ),
                              //       Expanded(
                              //         child: Container(
                              //           alignment: Alignment.center,
                              //           height: 30,
                              //           decoration: BoxDecoration(
                              //             //  color: Colors.pink,
                              //             border: Border.all(color: Colors.black87),
                              //             borderRadius: BorderRadius.circular(1),
                              //           ),
                              //           child: MaterialButton(
                              //             onPressed: () {
                              //               Get.to(BuyPageView());
                              //             },
                              //             child: Text('Exchange'),
                              //           ),
                              //         ),
                              //       ),
                              //       Expanded(
                              //         child: Container(
                              //           alignment: Alignment.center,
                              //           height: 30,
                              //           decoration: BoxDecoration(
                              //             //  color: Colors.pink,
                              //             border: Border.all(color: Colors.black87),
                              //             borderRadius: BorderRadius.circular(1),
                              //           ),
                              //           child: MaterialButton(
                              //             onPressed: () {
                              //               Get.to(BuyPageView());
                              //             },
                              //             child: Text('Bid'),
                              //           ),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              Container(
                                height: 30,
                                width: 100.vw,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 30,
                                        margin: EdgeInsets.only(left: 10,right: 5),
                                        decoration: BoxDecoration(
                                          color: textColor,
                                          //  color: Colors.pink,
                                          border: Border.all(color: textColor,width: 3),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: MaterialButton(
                                          onPressed: () {
                                            Get.to(BuyPageView());
                                          },
                                          child: Text('Sale',style: TextStyle(color: white,fontWeight: FontWeight.bold),),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 5,right: 5),
                                        alignment: Alignment.center,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: textColor,
                                          //  color: Colors.pink,
                                          border: Border.all(color: textColor,width: 3),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: MaterialButton(
                                          onPressed: () {
                                            Get.to(BuyPageView());
                                          },
                                          child: Text('Exchange',style: TextStyle(color: white,fontWeight: FontWeight.bold),),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 5,right: 10),
                                        alignment: Alignment.center,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: textColor,
                                          //  color: Colors.pink,
                                          border: Border.all(color: textColor,width: 3),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: MaterialButton(
                                          onPressed: () {
                                            Get.to(BuyPageView());
                                          },
                                          child: Text('Auction',style: TextStyle(color: white,fontWeight: FontWeight.bold),),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(color: textColor,thickness: 2),
                        Container(
                          height: 30,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only( top: 5,left:10),
                          child: Text(
                            'All Products',
                            style: TextStyle(

                                color:textColor ,
                                fontSize: MediaQuery.of(context).size.height * 0.025,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height*1-320,

                          width: 100.vw,
                          //    color: Colors.yellow,
                          child: StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('products')
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                //    if (!snapshot.hasError) return new Text('Loading...');
                                if (snapshot.hasData) {
                                  final docs = snapshot.data?.docs;
                                  return GridView.builder(
                                      shrinkWrap: true,
                                      clipBehavior: Clip.hardEdge,
                                      itemCount: docs!.length,
                                      gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10,
                                          mainAxisExtent: 250),
                                      itemBuilder: (context, index) {
                                        String img =snapshot.data!.docs[index]['imgurl'][0];
                                        List<dynamic> images =snapshot.data!.docs[index]['imgurl'] as List<dynamic>;
                                        String title = snapshot.data!.docs[index]['Adtitle'];
                                        String sell = snapshot.data!.docs[index]['sell'];

                                        return InkWell(
                                          onTap: (){
                                            Get.toNamed(Routes.DETAILS,arguments: {
                                              'images':images,
                                              'Adtitle':title,
                                              'sell':sell,
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(1),
                                                border: Border.all(
                                                    color: textColor,width: 3)),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        height: 20,
                                                        decoration: BoxDecoration(
                                                          color: textColor,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                          children: [
                                                            Text('Verified :',
                                                              style: TextStyle(color: white,fontWeight: FontWeight.bold),
                                                            ),
                                                            Text('No',
                                                              style: TextStyle(color: white,fontWeight: FontWeight.bold),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 20,
                                                        decoration: BoxDecoration(
                                                          color: textColor,
                                                        ),
                                                        child: MaterialButton(
                                                            onPressed: () {
                                                              controller.increment();
                                                            },
                                                            child: Row(
                                                              children: [
                                                                Text('Vote :',
                                                                    style: TextStyle(color: white,fontWeight: FontWeight.bold)),
                                                                Obx(() {
                                                                  return Text(controller.count.value.toString(),
                                                                      style: TextStyle(color: white,fontWeight: FontWeight.bold)
                                                                  );

                                                                }),
                                                              ],
                                                            )),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Expanded(
                                                    flex: 7,
                                                    child: Container(
                                                      width: 45.vw,
                                                      height: 50.vh,
                                                      alignment: Alignment.center,
                                                      color: white,
                                                      child: ListView(
                                                        scrollDirection: Axis.horizontal,
                                                        children: [
                                                          Container(
                                                              alignment: Alignment.center,
                                                            width: 45.vw,
                                                              // color: Colors.grey,
                                                            child: FittedBox(
                                                              fit: BoxFit.cover,
                                                              child: isthere
                                                                  ? Image.network(snapshot.data!.docs[index]['imgurl'][0])
                                                                  : Image.network('https://kodular-community.s3.dualstack.eu-west-1.amazonaws.com/optimized/2X/6/6f5d1ae808fde2628ee1aa7accef955af67c6771_2_1024x399.png'),
                                                            ),
                                                          ),
                                                          Container(
                                                            child: FittedBox(fit: BoxFit.contain,
                                                              child: isthere ? Image.network(snapshot.data!.docs[index]['imgurl'][0]) : Image.network('https://kodular-community.s3.dualstack.eu-west-1.amazonaws.com/optimized/2X/6/6f5d1ae808fde2628ee1aa7accef955af67c6771_2_1024x399.png'),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                ),

                                                Divider(thickness: 2,color: textColor,),
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    padding: EdgeInsets.only(left: 7,bottom: 7),
                                                    // color: Colors.purple,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: [
                                                                Expanded(
                                                                  child: FittedBox(
                                                                    fit: BoxFit.fitWidth,
                                                                    child: CircleAvatar(
                                                                      backgroundColor: textColor,

                                                                      child: Icon(Icons.person,color: white,),

                                                                    ),
                                                                  ),

                                                                  // child: Container(
                                                                  //   margin: EdgeInsets.only(left: 5),
                                                                  //   // color: Colors.black,
                                                                  //   decoration:
                                                                  //   BoxDecoration(
                                                                  //     color: Colors.white,
                                                                  //     borderRadius: BorderRadius.circular(1),
                                                                  //   ),
                                                                  //   height: 70,
                                                                  //   width: 50,
                                                                  //   child: Icon(Icons.person),
                                                                  // ),
                                                                ),
                                                                Expanded(
                                                                  flex: 4,
                                                                  child: Container(
                                                                    height: 70,

                                                                    //   color: Colors.pink,
                                                                    child: Container(
                                                                      margin: EdgeInsets.only(right: 5,left: 5),
                                                                      alignment: Alignment.topLeft,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        color: white,
                                                                        borderRadius: BorderRadius.circular(1),
                                                                      ),
                                                                      child: ListView(

                                                                        children: [
                                                                          isthere
                                                                              ? Text('for : ' + snapshot.data!.docs[index]['sell'],style: TextStyle(fontWeight: FontWeight.bold),)
                                                                              : Text('All'),
                                                                          Text('ask : ',style: TextStyle(fontWeight: FontWeight.bold),),
                                                                          Text('ask : ',style: TextStyle(fontWeight: FontWeight.bold),),
                                                                          // Text(
                                                                          //     'Exchange :'),
                                                                          // Text(
                                                                          //     'Bid : '),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                // Expanded(
                                                                //   child: Container(
                                                                //     margin: EdgeInsets.only(left: 5),
                                                                //     // color: Colors.black,
                                                                //     decoration:
                                                                //     BoxDecoration(
                                                                //       color: Colors.white,
                                                                //       borderRadius: BorderRadius.circular(1),
                                                                //     ),
                                                                //     height: 70,
                                                                //     width: 50,
                                                                //     child: Icon(
                                                                //         Icons.person),
                                                                //   ),
                                                                // ),
                                                                // Expanded(
                                                                //   flex: 3,
                                                                //   child: Container(
                                                                //     height: 70,
                                                                //
                                                                //     //   color: Colors.pink,
                                                                //     child: Container(
                                                                //       margin: EdgeInsets
                                                                //           .only(
                                                                //           right:
                                                                //           5),
                                                                //       alignment:
                                                                //       Alignment
                                                                //           .center,
                                                                //       decoration:
                                                                //       BoxDecoration(
                                                                //         color: Colors
                                                                //             .white,
                                                                //         borderRadius:
                                                                //         BorderRadius
                                                                //             .circular(
                                                                //             1),
                                                                //       ),
                                                                //       child: Column(
                                                                //         mainAxisAlignment:
                                                                //         MainAxisAlignment
                                                                //             .center,
                                                                //         crossAxisAlignment:
                                                                //         CrossAxisAlignment
                                                                //             .center,
                                                                //         children: [
                                                                //           isthere
                                                                //               ? Text('Sell Type : ' +
                                                                //               snapshot.data!.docs[index][
                                                                //               'sell'])
                                                                //               : Text(
                                                                //               'No Sell Item mention'),
                                                                //           // Text(
                                                                //           //     'Exchange :'),
                                                                //           // Text(
                                                                //           //     'Bid : '),
                                                                //         ],
                                                                //       ),
                                                                //     ),
                                                                //   ),
                                                                // ),
                                                              ]),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                }
                                return Center(child: CircularProgressIndicator());
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ));
    },

    );
  }


}
