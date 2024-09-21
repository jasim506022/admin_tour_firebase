import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/response/app_exception.dart';
import '../model/guide_model.dart';
import '../repository/guide_repository.dart';
import '../res/apps_function.dart';

class GuideController extends GetxController {

  GuideRepository repository;

  GuideController(this.repository);

  TextEditingController searchGuideTextTEC = TextEditingController();

  var searchGuideList = <GuideModel>[].obs;

  var allGuideList = <GuideModel>[].obs;

  var isSearchGuide = false.obs;

  void filterGuiders(String text) {
    searchGuideList.clear();
    var searchText = text.toLowerCase();
    for (var guideModel in allGuideList) {
      if (guideModel.name!.toLowerCase().contains(searchText)) {
        searchGuideList.add(guideModel);
      }
    }
    isSearchGuide.value = true;
  }

  void searchingAddGuide({required GuideModel guideModel}) {}

  Stream<QuerySnapshot<Map<String, dynamic>>> guideSnapshot(
      BuildContext context) {
    try {
      return repository.guideSnapshot();
    } catch (e) {
      if (e is AppException) {
        AppsFunction.showSnackBar(context, e.message!);
      }
      rethrow;
    }
  }
}
