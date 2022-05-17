import 'package:get/get.dart';

import '../controllers/flats_controller.dart';

class FlatsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FlatsController>(
      () => FlatsController(),
    );
  }
}
