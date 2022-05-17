import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_exchange2/app/modules/add_data_page/electronics/Camera/views/camera_view.dart';
import 'package:pro_exchange2/app/modules/add_data_page/electronics/Tv_Audio/views/tv_audio_view.dart';
import 'package:pro_exchange2/app/modules/add_data_page/electronics/fridge/views/fridge_view.dart';
import 'package:pro_exchange2/app/modules/add_data_page/electronics/others/views/others_view.dart';
import 'package:pro_exchange2/app/modules/add_data_page/electronics/washing_machine/views/washing_machine_view.dart';
import 'package:resize/resize.dart';
import '../../../add_data_page/mobiles/views/mobiles_view.dart';
import '../Tv/views/tv_view.dart';
import '../camera/views/camera_view.dart';
import '../computer/views/computer_view.dart';
import '../controllers/electronics_controller.dart';
import '../fridge/views/fridge_view.dart';
import '../mobile/views/mobile_view.dart';
import '../others/views/others_view.dart';
import '../printers/views/printers_view.dart';
import '../washingmachine/views/washingmachine_view.dart';


class ElectronicsView extends GetView<ElectronicsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ElectronicsView'),
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
                       Get.to(() => PrintersView());
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
                              'Printer & Moniters',
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
                        Get.to(()=> WashingmachineView());
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
                              'Washing Machine',
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
                        Get.to(() => FridgeCategoryView());
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
                              'Fridges',
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
                      Get.to(()=> TvView());
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
                            'T.V,Video,Audio',
                            style: TextStyle(fontSize: 1.2.rem),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.to(() => CameraCateegoryView());
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
                              'camera & Lenses',
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
                        Get.to(()=> ComputerCategoryView());
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
                              'Computer & Leptop',
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
                      Get.to(() => MobileCategoryView());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      margin: EdgeInsets.only(top: 15.h, left: 15.h, right: 15.h),
                      height: 100.h,
                      width: 100.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.car_rental,
                            size: 35.h,
                          ),
                          Text(
                            'Mobiles',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 1.2.rem,),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.to(() => OthersCategoryView());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      margin: EdgeInsets.only(top: 15.h, left: 15.h, right: 15.h),
                      height: 100.h,
                      width: 100.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.car_rental,
                            size: 35.h,
                          ),
                          Text(
                            'Others',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 1.2.rem,),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
