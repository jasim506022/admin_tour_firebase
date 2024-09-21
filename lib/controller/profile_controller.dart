

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../repository/profile_repository.dart';
import '../res/apps_function.dart';
import '../res/routes/routes_name.dart';
import 'save_local.dart';

class ProfileController extends GetxController{
  ProfileRepository profileRepository;

  ProfileController(this.profileRepository);

  Future<void> signOut(BuildContext context) async {
    try {
      await profileRepository.signOut();
      if (!context.mounted) return;
      GoRouter.of(context).goNamed(RoutesName.initialRoute);
      SaveDataLocalStorage.saveCurrentRouthPath(RoutesPath.dashboardScreen);
      AppsFunction.showSnackBar(context, "Successfully Sign out");
    } catch (e) {
      AppsFunction.handleException(e);
    }
  }
}