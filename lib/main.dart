import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:schoolmgmt/screens/welcome/welcome_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    // Firebase configuration for web
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyBqbaN9dfjS3BHBRpPkEKD131eCBVNsEgw",
        authDomain: "schoolmgmt-2025.firebaseapp.com",
        projectId: "schoolmgmt-2025",
        storageBucket: "schoolmgmt-2025.firebasestorage.app",
        messagingSenderId: "907084167150",
        appId: "1:907084167150:web:f7ccd4e36432c83480c0ff",
      ),
    );
  } else {
    // Firebase configuration for other platforms
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School Management System',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home:  WelcomeScreen(),
    );
  }
}

