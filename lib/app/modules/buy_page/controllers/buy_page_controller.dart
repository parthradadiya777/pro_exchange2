import 'package:get/get.dart';

class BuyPageController extends GetxController {
  RxString buy = 'Buy'.obs;
  RxString exchange = 'Exchange'.obs;
  RxString bid = 'Bid'.obs;
  RxList<bool> isSelected = [true, false, false].obs;
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void togglebutton(int index) {
    for (int i = 0; i < isSelected.length; i++) {
      if (i == index) {
        isSelected[i] = true;
        //print(isSelected[i] = true);
      }
      isSelected[i] = false;
      //  print(isSelected[i] = false);
    }
    update();
  }
}
