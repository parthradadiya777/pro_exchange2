import 'package:get/get.dart';

import '../controllers/printer_moniter_controller.dart';

class PrinterMoniterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrinterMoniterController>(
      () => PrinterMoniterController(),
    );
  }
}
