import 'package:get/get.dart';

import '../controllers/washingmachine_controller.dart';

class WashingmachineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WashingmachineController>(
      () => WashingmachineController(),
    );
  }
}
