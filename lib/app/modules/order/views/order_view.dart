import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_exchange2/app/routes/app_pages.dart';
import '../chat_screen/views/chat_screen.dart';
import '../controllers/order_controller.dart';
import '../purchase_product/views/purchase_product_view.dart';
import '../wishlist_page/views/wishlist_page_view.dart';

class OrderView extends GetView<OrderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Order'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 15),
              height: 190,
              child: Column(
                children: [


                  Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text('Products based on your search',style: TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.underline),))
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * 1-380,
                width: MediaQuery.of(context).size.width * 1,
                //    color: Colors.yellow,
                child: GridView.builder(

                    shrinkWrap: true,
                    clipBehavior: Clip.hardEdge,

                    itemCount: 15,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                        crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10,mainAxisExtent: 250), itemBuilder: (context,index){
                  return Container(
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(1),border: Border.all(color: Colors.black87)),


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
                                        //   return Text(controller.count.value
                                        //       .toString());
                                        // }),
                                      ],
                                    )),
                              ),)
                          ],
                        ),
                        Expanded(
                          flex:2,
                          child: Container(
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(

                          child: Container(
                            color: Colors.purple,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
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
                                          flex:3,
                                          child: Container(

                                            height: 70,

                                            //   color: Colors.pink,
                                            child: Container(

                                              margin: EdgeInsets.only(right: 5),
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
                }),
              ),
            ),
          ],
        ));
  }
}
