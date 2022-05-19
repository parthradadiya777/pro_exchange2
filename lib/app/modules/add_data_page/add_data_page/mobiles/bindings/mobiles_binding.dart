import 'package:get/get.dart';

import '../controllers/mobiles_controller.dart';

class MobilesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MobilesController>(
      () => MobilesController(),
    );
  }
}
