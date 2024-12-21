import 'package:get/get.dart';
import 'package:schoolmgmt/features/profile/controllers/profile_controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());

    print("Bindings....1");
    Get.put(ProfileController());
  }
}
