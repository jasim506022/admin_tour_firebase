import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../const/const.dart';
import '../data/response/app_exception.dart';
import '../model/menu_model.dart';
import '../repository/main_repository.dart';
import '../res/apps_function.dart';
import '../res/routes/routes_name.dart';
import '../res/string_constant.dart';
import 'save_local.dart';

class MainPageController extends GetxController {
  var isLoading = false.obs;

  var currentState = SidebarItem.dashboardScreen.value.obs;
  var currentPath = SidebarItem.dashboardScreen.pathName.obs;

  MainRepository mainRepository;

  MainPageController({required this.mainRepository});

  void onChangeState({required String currentState}) {
    this.currentState.value = currentState;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> summerySnapshot(
      {required String collection, required BuildContext context}) {
    try {
      return mainRepository.summerySnapshot(collection: collection);
    } catch (e) {
      if (e is AppException) {
        AppsFunction.showSnackBar(context, e.message!);
      }
      rethrow;
    }
  }

  void updateStateBasedOnRoute(String currentPath) {
    switch (currentPath) {
      case RoutesPath.dashboardScreen:
        onChangeState(currentState: SidebarItem.dashboardScreen.value);
        break;
      case RoutesPath.addTourScreen:
        onChangeState(currentState: SidebarItem.addTourScreen.value);
        break;
      case RoutesPath.tourScreen:
        onChangeState(currentState: SidebarItem.tourScreen.value);
        break;
      case RoutesPath.searchScreen:
        onChangeState(currentState: SidebarItem.searchScreen.value);
        break;
      case RoutesPath.profileScreen:
        onChangeState(currentState: SidebarItem.profileScreen.value);
        break;
      default:
        onChangeState(currentState: SidebarItem.dashboardScreen.value);
        break;
    }
  }

  Future<void> updateLocalData(BuildContext context) async {
    final categories =
        sharedPreference!.getStringList(StringConstant.categoriesSharePre);
    final allCategories =
        sharedPreference!.getStringList(StringConstant.allCategoriesSharePre);
    if (categories == null && allCategories == null) {
      try {
        isLoading.value = true;

        var firestore = await mainRepository.getCategories();
        List<dynamic> fetchedCategories = firestore.data()?["categories"] ?? [];
        SaveDataLocalStorage.saveCategories(fetchedCategories);
        isLoading.value = false;
      } catch (e) {
        AppsFunction.showSnackBar(context, e.toString());
      } finally {
        isLoading.value = false;
      }
    }
  }
}
