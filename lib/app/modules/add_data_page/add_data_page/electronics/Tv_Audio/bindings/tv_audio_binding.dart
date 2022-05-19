import 'package:get/get.dart';

import '../controllers/tv_audio_controller.dart';

class TvAudioBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TvAudioController>(
      () => TvAudioController(),
    );
  }
}
