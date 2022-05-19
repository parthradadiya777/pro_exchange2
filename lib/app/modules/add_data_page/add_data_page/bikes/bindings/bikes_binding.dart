import 'package:get/get.dart';

import '../controllers/bikes_controller.dart';

class BikesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BikesController>(
      () => BikesController(),
    );
  }
}
