import 'package:get/get.dart';

import '../controllers/purchase_product_controller.dart';

class PurchaseProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PurchaseProductController>(
      () => PurchaseProductController(),
    );
  }
}
