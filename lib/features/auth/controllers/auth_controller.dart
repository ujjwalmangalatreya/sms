import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:schoolmgmt/routes/routes.dart';

class AuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  var user = Rxn<User>();
  var isLoading = false.obs;

  @override
  void onInit() {
    user.bindStream(_firebaseAuth.authStateChanges());
    super.onInit();
  }

  //Login with email and Password

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    isLoading.value = true;
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // ignore: unused_local_variable
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided';
      } else {
        errorMessage = 'An error occured : ${e.message}';
      }
      Get.snackbar(
        'Login Failed',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
    Get.offAllNamed(TRoutes.login);
  }
}
