import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../repository/login_repository.dart';
import '../res/apps_function.dart';
import '../res/routes/routes_name.dart';

class LoginController extends GetxController {
  final LoginRepository _loginRepository = LoginRepository();
  final TextEditingController passwordTEC = TextEditingController();
  final TextEditingController emailTEC = TextEditingController();

  Future<void> loginButton(BuildContext context) async {
    await _loginRepository.signWithEmailPassword(
        email: emailTEC.text, password: passwordTEC.text);

    if (!context.mounted) return;
    context.goNamed(RoutesName.mainPage);
    AppsFunction.flutterToast(title: "Successfully");
  }

  @override
  void onClose() {
    passwordTEC.dispose();
    emailTEC.dispose();
    super.onClose();
  }
}
