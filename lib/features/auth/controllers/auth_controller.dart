import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:schoolmgmt/core/services/auth_services.dart';
import 'package:schoolmgmt/routes/routes.dart';

class AuthController extends GetxController {
  final AuthServices _authService = AuthServices();
  RxBool isLoading = false.obs;

  static AuthController get instance => Get.find();
  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

  bool get isAuthenticated => _auth.currentUser != null;

  @override
  void onReady() {
    _auth.setPersistence(Persistence.LOCAL);
  }

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    User? result = await _authService.loginUser(email, password);
    if (result != null) {
      Get.offAllNamed(TRoutes.dashboard);
    } else {
      Get.snackbar("Error", "Invalid credentials");
    }
    isLoading.value = false;
  }

  Future<void> logout() async {
    await _authService.logOutUser();
    Get.offAllNamed(TRoutes.login);
  }
}
