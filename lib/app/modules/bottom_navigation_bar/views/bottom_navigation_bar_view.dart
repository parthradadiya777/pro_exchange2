
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_exchange2/app/modules/add_data_page/views/add_data_page_view.dart';
import '../../../../Colors/Colors.dart';
import '../../chats/views/chats_view.dart';
import '../../home/views/home_view.dart';
import '../../order/views/order_view.dart';
import '../../profile_page/views/profile_page_view.dart';
import '../../verifiers/views/verifiers_view.dart';
import '../controllers/bottom_navigation_bar_controller.dart';

class BottomNavigationBarView extends GetView<BottomNavigationBarController> {


  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => BottomNavigationBarController());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox.expand(
          child: PageView(
              physics: ScrollPhysics(
                parent: NeverScrollableScrollPhysics(),
              ),
              children: [
                HomeView(),
                VerifiersView(),
                AddDataPageView(),
                ChatsView(),
                ProfilePageView(),
              ],
              controller: controller.pagecontroller),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: controller.keyboropen.value
        //     ? SizedBox()
        //     : FloatingActionButton(
        //         onPressed: () {
        //         Get.to(()=> AddDataPageView());
        //         },
        //         child: Icon(Icons.add),
        //       ),
        bottomNavigationBar: Obx(() {
          return BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon:  Icon(Icons.production_quantity_limits),label: 'Products',backgroundColor: textColor),
              BottomNavigationBarItem(icon:  Icon(Icons.verified),label: 'Verifier',backgroundColor: textColor),
              BottomNavigationBarItem(icon:  Icon(Icons.add),label: 'Add',backgroundColor: textColor),
              BottomNavigationBarItem(icon:  Icon(Icons.message),label: 'Chats',backgroundColor: textColor),
              BottomNavigationBarItem(icon:  Icon(Icons.person_outline_sharp),label: 'Profile',backgroundColor: textColor),

            ],
            backgroundColor: textColor,
            onTap: (position){
              controller.currentindex.value = position;
              controller.pagecontroller.jumpToPage(position);
            },
            currentIndex: controller.currentindex.value,
            key: controller.bottomNavigationKey,
            unselectedItemColor: white,
            selectedItemColor: white,



            // barBackgroundColor: textColor,
            // inactiveIconColor: white,
            // circleColor: white,
            // activeIconColor: textColor,textColor: white,
            //
            // tabs: [
            //
            //   TabData(
            //       iconData: Icons.production_quantity_limits,
            //       title: 'Products'),
            //   TabData(iconData: Icons.verified, title: 'Verifier'),
            //   // TabData(iconData: Icons.home, title: 'Add products'),
            //   TabData(iconData: Icons.shopping_basket_sharp, title: 'Orders',),
            //   TabData(iconData: Icons.person_outline_sharp, title: 'Profile'),
            // ],
            // onTabChangedListener: (position) {
            //   controller.currentindex.value = position;
            //   controller.pagecontroller.jumpToPage(position);
            // },
            // initialSelection: controller.currentindex.value,
            // key: controller.bottomNavigationKey,
          );

          // return FancyBottomNavigation(
          //   tabs: [
          //     TabData(
          //         iconData: Icons.production_quantity_limits,
          //         title: 'Products'),
          //     TabData(iconData: Icons.verified, title: 'Verifier'),
          //     // TabData(iconData: Icons.home, title: 'Add products'),
          //     TabData(iconData: Icons.shopping_basket_sharp, title: 'Orders'),
          //     TabData(iconData: Icons.person_outline_sharp, title: 'Profile'),
          //   ],
          //   onTabChangedListener: (position) {
          //     controller.currentindex.value = position;
          //     controller.pagecontroller.jumpToPage(position);
          //   },
          //   initialSelection: controller.currentindex.value,
          //   key: controller.bottomNavigationKey,
          // );
        }));
  }
}
