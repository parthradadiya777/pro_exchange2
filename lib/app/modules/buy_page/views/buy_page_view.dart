import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/buy_page_controller.dart';

class BuyPageView extends GetView<BuyPageController> {
  @override
  Widget build(BuildContext context) {
    // List<bool> isSelected = [true, false, false].obs;
    BuyPageController buypagecontroller = Get.put(BuyPageController());

    return Scaffold(
        //resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back)),
          title: Text('Products Selling'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: MaterialButton(
                          splashColor: Colors.blue,
                          hoverColor: Colors.blue,
                          onPressed: () {},
                          child: Text('Buy'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: MaterialButton(
                          splashColor: Colors.blue,
                          hoverColor: Colors.blue,
                          onPressed: () {},
                          child: Text('Exchange'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: MaterialButton(
                          splashColor: Colors.blue,
                          hoverColor: Colors.blue,
                          onPressed: () {},
                          child: Text('Bid'),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width * 0.9,
                  //   color: Colors.yellow,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                            // image: DecorationImage(
                            //     fit: BoxFit.scaleDown,
                            //     image: AssetImage(
                            //       'assets/google.png',
                            //     )),
                            border: Border.all(),
                            //  color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 15, left: 5),
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10),
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
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 15, right: 10),
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: MaterialButton(
                                        onPressed: () {
                                          controller.increment();
                                        },
                                        child: Row(
                                          children: [
                                            Text('Vote :'),
                                            Obx(() {
                                              return Text(controller.count.value
                                                  .toString());
                                            }),
                                          ],
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            //Text('data'),

                            Expanded(
                              child: Container(
                                  alignment: Alignment.bottomLeft,
                                  margin: EdgeInsets.all(5),
                                  // color: Colors.blue,
                                  height: 120,
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 5, bottom: 5),
                                            height: 70,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            //   color: Colors.pink,
                                            child: Container(
                                              alignment: Alignment.center,
                                              // color: Colors.black,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.blue),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              height: 50,
                                              width: 50,
                                              child: Icon(Icons.person),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 5, bottom: 5),
                                            height: 70,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.85,
                                            //   color: Colors.pink,
                                            child: Container(
                                              padding: EdgeInsets.only(left: 5),
                                              margin: EdgeInsets.only(left: 5),
                                              alignment: Alignment.topLeft,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.blue),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              height: 150,
                                              width: 150,
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
                                      ])),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  //  color: Colors.red,
                  height: MediaQuery.of(context).size.height * 0.28,
                  width: MediaQuery.of(context).size.width,

                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        fillColor: Colors.blue,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Search'),
                  ),
                ),
              ]),
        ));
  }
}
