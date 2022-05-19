import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pro_exchange2/app/modules/add_data_page/property/house/views/house_view.dart';
import 'package:pro_exchange2/app/modules/add_data_page/property/plot_land/views/plot_land_view.dart';
import 'package:resize/resize.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../car/views/car_view.dart';
import '../controllers/property_controller.dart';



class PropertyView extends GetView<PropertyController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PropertyView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.to(() => HouseView());
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
                            'House & Appartment',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 1.2.rem,),
                          )
                        ],
                      ),
                    ),
                  )),
              Expanded(
                  child: InkWell(
                    onTap: (){
                      Get.to(()=> PlotLandView());
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
                            'Site & Plots',
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
    );
  }
}


