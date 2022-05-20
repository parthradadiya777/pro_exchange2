import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_exchange2/app/modules/verifiers/views/Drawer.dart';
import 'package:pro_exchange2/app/modules/verifiers/views/verifier_search.dart';
import '../../../routes/app_pages.dart';
import '../../buy_page/views/buy_page_view.dart';
import '../controllers/verifiers_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class VerifiersView extends GetView<VerifiersController> {
  @override
  Widget build(BuildContext context) {
    VerifiersController verifiersController = Get.put(VerifiersController());
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //     onPressed: () {
        //       Get.back();
        //     },
        //     icon: Icon(Icons.arrow_back_outlined)),
        title: Text('Verifier'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => Verifier_Search());
              },
              icon: Icon(Icons.search))
        ],
      ),
      drawer: DrawerPage(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height * 0.55,
          width: MediaQuery.of(context).size.width * 1,
          //    color: Colors.yellow,
          child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('Verifier').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
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
                        return InkWell(
                          onTap: () {
                            // Get.toNamed(Routes.DETAILS);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1),
                                border: Border.all(color: Colors.black87)),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                      alignment: Alignment.center,
                                      color: Colors.grey,
                                      child: Image.network(
                                          docs[index]['imgurl'][0])),
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
                                                    child: Icon(Icons.person),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                    height: 70,

                                                    //   color: Colors.pink,
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          right: 5),
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text('Name: ' +
                                                              docs[index]
                                                                  ['name']),
                                                          Text('Address:' +
                                                              docs[index]
                                                                  ['address']),
                                                          Text('Experieance:' +
                                                              docs[index][
                                                                  'experience']),
                                                          FittedBox(
                                                              child: Text(
                                                                  'Location:' +
                                                                      docs[index]
                                                                          [
                                                                          'location']))
                                                          // Text(
                                                          //     'Exchange :'),
                                                          // Text(
                                                          //     'Bid : '),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    InkWell(
                                                        onTap: () {
                                                          launch('tel://');
                                                        },
                                                        child:
                                                            Icon(Icons.phone)),
                                                    InkWell(
                                                        onTap: () {},
                                                        child: Icon(
                                                            Icons.message)),
                                                  ],
                                                )
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
      ),
    );
  }
}
