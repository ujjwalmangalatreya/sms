import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmgmt/features/auth/controllers/auth_controller.dart';
import 'package:schoolmgmt/routes/routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return AuthController.instance.isAuthenticated
        ? null
        : RouteSettings(name: TRoutes.login);
  }
}
