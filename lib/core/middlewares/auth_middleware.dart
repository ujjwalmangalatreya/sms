import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmgmt/features/auth/controllers/auth_controller.dart';
import 'package:schoolmgmt/routes/routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final AuthController authController = Get.find<AuthController>();
    print("Here....................");
    print(authController.user);
    if (authController.user == null) {
      return const RouteSettings(name: TRoutes.login);
    }

    return null;
  }
}
