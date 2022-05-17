import 'package:get/get.dart';

import '../controllers/printers_controller.dart';

class PrintersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrintersController>(
      () => PrintersController(),
    );
  }
}
