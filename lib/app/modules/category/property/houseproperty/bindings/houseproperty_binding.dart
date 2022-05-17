import 'package:get/get.dart';

import '../controllers/houseproperty_controller.dart';

class HousepropertyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HousepropertyController>(
      () => HousepropertyController(),
    );
  }
}
