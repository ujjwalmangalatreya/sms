import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:schoolmgmt/core/services/auth_services.dart';
import 'package:schoolmgmt/routes/routes.dart';

class AuthController extends GetxController {
  final AuthServices _authService = AuthServices();
  RxBool isLoading = false.obs;

  static AuthController get instance => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> firebaseUser = Rxn<User>();

  User? get authUser => firebaseUser.value;

  bool get isAuthenticated => authUser != null;

  @override
  void onReady() {
    super.onReady();
    firebaseUser.bindStream(_auth.authStateChanges());
    ever(firebaseUser, _setInitialRoute);
  }

  void _setInitialRoute(User? user) {
    if (user == null) {
      Get.offAllNamed(TRoutes.home);
    } else {
      Get.offAllNamed(TRoutes.dashboard);
    }
  }

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;
      User? result = await _authService.loginUser(email, password);
      if (result != null) {
        Get.offAllNamed(TRoutes.dashboard);
      } else {
        Get.snackbar("Error", "Invalid credentials");
      }
    } catch (e) {
      Get.snackbar("Login Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    Get.offAllNamed(TRoutes.login);
  }
}
