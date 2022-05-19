import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_exchange2/app/modules/add_data_page/electronics/Camera/views/camera_view.dart';
import 'package:pro_exchange2/app/modules/add_data_page/electronics/Tv_Audio/views/tv_audio_view.dart';
import 'package:pro_exchange2/app/modules/add_data_page/electronics/fridge/views/fridge_view.dart';
import 'package:pro_exchange2/app/modules/add_data_page/electronics/others/views/others_view.dart';
import 'package:pro_exchange2/app/modules/add_data_page/electronics/washing_machine/views/washing_machine_view.dart';
import 'package:resize/resize.dart';
import '../Comuters_Leptop/views/comuters_leptop_view.dart';
import '../controllers/electronics_controller.dart';
import '../printer_moniter/views/printer_moniter_view.dart';

class ElectronicsDetailsView extends GetView<ElectronicsController> {
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
                        Get.to(() => PrinterMoniterView());
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
                        Get.to(()=> Washing_MachineView());
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
                         Get.to(() => FridgeView());
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
                        Get.to(()=> Tv_AudioView());
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
                          Get.to(() => CameraView());
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
                        Get.to(()=> ComutersLeptopView());
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
                      Get.to(() => OthersView());
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
