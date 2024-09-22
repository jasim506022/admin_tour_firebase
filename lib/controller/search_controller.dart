import 'package:bd_tour_firebase_admin/controller/tour_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/tour_model.dart';

class SearchControllers extends GetxController {
  TextEditingController searchTourTextTEC = TextEditingController();
  var tourController = Get.find<TourController>();

  var searchTourList = <TourModel>[].obs;

  var allTourList = <TourModel>[].obs;

  var isSearch = false.obs;

  void filterUser(String text) {
    searchTourList.clear();
    var searchText = text.toLowerCase();
    for (var tourModel in allTourList) {
      if (tourModel.name!.toLowerCase().contains(searchText)) {
        searchTourList.add(tourModel);
      }
    }
    isSearch.value = true;
  }
}
