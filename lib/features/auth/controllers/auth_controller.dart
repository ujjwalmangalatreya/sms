import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:schoolmgmt/core/services/auth_services.dart';
import 'package:schoolmgmt/routes/routes.dart';

class AuthController extends GetxController {
  final AuthServices _authService = AuthServices();

  User? user;
  RxBool isLoading = false.obs;

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    User? result = await _authService.loginUser(email, password);
    if (result != null) {
      user = result;
      Get.offAllNamed(TRoutes.dashboard);
    } else {
      Get.snackbar("Error", "Invalid credentials");
    }
    isLoading.value = false;
  }

  Future<void> logout() async {
    await _authService.logOutUser();
    user = null;
    Get.offAllNamed(TRoutes.login);
  }
}
