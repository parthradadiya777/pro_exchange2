import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/site_plots_controller.dart';

class SitePlotsView extends GetView<SitePlotsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SitePlotsView'),
        centerTitle: true,
      ),
      body:StreamBuilder(
          stream: FirebaseFirestore.instance.collection('products').where('category',isEqualTo: "Plot").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

            //    if (!snapshot.hasError) return new Text('Loading...');
            if(snapshot.hasData){
              final docs = snapshot.data?.docs;
              return  GridView.builder(
                  shrinkWrap: true,
                  clipBehavior: Clip.hardEdge,
                  itemCount: docs!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 250),
                  itemBuilder: (context, index) {
                    final data = docs[index].data();
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                          border: Border.all(color: Colors.black87)),
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
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('Verified :'),
                                      Text('No'),
                                    ],
                                  ),
                                ),
                              ),

                              Expanded(
                                child:
                                Container(

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
                                          Text('1')
                                          // Obx(() {
                                          //   return Text(
                                          //       controller.count.value
                                          //           .toString());
                                          // }),
                                        ],
                                      )),
                                ),)
                            ],
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                                color: Colors.grey,

//child: Image.network('https://firebasestorage.googleapis.com/v0/b/proexchange-d35f1.appspot.com/o/images%2Fimage_picker822019947.jpg?alt=media&token=8b002d48-ff41-4f40-b712-0340caf1d10b'),
                                child: Image.network(snapshot.data!.docs[index]['imgurl'] [0].toString())
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.purple,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  left: 5),
                                              // color: Colors.black,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                BorderRadius.circular(
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
                                                    .only(right: 5),
                                                alignment: Alignment
                                                    .topLeft,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,

                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(1),
                                                ),

                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text('Buy : '),
                                                    Text(
                                                        'Exchange :'),
                                                    Text('Bid : '),
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
                    );
                  });
            }
            return Center(child: CircularProgressIndicator());
          }
      ),
    );
  }
}
