import 'package:bd_tour_firebase_admin/model/user_model.dart';
import 'package:bd_tour_firebase_admin/repository/user_repository.dart';
import 'package:bd_tour_firebase_admin/res/apps_function.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/response/app_exception.dart';

class UserController extends GetxController {
  UserRepository repository;

  UserController(this.repository);

  TextEditingController searchUserTextTEC = TextEditingController();

  var searchUserList = <UserModel>[].obs;

  var allUserList = <UserModel>[].obs;

  var isSearchUser = false.obs;

  void filterUser(String text) {
    searchUserList.clear();
    var searchText = text.toLowerCase();
    for (var userModel in allUserList) {
      if (userModel.name!.toLowerCase().contains(searchText)) {
        searchUserList.add(userModel);
      }
    }
    isSearchUser.value = true;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> userSnapshot(
      BuildContext context) {
    try {
      return repository.userSnapshot();
    } catch (e) {
      if (e is AppException) {
        AppsFunction.showSnackBar(context, e.message!);
      }
      rethrow;
    }
  }
}
