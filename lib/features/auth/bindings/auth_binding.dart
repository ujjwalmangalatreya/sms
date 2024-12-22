import 'package:get/get.dart';
import 'package:schoolmgmt/core/services/auth_services.dart';
import 'package:schoolmgmt/features/auth/controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
    Get.put(AuthServices());
  }
}
