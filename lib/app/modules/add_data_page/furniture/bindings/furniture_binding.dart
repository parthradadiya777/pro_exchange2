import 'package:get/get.dart';

import '../controllers/furniture_controller.dart';

class FurnitureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FurnitureController>(
      () => FurnitureController(),
    );
  }
}
