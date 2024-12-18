import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthServices  extends GetxService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
 final  Rx<User?> _user = Rxn<User?>(null);
 Stream<User?> get authStateChanges => _auth.authStateChanges();
  //final DatabaseReference _db = FirebaseDatabase.instance.ref();

  //Register a Uase
  //TODO : Will not register user for now..

  // Login user

  Future<User?> loginUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return null;
  }

  // Log Out

  Future<void> logOutUser() async {
    await _auth.signOut();
  }

  @override
  void onInit() {
    super.onInit();
    ever(_user, (value) {
      // Update UI based on user changes
      print('User state changed: $value');
    });
    _user.bindStream(_auth.authStateChanges());
  }
}
