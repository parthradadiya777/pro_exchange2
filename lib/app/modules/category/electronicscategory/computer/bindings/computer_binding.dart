import 'package:get/get.dart';

import '../controllers/computer_controller.dart';

class ComputerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComputerController>(
      () => ComputerController(),
    );
  }
}
