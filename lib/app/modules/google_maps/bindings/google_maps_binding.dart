import 'package:get/get.dart';

import '../controllers/google_maps_controller.dart';

class GoogleMapsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GoogleMapsController>(
      () => GoogleMapsController(),
    );
  }
}
