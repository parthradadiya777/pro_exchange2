import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_exchange2/app/modules/category/flats/views/flats_view.dart';
import 'package:pro_exchange2/app/modules/home/details/views/details_view.dart';
import 'package:pro_exchange2/app/routes/app_pages.dart';
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
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  controller.signOut();
                },
                icon: Icon(Icons.logout))
          ],
          title: Text('Pro Exchange'),
          centerTitle: true,
        ),
        body: LayoutBuilder(builder:
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
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10),
                            child: Text(
                              'Categories',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            height: MediaQuery.of(context).size.height * 0.14,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                //color: Colors.amber,
                                ),
                            child: Container(
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.blue),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        margin: EdgeInsets.all(10),
                                        //   padding: EdgeInsets.all(10),
                                        height: 50,
                                        width: 50,
                                        child: IconButton(
                                            onPressed: () {
                                              Get.to(() => FlatsView());
                                            },
                                            icon: Icon(Icons.home)),
                                      ),
                                      Text('Flats'),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.blue),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        margin: EdgeInsets.all(10),
                                        height: 50,
                                        width: 50,
                                        child: IconButton(
                                            onPressed: () {
                                              Get.to(() => VehiclesView());
                                            },
                                            icon: Icon(Icons.pedal_bike)),
                                      ),
                                      Text('Vehicles'),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.blue),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        margin: EdgeInsets.all(10),
                                        height: 50,
                                        width: 50,
                                        child: IconButton(
                                            onPressed: () {
                                              Get.to(() => ElectronicsView());
                                            },
                                            icon: Icon(Icons
                                                .electrical_services_sharp)),
                                      ),
                                      Text('electonics'),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.blue),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        margin: EdgeInsets.all(10),
                                        height: 50,
                                        width: 50,
                                        child: IconButton(
                                            onPressed: () {
                                              Get.to(() => PropertyItemView());
                                            },
                                            icon: Icon(
                                                Icons.bedroom_child_outlined)),
                                      ),
                                      Text('property'),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.blue),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        margin: EdgeInsets.all(10),
                                        //   padding: EdgeInsets.all(10),
                                        height: 50,
                                        width: 50,
                                        child: IconButton(
                                            onPressed: () {
                                              Get.to(()=> SearchPageView());
                                            },
                                            icon: Icon(Icons.search)),
                                      ),
                                      Text('Search'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Colors.black87,
                            )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      //  color: Colors.pink,
                                      border: Border.all(color: Colors.black87),
                                      borderRadius: BorderRadius.circular(1),
                                    ),
                                    child: MaterialButton(
                                      onPressed: () {
                                        Get.to(BuyPageView());
                                      },
                                      child: Text('Buy'),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      //  color: Colors.pink,
                                      border: Border.all(color: Colors.black87),
                                      borderRadius: BorderRadius.circular(1),
                                    ),
                                    child: MaterialButton(
                                      onPressed: () {
                                        Get.to(BuyPageView());
                                      },
                                      child: Text('Exchange'),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      //  color: Colors.pink,
                                      border: Border.all(color: Colors.black87),
                                      borderRadius: BorderRadius.circular(1),
                                    ),
                                    child: MaterialButton(
                                      onPressed: () {
                                        Get.to(BuyPageView());
                                      },
                                      child: Text('Bid'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height * 0.55,
                      width: MediaQuery.of(context).size.width * 1,
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
                                                color: Colors.black87)),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Text('Verified :'),
                                                        Text('No'),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                    ),
                                                    child: MaterialButton(
                                                        onPressed: () {
                                                          controller.increment();
                                                        },
                                                        child: Row(
                                                          children: [
                                                            Text('Vote :'),
                                                            Obx(() {
                                                              return Text(
                                                                  controller
                                                                      .count.value
                                                                      .toString());
                                                            }),
                                                          ],
                                                        )),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Expanded(
                                                flex: 2,
                                                child: Container(
                                                    alignment: Alignment.center,
                                                    color: Colors.grey,
                                                    child: isthere
                                                        ? Image.network(img)
                                                        : Image.network(
                                                            'https://kodular-community.s3.dualstack.eu-west-1.amazonaws.com/optimized/2X/6/6f5d1ae808fde2628ee1aa7accef955af67c6771_2_1024x399.png'))),
                                            Expanded(
                                              child: Container(
                                                color: Colors.purple,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left: 5),
                                                                // color: Colors.black,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              1),
                                                                ),
                                                                height: 70,
                                                                width: 50,
                                                                child: Icon(
                                                                    Icons.person),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 3,
                                                              child: Container(
                                                                height: 70,

                                                                //   color: Colors.pink,
                                                                child: Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          right:
                                                                              5),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                1),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      isthere
                                                                          ? Text('Sell Type : ' +
                                                                              snapshot.data!.docs[index][
                                                                                  'sell'])
                                                                          : Text(
                                                                              'No Sell Item mention'),
                                                                      // Text(
                                                                      //     'Exchange :'),
                                                                      // Text(
                                                                      //     'Bid : '),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
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
        }));
  }


}
