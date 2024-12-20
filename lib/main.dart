import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmgmt/core/constants/app_texts.dart';
import 'package:schoolmgmt/features/auth/bindings/auth_binding.dart';
import 'package:schoolmgmt/routes/app_routes.dart';
import 'package:schoolmgmt/routes/routes.dart';
import 'package:url_strategy/url_strategy.dart';

import 'core/controller/navigation_controller.dart';
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
        databaseURL: "https://schoolmgmt-2025.firebaseio.com",
      ),
    );
  } else {
    // Firebase configuration for other platforms
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  //runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(NavigationController(), permanent: true);
    return GetMaterialApp(
      defaultTransition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 1),
      initialBinding: AuthBinding(),
      title: TTexts.appName,
      getPages: TAppRoutes.pages,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 157, 109, 239)),
        useMaterial3: true,
      ),
      unknownRoute: GetPage(
          name: '/page-not-found',
          page: () => const Scaffold(
                body: Center(
                  child: Text("PAGE NOT FOUND"),
                ),
              )),
      initialRoute: TRoutes.home,
      debugShowCheckedModeBanner: false,
    );
  }
}
