import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_exchange2/app/modules/add_data_page/bikes/views/bikes_view.dart';
import 'package:pro_exchange2/app/modules/add_data_page/car/views/car_view.dart';
import 'package:pro_exchange2/app/modules/add_data_page/mobiles/views/mobiles_view.dart';
import 'package:resize/resize.dart';
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
          title: Text('What are you offering?'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
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
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      margin: EdgeInsets.only(top: 15.h, left: 15.h, right: 15.h),
                      height: 100.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.car_rental,
                            size: 35.h,
                          ),
                          Text(
                            'Car',
                            style: TextStyle(fontSize: 1.2.rem),
                          )
                        ],
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
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.blue,

                          ),
                    margin: EdgeInsets.only(top: 15.h, left: 15.h, right: 15.h),
                    height: 100.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.house,
                                size: 35.h,
                              ),
                              Text(
                                'Property',
                                style: TextStyle(fontSize: 1.2.rem),
                              )
                            ],
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
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          margin: EdgeInsets.only(top: 15.h, left: 15.h, right: 15.h),
                          height: 100.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.car_rental,
                                size: 35.h,
                              ),
                              Text(
                                'Furniture',
                                style: TextStyle(fontSize: 1.2.rem),
                              )
                            ],
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
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.grey,

                          ),
                          margin: EdgeInsets.only(top: 15.h, left: 15.h, right: 15.h),
                          height: 100.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.house,
                                size: 35.h,
                              ),
                              Text(
                                'Mobiles',
                                style: TextStyle(fontSize: 1.2.rem),
                              )
                            ],
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
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          margin: EdgeInsets.only(top: 15.h, left: 15.h, right: 15.h),
                          height: 100.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.car_rental,
                                size: 35.h,
                              ),
                              Text(
                                'Bikes',
                                style: TextStyle(fontSize: 1.2.rem),
                              )
                            ],
                          ),
                        ),
                      )),
                  Expanded(
                      child: InkWell(
                        onTap: (){
                            Get.to(()=> ElectronicsDetailsView());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.orange,

                          ),
                          margin: EdgeInsets.only(top: 15.h, left: 15.h, right: 15.h),
                          height: 100.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.house,
                                size: 35.h,
                              ),
                              Text(
                                'Electronics',
                                style: TextStyle(fontSize: 1.2.rem),
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
