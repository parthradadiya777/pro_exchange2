import 'package:get/get.dart';

import '../controllers/comuters_leptop_controller.dart';

class ComutersLeptopBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComutersLeptopController>(
      () => ComutersLeptopController(),
    );
  }
}
