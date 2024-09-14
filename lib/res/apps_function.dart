import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

import '../controller/main_page_controller.dart';
import '../controller/save_local.dart';
import '../data/response/app_exception.dart';
import '../model/menu_model.dart';
import '../widget/alert_dialog_widget.dart';
import 'apps_colors.dart';

class AppsFunction {
  static void flutterToast({required String title}) {
    Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER_RIGHT,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static bool isValidEmail(String email) {
    String emailRegex = r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)*[a-zA-Z]{2,7}$';
    RegExp regex = RegExp(emailRegex);
    return regex.hasMatch(email);
  }

  static void navigatorChange(BuildContext context,
      MainPageController controller, SidebarItem sidebarItem) {
    context.goNamed(sidebarItem.value);
    controller.onChangeState(currentState: sidebarItem.value);
    SaveDataLocalStorage.saveCurrentRouthPath(sidebarItem.pathName);
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold),
        ),
        duration: const Duration(seconds: 4),
        backgroundColor: AppColors.red,
      ),
    );
  }

  static void handleException(Object e) {
    if (e is FirebaseAuthException) {
      throw FirebaseAuthExceptions(e);
    } else if (e is FirebaseException) {
      throw FirebaseExceptions(e);
    } else if (e is SocketException) {
      throw InternetException(e.toString());
    } else if (e is PlatformException) {
      throw PlatformExceptions(e);
    } else if (e is FileSystemException) {
      throw FileSystemExceptions(e.toString());
    } else if (e is OutOfMemoryError) {
      throw OutOfMemoryErrors(e.toString());
    } else if (e is TimeoutException) {
      throw TimeOutExceptions(e.message.toString());
    } else {
      throw OthersException(e.toString());
    }
  }

  static void showMyDialog(
      {required BuildContext context,
      // required String animationAssets,
      required String title,
      // String? content,
      // String? buttonText,
      bool? barrierDismissible}) async {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible ?? true,
      builder: (BuildContext context) {
        return AlertDialogWidget(
          title: title,
        );
      },
    );
  }
}
