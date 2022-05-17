import 'package:get/get.dart';

import '../controllers/verifiers_controller.dart';

class VerifiersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifiersController>(
      () => VerifiersController(),
    );
  }
}
