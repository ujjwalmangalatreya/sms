import 'package:get/get.dart';

class NavigationController extends GetxController {
  RxInt currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
    switch (index) {
      case 0:
        Get.offNamed('/dashboard');
        break;
      case 1:
        Get.offNamed('/students');
        break;
      case 2:
        Get.offNamed('/employee');
      case 3:
        Get.offNamed('/profile');

        break;
    }
  }
}
