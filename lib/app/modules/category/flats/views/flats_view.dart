import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pro_exchange2/app/modules/category/flats/controllers/flats_controller.dart';

class FlatsView extends GetView<FlatsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flats'),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('products')
              .where('category', isEqualTo: "House")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            //    if (!snapshot.hasError) return new Text('Loading...');
            if (snapshot.hasData) {
              final docs = snapshot.data?.docs;
              return GridView.builder(
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
                                          Text('1')
                                          // Obx(() {
                                          //   return Text(
                                          //       controller.count.value
                                          //           .toString());
                                          // }),
                                        ],
                                      )),
                                ),
                              )
                            ],
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                                color: Colors.grey,
                                child: Image.network(snapshot
                                    .data!.docs[index]['imgurl'][0]
                                    .toString())),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.purple,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 5),
                                              // color: Colors.black,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(1),
                                              ),
                                              height: 70,
                                              width: 50,
                                              child: Icon(Icons.person),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              height: 70,

                                              //   color: Colors.pink,
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(right: 5),
                                                alignment: Alignment.topLeft,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(1),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Buy : '),
                                                    Text('Exchange :'),
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
          }),
    );
  }
}
