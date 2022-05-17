import 'package:get/get.dart';

import '../controllers/site_plots_controller.dart';

class SitePlotsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SitePlotsController>(
      () => SitePlotsController(),
    );
  }
}
