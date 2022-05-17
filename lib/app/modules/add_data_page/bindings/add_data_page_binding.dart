import 'package:get/get.dart';

import '../controllers/add_data_page_controller.dart';

class AddDataPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddDataPageController>(
      () => AddDataPageController(),
    );
  }
}
