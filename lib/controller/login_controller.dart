
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../data/response/app_exception.dart';
import '../repository/login_repository.dart';
import '../res/apps_function.dart';
import '../res/routes/routes_name.dart';

class LoginController extends GetxController {
  final LoginRepository loginRepository;

  LoginController({required this.loginRepository});

  final TextEditingController passwordTEC = TextEditingController();
  final TextEditingController emailTEC = TextEditingController();

  Future<void> loginButton(BuildContext context) async {
    try {
      await loginRepository.signWithEmailPassword(
          email: emailTEC.text, password: passwordTEC.text);

      if (!context.mounted) return;
      context.goNamed(RoutesName.mainPage);
      AppsFunction.showSnackBar(context, "Login in Successfully");
    } catch (e) {
      if (e is AppException) {
        AppsFunction.showSnackBar(context, e.message!);
      }
    }
  }

  @override
  void onClose() {
    passwordTEC.dispose();
    emailTEC.dispose();
    super.onClose();
  }

  void navigateToNextPage(BuildContext context) async {
    await Future.delayed(Duration.zero);
    var currentUser = await loginRepository.getCurrentUser();
    if (currentUser != null) {
      if (!context.mounted) return;
      context.goNamed(RoutesName.mainPage);
    }
  }
}
