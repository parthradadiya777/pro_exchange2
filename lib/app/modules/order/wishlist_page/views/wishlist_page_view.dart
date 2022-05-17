import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/wishlist_page_controller.dart';

class WishlistPageView extends GetView<WishlistPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WishlistPage'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'WishlistPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
