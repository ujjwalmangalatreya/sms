import 'package:get/get.dart';
import 'package:schoolmgmt/features/auth/controllers/auth_controller.dart';

class AuthBiniding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
