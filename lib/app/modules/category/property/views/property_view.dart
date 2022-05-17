import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:resize/resize.dart';

import '../controllers/property_controller.dart';
import '../houseproperty/views/houseproperty_view.dart';
import '../site_plots/views/site_plots_view.dart';

class PropertyItemView extends GetView<PropertyController> {
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

              InkWell(
                onTap: (){
                  Get.to(()=> SitePlotsView());
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.blue,

                  ),
                  margin: EdgeInsets.only(top: 15.h, left: 15.h, right: 15.h),
                  height: 100.h,
                  width: 100.w,
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
