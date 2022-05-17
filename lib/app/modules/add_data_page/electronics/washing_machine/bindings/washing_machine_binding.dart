import 'package:get/get.dart';

import '../controllers/washing_machine_controller.dart';

class WashingMachineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WashingMachineController>(
      () => WashingMachineController(),
    );
  }
}
