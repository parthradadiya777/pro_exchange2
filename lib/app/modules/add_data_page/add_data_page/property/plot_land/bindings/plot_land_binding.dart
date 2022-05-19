import 'package:get/get.dart';

import '../controllers/plot_land_controller.dart';

class PlotLandBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlotLandController>(
      () => PlotLandController(),
    );
  }
}
