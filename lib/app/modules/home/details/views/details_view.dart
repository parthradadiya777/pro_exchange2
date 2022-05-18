import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pro_exchange2/app/data/offer.dart';

import '../controllers/details_controller.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({Key? key}) : super(key: key);
  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  TextEditingController offer = TextEditingController();

  bool selected = true;
  bool selected1 = true;
  bool selected2 = true;
  bool selected3 = true;
  bool selected4 = true;
  bool selected5 = true;
  bool selected6 = true;

  void first() {
    setState(() {
      selected = true;
      selected1 = false;
      selected2 = false;
      selected3 = false;
      selected4 = false;
      selected5 = false;
      selected6 = false;
    });
  }

  void first1() {
    setState(() {
      selected = false;
      selected1 = true;
      selected2 = false;
      selected3 = false;
      selected4 = false;
      selected5 = false;
      selected6 = false;
    });
  }

  void first2() {
    setState(() {
      selected = false;
      selected1 = false;
      selected2 = true;
      selected3 = false;
      selected4 = false;
      selected5 = false;
      selected6 = false;
    });
  }

  void first3() {
    setState(() {
      selected = false;
      selected1 = false;
      selected2 = false;
      selected3 = true;
      selected4 = false;
      selected5 = false;
      selected6 = false;
    });
  }

  void first4() {
    setState(() {
      selected = true;
      selected1 = false;
      selected2 = false;
      selected3 = false;
      selected4 = false;
      selected5 = false;
      selected6 = false;
    });
  }

  void first5() {
    setState(() {
      selected = false;
      selected1 = false;
      selected2 = false;
      selected3 = false;
      selected4 = true;
      selected5 = false;
      selected6 = false;
    });
  }

  void first6() {
    setState(() {
      selected = false;
      selected1 = false;
      selected2 = false;
      selected3 = false;
      selected4 = false;
      selected5 = true;
      selected6 = false;
    });
  }

  void first7() {
    setState(() {
      selected = false;
      selected1 = false;
      selected2 = false;
      selected3 = false;
      selected4 = false;
      selected5 = false;
      selected6 = true;
    });
  }

  String fore() {
    var time = DateTime.now();
    var formater = DateFormat('hh:mm');
    String fo = formater.format(time);
    return fo;
  }

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;
    final docid = FirebaseFirestore
        .instance
        .collection(
        'products')
        .doc()
        .id;
    var images = data['images'] as List;
    var details = data['Adtitle'];
    var sell = data['sell'];
    var deal = data['alldeals'];
    var id=data['id'];
var deals = FirebaseFirestore.instance.collection('products').doc(docid).get();
    int a;


    print(images);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(),
            SizedBox(
              width: 10,
            ),
            Text('DetailsView'),
          ],
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Visit',
                style: TextStyle(color: Colors.black87),
              ))
        ],
      ),
      body: LayoutBuilder(
        builder: (context, viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width,
                    //  color: Colors.pink,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(10)),
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(10),
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                          margin: EdgeInsets.all(10),
                                          alignment: Alignment.center,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.3,
                                          color: Colors.blue,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                          ),
                                                          alignment:
                                                              Alignment.center,
                                                          margin:
                                                              EdgeInsets.all(5),

                                                          //width: 100,
                                                          height: 20,
                                                          child: Text(
                                                              'verifier: No'))),
                                                  Expanded(
                                                      child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                          ),
                                                          alignment:
                                                              Alignment.center,
                                                          margin:
                                                              EdgeInsets.all(5),
                                                          height: 20,
                                                          child: Text('Vote 1',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center))),
                                                ],
                                              ),
                                              Expanded(
                                                  child: Container(
                                                child: Image.network(images[0]),
                                              )),
                                            ],
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.blue)),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                first();
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                color: Colors.lightGreenAccent,
                                                width: 150,
                                                child: Text('Details'),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                first1();
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                color: Colors.lightGreenAccent,
                                                width: 150,
                                                child: Text('Documents'),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                first2();
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                color: Colors.lightGreenAccent,
                                                width: 150,
                                                child: Text('Gallery'),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                first3();
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                color: Colors.lightGreenAccent,
                                                width: 150,
                                                child: Text('Voters'),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                first5();
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                color: Colors.lightGreenAccent,
                                                width: 150,
                                                child: Text('Verifier'),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                first6();
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                color: Colors.lightGreenAccent,
                                                width: 150,
                                                child: Text('Deals'),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                first7();
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                color: Colors.lightGreenAccent,
                                                width: 150,
                                                child: Text('Make Offer'),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                              selected
                                  ? Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.all(10),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.19,
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      child: Column(
                                        children: [
                                          Text('Product Name :$details'),
                                          Text('Sell : $sell'),
                                        ],
                                      ),
                                    )
                                  : selected1
                                      ? Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          padding: EdgeInsets.all(10),
                                          margin: EdgeInsets.all(10),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.19,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          child: Column(
                                            children: [Text('Documents')],
                                          ),
                                        )
                                      : selected2
                                          ? Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  border: Border.all(),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              padding: EdgeInsets.all(10),
                                              margin: EdgeInsets.all(10),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.19,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.9,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      color: Colors.yellow,
                                                      width: 200,
                                                      height: 300,
                                                      child: Container(
                                                          margin:
                                                              EdgeInsets.all(
                                                                  10),
                                                          height: 300,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              1,
                                                          //    color: Colors.yellow,
                                                          // child: StreamBuilder(
                                                          //     stream: FirebaseFirestore.instance
                                                          //         .collection('products').doc(uid)..snapshots(),

                                                          child:
                                                              ListView.builder(
                                                                  scrollDirection:
                                                                      Axis
                                                                          .horizontal,
                                                                  itemCount:
                                                                      images
                                                                          .length,
                                                                  itemBuilder:
                                                                      (BuildContext
                                                                              context,
                                                                          index) {
                                                                    //    if (!snapshot.hasError) return new Text('Loading...');
                                                                    return InkWell(
                                                                        // onTap: (){
                                                                        //   Get.toNamed(Routes.DETAILS,arguments: {
                                                                        //     'img':img
                                                                        //   });
                                                                        // },
                                                                        child: Container(
                                                                            height: 300,
                                                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(1), border: Border.all(color: Colors.black87)),
                                                                            child: Column(children: [
                                                                              Expanded(
                                                                                flex: 2,
                                                                                child: Container(
                                                                                    height:
                                                                                        300,
                                                                                    alignment: Alignment
                                                                                        .center,
                                                                                    color: Colors
                                                                                        .grey,
                                                                                    child: Row(children: [
                                                                                      Container(height: 300, child: Image.network(images[index]))
                                                                                    ])),
                                                                              ),
                                                                            ])));
                                                                  })),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : selected3
                                              ? Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      border: Border.all(),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  padding: EdgeInsets.all(10),
                                                  margin: EdgeInsets.all(10),
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.19,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.9,
                                                  child: Column(
                                                    children: [Text('Voters')],
                                                  ),
                                                )
                                              : selected4
                                                  ? Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.grey,
                                                          border: Border.all(),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      margin:
                                                          EdgeInsets.all(10),
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.19,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.9,
                                                      child: Column(
                                                        children: [
                                                          Text('Verifiers')
                                                        ],
                                                      ),
                                                    )
                                                  : selected5
                                                      ? Container(
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.grey,
                                                              border:
                                                                  Border.all(),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          margin:
                                                              EdgeInsets.all(
                                                                  10),
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.19,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.9,
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                margin:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10),
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.12,
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    1,
                                                                color: Colors
                                                                    .yellow,
                                                                child:
                                                                    StreamBuilder(
                                                                        stream: FirebaseFirestore
                                                                            .instance
                                                                            .collection(
                                                                                'products')
                                                                            .snapshots(),
                                                                        builder: (BuildContext
                                                                                context,
                                                                            AsyncSnapshot<QuerySnapshot>
                                                                                snapshot) {
                                                                          //    if (!snapshot.hasError) return new Text('Loading...');
                                                                          if (snapshot
                                                                              .hasData) {
                                                                            final docs =
                                                                                snapshot.data?.docs;
                                                                            return ListView.builder(
                                                                                shrinkWrap: true,
                                                                                clipBehavior: Clip.hardEdge,
                                                                                itemCount: docs!.length,
                                                                                itemBuilder: (context, index) {
                                                                                  return InkWell(
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(1), border: Border.all(color: Colors.black87)),
                                                                                      child: Column(
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                            children: [
                                                                                              Text("${index + 1} :"),
                                                                                              Text(snapshot.data!.docs[index]['alldeals']['offer']),
                                                                                              Text(snapshot.data!.docs[index]['alldeals']['time'])
                                                                                            ],
                                                                                          )
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                });
                                                                          }
                                                                          return Center(
                                                                              child: CircularProgressIndicator());
                                                                        }),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      : selected6
                                                          ? Container(
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .grey,
                                                                  border: Border
                                                                      .all(),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(10),
                                                              margin: EdgeInsets
                                                                  .all(10),
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.25,
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.9,
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                            top:
                                                                                10),
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            10),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          offer,
                                                                      decoration: InputDecoration(
                                                                          hintText:
                                                                              'Make Offer',
                                                                          border:
                                                                              OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                                                                    ),
                                                                  ),
                                                                  InkWell(

                                                                    onTap: () async{


                                                                      final uid = FirebaseAuth
                                                                          .instance
                                                                          .currentUser!
                                                                          .uid;
                                                                        var m = await  FirebaseFirestore.instance.collection('products').doc(id).get() ;
                                                                        var j=m['c'];
                                                                      if(j!=null)
                                                                      a=j;
                                                                      else
                                                                        a=0;
                                                                      a++;

                                                                      FirebaseFirestore.instance.collection('products').doc(id).set(
                                                                        {
                                                                          "alldeals":
                                                                              {
                                                                            a.toString():
                                                                                {
                                                                              "user": uid,
                                                                              "offer": offer.text,
                                                                              "time": fore()
                                                                            }
                                                                          },
                                                                        },
                                                                        SetOptions(
                                                                            merge:
                                                                                true),
                                                                      );
                                                                      FirebaseFirestore.instance.collection('products').doc(id).update(
                                                                          {"c":a});

                                                                      offer
                                                                          .clear();
                                                                      // offer.clear();
                                                                    },
                                                                    child: Card(
                                                                      child:
                                                                          Container(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        //color: Colors.yellow,
                                                                        height:
                                                                            50,
                                                                        width:
                                                                            200,
                                                                        child: Text(
                                                                            'Save'),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          : Text('')
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
