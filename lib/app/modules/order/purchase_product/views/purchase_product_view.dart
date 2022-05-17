import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/purchase_product_controller.dart';

class PurchaseProductView extends GetView<PurchaseProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PurchaseProduct'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(

          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width ,
          child: Container(
            padding: EdgeInsets.all(10),
            //margin: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height ,
            width: MediaQuery.of(context).size.width,
            //  color: Colors.yellow,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.blue)),

                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height *0.2,
                        width: MediaQuery.of(context).size.width,

                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(10),
                              height: 50,
                              width: 50,

                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.blue)),

                              child: Row(
                                children: [
                                  Text('data'),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.blue)),

                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(10),
                              height: 50,
                              width: 100,

                              child: Row(
                                children: [
                                  Text(
                                    'Person 1  ',
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
          ),
        ),
      )
    );
  }
}
