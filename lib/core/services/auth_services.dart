import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
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
}
