import 'package:get/get.dart';
import 'package:schoolmgmt/core/services/auth_services.dart';
import 'package:schoolmgmt/routes/routes.dart';

class AuthController extends GetxController {
  final AuthServices _authService = AuthServices();

  Rxn user = Rxn();
  RxBool isLoading = false.obs;

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    var result = await _authService.loginUser(email, password);
    print(result);
    if (result != null) {
      user.value = result;
      Get.offAllNamed(TRoutes.dashboard); // Navigate to Home on success
    } else {
      Get.snackbar("Error", "Invalid credentials");
    }
    isLoading.value = false;
  }

  Future<void> logout() async {
    await _authService.logOutUser();
    user.value = null;
    Get.offAllNamed(TRoutes.login);
  }
}
