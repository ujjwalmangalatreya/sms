import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:schoolmgmt/features/home_screen.dart/home_screen.dart';
import 'package:schoolmgmt/routes/app_pages.dart';
import 'package:schoolmgmt/routes/app_routes.dart';
import 'package:url_strategy/url_strategy.dart';
import 'firebase_options.dart';

Future<void> main() async {
  setPathUrlStrategy();
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
    return GetMaterialApp(
      title: 'School Management System',
      getPages: AppPages.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 157, 109, 239)),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.initialRoutes,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
