import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_exchange2/app/modules/add_data_page/bikes/views/bikes_view.dart';
import 'package:pro_exchange2/app/modules/add_data_page/car/views/car_view.dart';
import 'package:pro_exchange2/app/modules/add_data_page/mobiles/views/mobiles_view.dart';
import 'package:resize/resize.dart';
import '../../../../Colors/Colors.dart';
import '../controllers/add_data_page_controller.dart';
import '../electronics/views/electronics_view.dart';
import '../furniture/views/furniture_view.dart';
import '../property/views/property_view.dart';

class AddDataPageView extends GetView<AddDataPageController> {
// final Stream<QuerySnapshot> user = FirebaseFirestore.instance.collection('user').doc().collection('cars').snapshots();

  @override
  Widget build(BuildContext context) {
    return Resize(builder: () {
      return Scaffold(
        appBar: AppBar(
          title: Text('Add your product'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child:Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.to(() => CarView());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          margin: EdgeInsets.only(top: 20.h, left: 20.h, right: 10.h),

                          height: 100.h,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.car_rental,

                                  color: textColor,
                                ),
                                SizedBox(height: 5.h,),
                                Text(
                                  'Car',
                                  style: TextStyle(color: textColor,fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                  Expanded(
                      child: InkWell(
                        onTap: (){
                          Get.to(()=> PropertyView());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: textColor,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          margin: EdgeInsets.only(top: 20.h, left: 10.h, right: 20.h),
                          height: 100.h,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.home_outlined,

                                  color: backGround,
                                ),
                                SizedBox(height: 5.h,),
                                Text(
                                  'Property',
                                  style: TextStyle(color: white,fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.to(() => FurnitureView());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: textColor,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          margin: EdgeInsets.only(top: 20.h, left: 20.h, right: 10.h),
                          height: 100.h,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.bed_outlined,

                                  color: backGround,
                                ),
                                SizedBox(height: 5.h,),
                                Text(
                                  'Furniture',
                                  style: TextStyle(color: white,fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                  Expanded(
                      child: InkWell(
                        onTap: (){
                          Get.to(()=> MobileView());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          margin: EdgeInsets.only(top: 20.h, left: 10.h, right: 20.h),
                          height: 100.h,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.mobile_friendly_outlined,

                                  color: textColor,
                                ),
                                SizedBox(height: 5.h,),
                                Text(
                                  'Mobile',
                                  style: TextStyle(color: textColor,fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.to(() => BikesView());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          margin: EdgeInsets.only(top: 20.h, left: 20.h, right: 10.h),
                          height: 100.h,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.bike_scooter_outlined,

                                  color: textColor,
                                ),
                                SizedBox(height: 5.h,),
                                Text(
                                  'Bikes',
                                  style: TextStyle(color: textColor,fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                  Expanded(
                      child: InkWell(
                        onTap: (){

                          // Get.to(()=> ElectronicsDetailsView());

                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: textColor,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          margin: EdgeInsets.only(top: 20.h, left: 10.h, right: 20.h),
                          height: 100.h,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.house,

                                  color: backGround,
                                ),
                                SizedBox(height: 5.h,),
                                Text(
                                  'Electronics',
                                  style: TextStyle(color: white,fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                ],
              ),

              SizedBox(height: 20,)
            ],
          ),
      //     Column(
      //       children: [
      //         Row(
      //           children: [
      //             Expanded(
      //                 child: InkWell(
      //               onTap: () {
      //                 Get.to(() => CarView());
      //               },
      //               child: Container(
      //                 decoration: BoxDecoration(
      //                   color: Colors.pink,
      //                   borderRadius: BorderRadius.circular(10.r),
      //                 ),
      //                 margin: EdgeInsets.only(top: 20.h, left: 20.h, right: 10.h),
      //                 height: 100.h,
      //                 child: FittedBox(
      //                   fit: BoxFit.fitHeight,
      //                   child: Column(
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     children: [
      //                       Icon(
      //                         Icons.car_rental,
      //                        color: textColor,
      //                       ),
      //                       SizedBox(height: 5.h,),
      //                       Text(
      //                         'Car',
      //                         style: TextStyle(color: textColor,fontWeight: FontWeight.bold),
      //                       )
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             )),
      //             Expanded(
      //                 child: InkWell(
      //                   onTap: (){
      //                 Get.to(()=> PropertyView());
      // },
      //                   child: Container(
      //                     decoration: BoxDecoration(
      //                       borderRadius: BorderRadius.circular(10.r),
      //                       color: Colors.blue,
      //
      //                     ),
      //                       margin: EdgeInsets.only(top: 20.h, left: 10.h, right: 20.h),
      //                        height: 100.h,
      //                       child: FittedBox(
      //                         fit: BoxFit.fitHeight,
      //                         child: Column(
      //                         mainAxisAlignment: MainAxisAlignment.center,
      //                         children: [
      //                           Icon(
      //                             Icons.home_outlined,
      //                             color: backGround,
      //                           ),
      //                           Text(
      //                             'Property',
      //                             style: TextStyle(color: white,fontWeight: FontWeight.bold),
      //                           )
      //                         ],
      //                     ),
      //                       ),
      //             ),
      //                 )),
      //           ],
      //         ),
      //         Row(
      //           children: [
      //             Expanded(
      //                 child: InkWell(
      //                   onTap: () {
      //                Get.to(() => FurnitureView());
      //                   },
      //                   child: Container(
      //                     decoration: BoxDecoration(
      //                       color: Colors.yellow,
      //                       borderRadius: BorderRadius.circular(10.r),
      //                     ),
      //                     margin: EdgeInsets.only(top: 15.h, left: 15.h, right: 15.h),
      //                     height: 100.h,
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.center,
      //                       children: [
      //                         Icon(
      //                           Icons.car_rental,
      //                           size: 35.h,
      //                         ),
      //                         Text(
      //                           'Furniture',
      //                           style: TextStyle(fontSize: 1.2.rem),
      //                         )
      //                       ],
      //                     ),
      //                   ),
      //                 )),
      //             Expanded(
      //                 child: InkWell(
      //                   onTap: (){
      //                    Get.to(()=> MobileView());
      //                   },
      //                   child: Container(
      //                     decoration: BoxDecoration(
      //                       borderRadius: BorderRadius.circular(10.r),
      //                       color: Colors.grey,
      //
      //                     ),
      //                     margin: EdgeInsets.only(top: 15.h, left: 15.h, right: 15.h),
      //                     height: 100.h,
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.center,
      //                       children: [
      //                         Icon(
      //                           Icons.house,
      //                           size: 35.h,
      //                         ),
      //                         Text(
      //                           'Mobiles',
      //                           style: TextStyle(fontSize: 1.2.rem),
      //                         )
      //                       ],
      //                     ),
      //                   ),
      //                 )),
      //           ],
      //         ),
      //         Row(
      //           children: [
      //             Expanded(
      //                 child: InkWell(
      //                   onTap: () {
      //                       Get.to(() => BikesView());
      //                   },
      //                   child: Container(
      //                     decoration: BoxDecoration(
      //                       color: Colors.green,
      //                       borderRadius: BorderRadius.circular(10.r),
      //                     ),
      //                     margin: EdgeInsets.only(top: 15.h, left: 15.h, right: 15.h),
      //                     height: 100.h,
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.center,
      //                       children: [
      //                         Icon(
      //                           Icons.car_rental,
      //                           size: 35.h,
      //                         ),
      //                         Text(
      //                           'Bikes',
      //                           style: TextStyle(fontSize: 1.2.rem),
      //                         )
      //                       ],
      //                     ),
      //                   ),
      //                 )),
      //             Expanded(
      //                 child: InkWell(
      //                   onTap: (){
      //                       Get.to(()=> ElectronicsDetailsView());
      //                   },
      //                   child: Container(
      //                     decoration: BoxDecoration(
      //                       borderRadius: BorderRadius.circular(10.r),
      //                       color: Colors.orange,
      //
      //                     ),
      //                     margin: EdgeInsets.only(top: 15.h, left: 15.h, right: 15.h),
      //                     height: 100.h,
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.center,
      //                       children: [
      //                         Icon(
      //                           Icons.house,
      //                           size: 35.h,
      //                         ),
      //                         Text(
      //                           'Electronics',
      //                           style: TextStyle(fontSize: 1.2.rem),
      //                         )
      //                       ],
      //                     ),
      //                   ),
      //                 )),
      //           ],
      //         ),
      //         SizedBox(height: 20,)
      //       ],
      //     ),
        ),
      );
    });
  }
}
